=================
Local development
=================

If your code works with django CMS, you can expect it to work with Aldryn.

Aldryn provides a fairly standard Django environment, which means that just about any Django code
can be deployed to Aldryn. It does however have some specific requirements. In order to be sure that
your code will run as expected in the Aldryn enviroment, the platform gives you a way to set it up
locally to test it.

.. ATTENTION::
   This guide expects you to have already :doc:`created a site on Aldryn <create_site>`.
   You should also have some basic experience creating Django applications.


Replicate your Aldryn site locally
==================================

You'll need the :ref:`Aldryn client <aldryn_client>` installed, and a site - even the most basic one
will do - that's active on Aldryn.

The Aldryn client
-----------------

Install the client in a virtualenv::

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

Your Aldryn environment is in the `<sitename>` directory that has just been
created. Within it you'll find:

* `.site` - the Django project, complete with `manage.py`, settings, site static
  files and so on
* `.virtualenv` - the virtualenv for the Aldryn environment

Test the replicated site
------------------------

You need to activate this new virtualenv, and fire up the runserver::

    source .virtualenv/bin/activate
    python .site/manage.py runserver

Note that if you fire up the runserver, and try to visit a page on the site that
requires database access *before* you have suplied database settings, the process
won't exit when you quit the runserver. You'll need to find and kill the process
manually::

    ps aux | grep manage  # returns a list of matching processes
    kill <process_number>

Set up the local database
-------------------------

You'll need to get a local copy of your Aldryn database running.

In the Aldryn control panel, the *Manage this website* section offers options for
downloading and restoring databases. Create a new backup of your site, refresh the
page, and download the backup you have just created.

Unpack the .tar file that has been downloaded. This contains the database, media
files, and more. Using your local PostgreSQL database client, import the
database.dump file, and make sure that the new database's name and any perm
issions match those in the local site's settings.

Use local settings
------------------

You're going to need to adjust the settings for your local version of the project,
so that can use your local database. You shouldn't touch the `settings.py` that
you pulled down from Aldryn though - if you do, your Aldryn site will no longer
work.

Instead, override the `DATABASE_URL` by setting an an *environment variable*.

Create file `.env` in the root of your site directory, containing::

    DATABASE_URL=postgres://postgres:@127.0.0.1:5432/<database_name>

Obviously, `<database_name>` needs to match the one you have created.

..
    If you need to do anything more complex, you can use an environment variable to
    point to a local settings file:
    https://docs.djangoproject.com/en/dev/topics/settings/#designating-the-settings.
    In it, import all the settings from the settings file from Aldryn, and override
    the ones you need it to::

        DJANGO_SETTINGS_MODULE=local_settings

    And your in your local_settings::

        from settings import *
        # override settings as required

Let's go
--------

And now you're ready to go::

    python .site/manage.py runserver

You should see your site, or at least the "Your site is ready" message, and be
able to log into it.

Create a new Addon
==================

An Addon must conform to certain standards, but apart from some minor additional configuration
required for Aldryn, as long as your Addon is well-packaged you should not encounter any difficulty.

..
    For the purposes of this walkthrough, we'll create a basic plugin. See for `custom plugins
    <http://docs.django-cms.org/en/latest/extending_cms/custom_plugins.html>`_ in the django CMS documentation for more information.

    We'll create a new Django application for the plugin::

        python manage.py startapp <some_name>

    This will create a standard Django application structure.

    from cms.plugin_base import CMSPluginBase
    from cms.plugin_pool import plugin_pool
    from cms.models.pluginmodel import CMSPlugin

    class HelloPlugin(CMSPluginBase):
        model = CMSPlugin
        render_template = "hello_plugin.html"

    plugin_pool.register_plugin(HelloPlugin)

    hello_plugin.html:

    <h1>Hello {% if request.user.is_authenticated %}{{ request.user.first_name }} {{
    request.user.last_name}}{% else %}Guest{% endif %}</h1>

Package your new application
----------------------------

The special requirements for Addon packaging - in essence, an `addon.json` file containing
information about the Addon - are in discussed in :ref:`addon-packaging`.

Install and test your package locally. This of course includes test that it installs as expected.

.. WARNING::
    One thing to be aware of is that your local environment may be slightly more forgiving that
    Aldryn's; for example, depending upon where you're keeping your work in progress, you may find
    that some of your Addon's components are available to Django not because you've packaged them
    correctly, but simply in virtue of where you have put them while working on them.

    It's a good idea therefore to keep your development files away from your Python paths to avoid
    this.

Validate your Addon
-------------------

The Aldryn client includes a validation tool, that will report on problems it finds in your Addon.

::

    aldryn addon validate

Upload
------

When you're satisfied that all is correct, upload your Addon::

    aldryn addon upload

Your Addon is now in the Aldryn Marketplace, in the **Owned by me** list (it's not publicly
available) and ready to be installed.

Install and deploy
==================

Install the plugin now as you'd install any other, and deploy your changes. A few minutes later,
you should be up and running and able to use your application in Aldryn.
