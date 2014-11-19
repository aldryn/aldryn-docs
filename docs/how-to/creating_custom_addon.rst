=====================
Create a custom Addon
=====================

In the :doc:`introduction/index` we got an Aldryn site running in a local environment. If you haven't got to that
stage yet, you should to follow that tutorial first before returning here to continue.

An Addon must conform to certain standards, but apart from some minor additional configuration
required for Aldryn, as long as your Addon is well-packaged you should not encounter any difficulty.

For the purposes of this walkthrough, we'll create a basic plugin that greets the logged-in user by name. See `custom
plugins <http://docs.django-cms.org/en/latest/extending_cms/custom_plugins.html>`_ in the django CMS documentation
for more information.

We'll create a new Django application for the plugin::

    python .site/manage.py startapp hello_plugin

This will create a standard Django application structure.

Create a ``cms_plugins.py`` file in the new application::

    from cms.plugin_base import CMSPluginBase
    from cms.plugin_pool import plugin_pool
    from cms.models.pluginmodel import CMSPlugin


    class SayHello(CMSPluginBase):
        model = CMSPlugin
        render_template = "hello_plugin/hello.html"
        text_enabled = True


    plugin_pool.register_plugin(SayHello)

And in its ``templates/hello_plugin`` directory, a ``hello.html`` file::

    Hello
    {% if request.user.is_authenticated %}
        {{ request.user.first_name }} {{ request.user.last_name}}
    {% else %}
        Guest
    {% endif %}

This new application needs to be in ``INSTALLED_APPS``. However, ``settings.py`` is in ``.site``, and we want to avoid touching anything there.

Instead we'll use the ``.env`` file we created in the previous tutorial to set an environment variable, referring Django to a ``local_settings.py`` file in the ``dev`` directory::

    DJANGO_SETTINGS_MODULE=local_settings

In ``local_settings.py``, we  import all the names from ``settings``, and append our new application's name to ``INSTALLED_APPS``::

    from settings import *
    # override settings as required

    INSTALLED_APPS += [
        'hello_plugin',
        ]

Try it out: start the runserver, and add your plugin to a page

Package and upload your Addon
=============================

The special requirements for Addon packaging - in essence, an ``addon.json`` file containing
information about the Addon - are in discussed in further detail in :ref:`addon-packaging`.

The Aldryn client includes a validation tool, that will report on problems it finds in your Addon.

::

    aldryn addon validate

``setup.py``
------------

You'll need to package your application in the usual Python way, and test that it installs as
expected.

.. WARNING::
    One thing to be aware of is that your local environment may be slightly more forgiving than
    Aldryn's; for example, depending upon where you're keeping your work in progress, you may find
    that some of your Addon's components are available to Django not because you've packaged them
    correctly, but simply in virtue of where you have put them while working on them!

A minimal ``setup.py`` file for our example plugin is shown below. You will also need a suitable
``MANIFEST.in``, and to ensure that you have created an appropriate directory structure.

::

    from setuptools import setup, find_packages

    setup(
        name="hello-plugin",
        version="0.0.1",
        long_description=__doc__,
        packages=find_packages(),
        include_package_data=True,
        zip_safe=False,
    )

MANIFEST.in
-----------

::

    recursive-include hello_plugin/templates *

LICENCE.txt
-----------

A licence file is required. This may not matter very much if you're just using your application on
your own sites, but if you plan to put it on the Aldryn Marketplace you should think carefully
about appropriate licence terms.

``addon.json``
--------------

For example::

    {
        "name": "Say Hello Plugin",
        "description": "Greets the user by name.",
        "package-name": "hello-plugin",
    	"url": "https://example.com",
        "installed-apps": [
            "hello_plugin"
        ],
        "author": {
            "name": "Divio",
            "url": "https://www.aldryn.com"
        },
        "license": {
            "name": "BSD"
        }
    }

Package structure
-----------------

At minimum, your new package will need to follow the standard Python structure, along these lines::

    hello-plugin/
        setup.py
        LICENCE.txt
        MANIFEST.in
        addon.json
        hello_plugin/
            __init__.py
            models.py
            tests.py
            views.py
            templates

Upload
------

When you're satisfied that all is correct, upload your Addon::

    aldryn addon upload

Your Addon is now in the Aldryn Marketplace, in the **Owned by me** list (it won't be publicly
available) and ready to be installed.

Install and deploy
==================

Install the plugin now as you'd install any other, and deploy your changes. A few minutes later,
you should be up and running and able to use your application in Aldryn.
