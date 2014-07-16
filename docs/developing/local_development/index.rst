=================
Local development
=================

Aldryn provides a fairly standard Django environment, which means that just about any Django code
can be deployed to Aldryn. It does however have some specific requirements. In order to be sure that
your code will run as expected in the Aldryn enviroment, the platform gives you a way to set it up
locally to test it.

Workflow
========

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

    aldryn workspace create --sitename=<sitename>  # substitute your actual site name

It'll take a few minutes to download and install all the dependencies. What you'll see unfolding in
your terminal is just what happens on the Aldryn server when you create a new site.

Your Aldryn environment is in the `<sitename>` directory that has just been created. Within it
you'll find:

* `.site` - the Django project, complete with `manage.py`, settings, site static files and so on
* `.virtualenv` - the virtualenv for the Aldryn environment

Test the replicated site
------------------------

You need to activate this new virtualenv, and fire up the runserver::

    source .virtualenv/bin/activate
    python .site/manage.py runserver

Note that if you fire up the runserver, and try to visit a page on the site *before* you have
suplied database settings, the process won't exit when you quit the runserver. You'll need to find
and kill the process manually::

    ps aux | grep manage  # returns a list of matching processes
    kill <process_number>

Set up the local database
-------------------------

You'll need to get a local copy of your Aldryn database running.

In the Aldryn control panel, the *Manage this website* section offers options for downloading and restoring databases. Create a new backup
of your site, refresh the page, and download the backup you have just created.

Unpack the .tar file that has been downloaded. This contains the database, media files, and more. Using your local PostgreSQL database
client, import the database.dump file, and make sure that the new database's name and any permissions match those in the local site's
settings.

Use local settings
------------------

You're going to need to adjust the settings for your local version of the project, so that can use your local database. You shouldn't touch
the `settings.py` that you pulled down from Aldryn though - if you do, your Aldryn site will no longer work.

Instead, override the `DATABASE_URL` by setting an an *environment variable*.

Create file `.env` in the root of your site directory, containing::

    DATABASE_URL=postgres://postgres:@127.0.0.1:5432/<database_name>

Obviously, `<database_name>` needs to match the one you have created.

If you need to do anything more complex, you can use an environment variable to point to a local settings file:
https://docs.djangoproject.com/en/dev/topics/settings/#designating-the-settings. In it, import all
the settings from the settings file from Aldryn, and override the ones you need it to::

    DJANGO_SETTINGS_MODULE=local_settings

And your in your local_settings::

    from settings import *
    # override settings as required

Let's go
--------

And now you're ready to go::

	python .site/manage.py runserver

You should see your site, or at least the "Your site is ready" message, and be able to log into it.
