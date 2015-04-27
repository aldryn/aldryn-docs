#####################
Create a custom Addon
#####################

In the :doc:`/introduction/index` we got an Aldryn site running in a local environment. If you haven't got to that
stage yet, you should follow that tutorial first before returning here to continue.

An Addon must conform to certain standards, but apart from some minor additional configuration required for Aldryn, as
long as your Addon is well-packaged you should not encounter any difficulty. The good news is that Aldryn even helps
package it.

*********************************
Create a simple django CMS plugin
*********************************

For the purposes of this walkthrough, we'll create a basic plugin that greets the logged-in user by name.

If you already have a plugin or other Addon to upload, you can :ref:`skip to the next section <package_your_addon>`.

See `custom plugins <http://docs.django-cms.org/en/latest/extending_cms/custom_plugins.html>`_ in the django CMS
documentation for more information about plugins.

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

.. _package_your_addon:

******************
Package your Addon
******************

Creating packages, especially if you've not done it before, can be tricky and frustrating to get right. The Aldryn
Control Panel takes much of the hard work out of the process for you, automatically generating several of the files
you'd otherwise have to write yourself.

In the `Aldryn Control Panel <https://control.aldryn.com/control/>`_, select `My Addons
<https://control.aldryn.com/account/my-addons/>`_, then `Add custom Addon
<https://control.aldryn.com/account/my-addons/new/>`_.

You need to give your Addon a ``Name`` (a human-friendly name) and a ``Package name`` (a computer-friendly slug,
containing only letters, numbers, underscores and hyphens)

The Addon can belong to an Organisation, and have a licence, but these are both optional. However, if you don't choose
a licence, you should add your own later. Note that an Addon can't be shared without a licence file.

When you hit **Create Addon**, you'll be taken to a page listing a number of the files you'll need in order to package
your Addon.

Let's download and look at these files one-by-one.

``addon.json``
==============

The special requirements for Addon packaging are dealt with in an ``addon.json`` file containing information about the
Addon. They are are in discussed in further detail in :ref:`addon-packaging`, but in brief it contains a dictionary
that describes the Addon to Aldryn.

You'll see that yours defines the ``package_name`` that you provided earlier, and ensures that it's also going to be
listed in the Django ``INSTALLED_APPS`` setting.

If your Addon needs other applications to be in ``INSTALLED_APPS`` you can of course add those too - but you'll need to
know how to use Python's packaging to ensure that they're actually installed along with your Addon.

In fact all these files can be edited to meet more complex needs.

``setup.py``
============

An Addon needs to be packaged in the usual Python way, starting with the ``setup.py`` file.

Again, Aldryn provides a minimal but adequate file ready for you to use.

``MANIFEST.in``
===============

The ``MANIFEST.in`` file lists the locations of resources such as templates that need to be included in an installation.

``LICENSE.txt``
===============

A licence file is required. This may not matter very much if you're just using your application on
your own sites, but if you plan to put it on the Aldryn Marketplace you should think carefully
about appropriate licence terms.

``README.rst``
==============

Your ``README.rst`` will be empty until you provide a ``Description`` and **Save** the Addon - but of course you can
edit the README file manually too.

``__init.py__``
===============

Finally, you have an ``__init.py__`` that provides a ``__version__`` (that starts at "0.0.1" by default).

These files should all be placed in the root directory of your Addon, leaving you with a file structure that looks
like::

    my-new-addon/
        addon.json
        setup.py
        MANIFEST.in
        LICENSE.txt
        README.rst
        my_new_addon/
            __init__.py
            models.py
            tests.py
            views.py
            templates

********
Test it!
********

The Aldryn client includes a validation tool, that will report on problems it finds in your Addon.

::

    aldryn addon validate

Now check, in your local development environment, that your newly-packaged Addon can be successfully installed.

.. WARNING::
    One thing to be aware of is that your local environment may be slightly more forgiving than
    Aldryn's; for example, depending upon where you're keeping your work in progress, you may find
    that some of your Addon's components are available to Django not because you've packaged them
    correctly, but simply in virtue of where you have put them while working on them!

***********************
Add further information
***********************

If your Addon's only for private use, you don't need to add more. If you'd like other people to make use of it, add
some more information about it. ``Additional information`` is particularly aimed at other developers who may be
interested in the code or documentation; ``Marketing information`` will help your Addon look attractive to users
browsing the Aldryn Marketplace.

``Publish on django-cms.org`` will mean that it's also listed amongst the `django CMS Addons
<https://www.django-cms.org/en/add-ons/>`_.

*******
Upload
*******

When you're satisfied that all is correct, you're ready to upload your Addon to Aldryn::

    aldryn addon upload

Your Addon is now in the Aldryn Marketplace and ready to be installed.

Once it has been uploaded, you have the option to make your Addon publicly available in its configuration settings,
from the Control Panel. Note that once made public, an Addon can't be made private again.

******************
Install and deploy
******************

In an Aldryn project Control Panel, install the Addon now as you'd install any other, and deploy your changes. A few
minutes later, you should be up and running and able to use your application in Aldryn.

And if you made it publicly available, other Aldryn users will be able to do the same.
