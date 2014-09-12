=================
Local development
=================

If your code works with django CMS, you can expect it to work with Aldryn.

One of Aldryn's most important features is the way it allows you to deploy your own Django code
while providing you with a comfortable and familiar local environment for development.

Aldryn provides a fairly standard Django environment, which means that just about any Django code
can be deployed to Aldryn. It does however have some specific requirements. In order to be sure
that your code will run as expected on our cloud-based servers, the local environment it provides
replicates as far as possible the one your code will encounter when deployed.

.. ATTENTION::
   This documentation is currently in development. We'd be delighted to have :doc:`your feedback,
   or even better, your contributions </improving>`. This documentation is on `GitHub
   <https://github.com/aldryn/aldryn-docs>`_


Replicate your Aldryn site locally
==================================

You'll need the :ref:`Aldryn command-line client <aldryn_client>` installed, and a site - even the
most basic one will do - that's active on Aldryn.


The Aldryn client
-----------------

The client's available from PyPI::

    pip install aldryn-client

Replicate your Aldryn site locally
----------------------------------

Login to your Aldryn account::

    aldryn login

Now you need to replicate your Aldryn site in a local workspace::

    aldryn workspace create --sitename=<sitename> # substitute your actual site
    name

It'll take a few minutes to download and install all the dependencies. What you'll
see unfolding in your terminal is just what happens on the Aldryn server when you
create a new site.

Your Aldryn environment is in the ``<sitename>`` directory that has just been
created. Within it you'll find:

* ``.site`` - the Django project, complete with `manage.py`, settings, site static
  files and so on
* ``.virtualenv`` - the virtualenv for the Aldryn environment

Set up the local database
-------------------------

You'll need to get a local copy of your Aldryn database running.

Aldryn uses Postgres, so you will need a `PostgreSQL <http://www.postgresql.org>`_ server running
locally too.

In the Aldryn control panel, the *Manage this website* section offers options for
downloading and restoring databases. Create a new backup of your site, refresh the
page, and download the backup you have just created.

Unpack the .tar file that has been downloaded. This contains the database, media files, and more.
Using your local PostgreSQL database client, import the ``database.dump`` file, and make sure that
the new database's name and any permissions match those in the local site's settings.

Use local settings
------------------

You're going to need to adjust the settings for your local version of the project, so that it can
use your local database.

.. ATTENTION::
    Note that any changes you make locally to ``settings.py`` will not only not have any affect on
    Aldryn, the next time you synchronise your local project with the Aldryn version, those local
    changes will be lost. Try to avoid such changes altogether - mostly, they shouldn't be needed.

Rather than make changes to ``settings.py``, override the ``DATABASE_URL`` by setting an an
*environment variable*.

Create a file ``.env`` in the root of your site directory, containing::

    DATABASE_URL=postgres://postgres:@127.0.0.1:5432/<database_name>

Obviously, ``<database_name>`` needs to match the one you have created.

If you need to do anything more complex, you can use an environment variable to point to a local
`settings file <https://docs.djangoproject.com/en/dev/topics/settings/#designating-the-settings>`_.

In your ``.env`` file::

    DJANGO_SETTINGS_MODULE=local_settings

And in ``local_settings.py`` import all the settings from the settings file from Aldryn, overriding
the ones you need to::

    from settings import *
    # override settings as required

For example to add a new application to ``INSTALLED_APPS`` (if the application has not already been
installed in the project on Aldryn)::

    INSTALLED_APPS += [
        'my_new_plugin',
        ]

Let's go
--------

You need to activate this new virtualenv, and fire up the Django runserver::

    source .virtualenv/bin/activate
    python .site/manage.py runserver

.. ATTENTION::
    Note that if you start the runserver, and try to visit a page on the site that
    requires database access *before* you have suplied database settings, the process
    won't exit when you quit the runserver. You'll need to find and kill the process
    manually before restarting it::

        ps aux | grep manage  # returns a list of matching processes
        kill <process_number>

You should see your site, or at least the "Your site is ready" message, and be
able to log into it.

Create a new Addon
==================

An Addon must conform to certain standards, but apart from some minor additional configuration
required for Aldryn, as long as your Addon is well-packaged you should not encounter any difficulty.

For the purposes of this walkthrough, we'll create a basic plugin that greets the logged-in user by
name. See `custom plugins
<http://docs.django-cms.org/en/latest/extending_cms/custom_plugins.html>`_ in the django CMS
documentation for more information.

We'll create a new Django application for the plugin::

    python manage.py startapp say-hello-plugin

This will create a standard Django application structure.

Create a ``cms_plugins.py`` file in the new application::

    from cms.plugin_base import CMSPluginBase
    from cms.plugin_pool import plugin_pool
    from cms.models.pluginmodel import CMSPlugin

    class SayHello(CMSPluginBase):
        model = CMSPlugin
        render_template = "say_hello/hello.html"

    plugin_pool.register_plugin(SayHello)

And in its ``templates`` directory, a ``hello.html`` file::

    <h1>Hello
        {% if request.user.is_authenticated %}
            {{ request.user.first_name }} {{ request.user.last_name}}
        {% else %}
            Guest
        {% endif %}
    </h1>

Note that while developing locally, you will need to add ``say_hello`` to ``INSTALLED_APPS`` - use the ``local_settings`` method described above.

Try it out: add your plugin to a page.

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
    One thing to be aware of is that your local environment may be slightly more forgiving that
    Aldryn's; for example, depending upon where you're keeping your work in progress, you may find
    that some of your Addon's components are available to Django not because you've packaged them
    correctly, but simply in virtue of where you have put them while working on them!

A minimal ``setup.py`` file for our example plugin is shown below. You will also need a suitable
``MANIFEST.in``, and to ensure that you have created an appropriate directory structure.

::

    from setuptools import setup, find_packages

    setup(
        name="say-hello-plugin",
        version="0.0.1",
        long_description=__doc__,
        packages=find_packages(),
        include_package_data=True,
        zip_safe=False,
    )

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
        "description": "This is my custom application.",
        "package-name": "say-hello-plugin",
    	"url": "https://example.com",
        "installed-apps": [
            "say_hello"
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

    say-hello-plugin/
        setup.py
        LICENCE.txt
        MANIFEST.in
        addon.json
        say_hello/
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
