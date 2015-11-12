.. _working_locally_on_backend:

#######################
Developing applications
#######################

As well as your site's frontend code, you can also modify the Python code in the applications it
runs. In this section we will create a new Addon application, test and run it in the local
environment, upload it to Aldryn, and apply it to a new site.

First, make sure your site is up and running locally. Go back to :ref:`work_locally` if you need
to.


.. _prepare_aldryn_for_addon:

***********************************
Prepare Aldryn to receive the Addon
***********************************

Before you can upload an Addon to Aldryn, Aldryn must be ready for it.

In the `Aldryn Control Panel <https://control.aldryn.com/control/>`_, select `Addons
<https://control.aldryn.com/account/my-addons/>`_, then `Add custom Addon
<https://control.aldryn.com/account/my-addons/new/>`_.

You need to give your Addon:

* a ``Name`` (a human-friendly name), in the format "Hello World by <your name>" - for example,
  *Hello World by Erika*
* a ``Package name`` (a computer-friendly slug, containing only letters, numbers, underscores and
  hyphens), in the format "hello-world-<your name>", such as *hello-world-erika*

.. important:: **About the package name**

    Make sure you prefix the package name with ``hello-world``. This will help us, and you, because
    it will make it immediately clear that this Addon is one that was created for the purposes of a
    tutorial and can be safely disposed of later.

The Addon can belong to an Organisation, and have a licence, but these are both optional. Note that
an Addon can't be shared without a licence file.

When you hit **Create Addon**, you'll be taken to a the settings pages for it. You can always
change these settings later.

First though, select *Package information* from the menu; this lists some files ready to be
downloaded into the new Addon for packaging purposes. You will need to use them shortly.


****************************************
Create the new Addon application locally
****************************************

Substituting something appropriate for ``<your name>`` in the examples below, run::

    docker-compose run --rm web python manage.py startapp hello_world_<your name>

If you have Django installed globally, you could instead do::

    django-admin startapp hello_world_<your name>

.. important::

    The name you provide here is the Python *module name*, and can contain only only numbers,
    letters and underscores.

This will create a new *module-level* directory, ``hello_world_<your name>`` (note the
underscores), containing a new Django application with various files in it. For example::

    hello_world_erika
        __init__.py
        admin.py
        models.py
        tests.py
        views.py

You now need to create a new outer *package-level* directory, with exactly the same name as the
*Package name* you used earlier, and place the application inside it, so your package will now look
like::

    hello-world-erika
        hello_world_erika
            __init__.py
            admin.py
            models.py
            tests.py
            views.py

Now place all this into ``addons-dev`` in your project.

In other words, in your Aldryn project you should have::

    addons-dev/hello-world-<your name>/hello_world_<your name>

The ``addons-dev`` directory is your workspace for Addon development, and is on the Python path for
the server.

This new application doesn't yet do anything at all, but at least it now exists, and it's available
to the Python environment of the Django server.


*******************
Packaging the Addon
*******************

The *Package information* page for your Addon on Aldryn list a number of files you need to package
your Addon.

Now download each of the files, putting them in the *outer* ``hello-world-<your name>`` *package*
directory.

The exception is ``hello_world/__init__.py``, which goes in the *inner* ``hello_world_<your name>``
*module* directory, replacing the empty one that's already there.

You should now have::

    addons-dev
        hello-world-erika
            hello_world_erika
                __init__.py
                admin.py
                models.py
                tests.py
                views.py
            addon.json
            LICENSE.txt
            MANIFEST.in
            README.rst
            setup.py

.. note::

    Of these files, only ``addons.json`` is strictly required to get started, but it is strongly
    recommended to supply all of them.

In order to be used on Aldryn, the application must be packaged as an Addon and uploaded. Every
Addon has an ``addon.json`` file containing key information about it. You'll find this in
``addons-dev/aldryn-newsblog``.

See :ref:`addon-packaging` for more information.


``addon.json``
==============

::

    {
        "package-name": "hello-world-<your name>",
        "installed-apps": [
            "hello_world"
        ]
    }

This tells Aldryn what the package is called; the ``package-name`` is ``hello-world-<your name>``,
which should match *exactly* the name you provided on Aldryn.

``installed-apps`` tells Aldryn what it needs to add the the Django project's ``INSTALLED_APPS``
setting in ``settings.py`` for this new application to work when it's installed.


******************
Validate the Addon
******************

With correct information in ``addon.json`` and ``__init.py__``, your application is ready. Make
sure you are in the (outer) ``hello-world-<your name>`` directory, and check it::

    $ aldryn addon validate
    Addon is valid!

``aldryn addon validate`` can't prove that your Addon will work, but it will catch some problems
that could otherwise prevent it working on Aldryn.


***********************************
Add some functionality to the Addon
***********************************

So far the Addon exists as a package, but doesn't actually do anything yet. We will add some code
to it that does, a minimal django CMS plugin.

See `custom plugins <http://docs.django-cms.org/en/latest/how_to/custom_plugins.html>`_ in
the django CMS documentation for more information about plugins.

Create a new ``cms_plugins.py`` file inside the application (that is, in
``addons-dev/hello-world-<your name>/hello_world_<your name>``)::

    from cms.plugin_base import CMSPluginBase
    from cms.plugin_pool import plugin_pool
    from cms.models.pluginmodel import CMSPlugin


    class HelloWorld(CMSPluginBase):
        model = CMSPlugin
        render_template = "hello_world_<your name>/hello.html"  # don't forget to edit this
        text_enabled = True


    plugin_pool.register_plugin(HelloWorld)

Don't forget to change ``<your name`` above.

And in::

    hello-world-<your name>
        hello_world_<your name>
            templates
                hello_world_<your name>
                    hello.html

(you will need to create some of the file and the directories along the path)::

    Hello
    {% if request.user.is_authenticated %}
        {{ request.user.first_name }} {{ request.user.last_name}}
    {% else %}
        Guest
    {% endif %}

Your application should now look very like this::

    hello-world-erika
        hello_world_erika
            templates
                hello_world_erika
                    hello.html
            __init__.py
            admin.py
            cms_plugins.py
            models.py
            tests.py
            views.py
        addon.json
        LICENSE.txt
        MANIFEST.in
        README.rst
        setup.py


**************
Test the Addon
**************

You can now test the Addon locally. First you must install it.


Install the Addon in your local project
=======================================

To deploy the new application locally, run ``aldryn project develop hello-world-<your name>``::

    $ aldryn project develop hello-world-<your name>
    Building web...

    [time passes]

    1218 static files symlinked to '/app/static_collected'.
     ---> f1a1c3de4f68
    Removing intermediate container 3c32043caea6
    Successfully built f1a1c3de4f68
    The package hello-world-<your name> has been added to your local development project!

This installs the Addon, then redeploys the server - the same processes that unfolded on Aldryn.


Add the Addon to ``INSTALLED_APPS``
-----------------------------------

In the project's ``settings.py``, you'll find::

    INSTALLED_APPS.extend([
        # add your project specific apps here
    ])

Add the application name to the list, for example::

    INSTALLED_APPS.extend([
        'hello_world_erica',
    ])

.. note:: A future update to the Aldryn client will take of this step automatically.


Test the new plugin
===================

If your server is still running (``aldryn project up`` if not), the new code will be picked up
immediately by the server.

When you now `scroll through the available plugins <structure-and-content>`_ while editing the site
you'll see that there's a new plugin available, *HelloWorld*.

Open the local site, select a Placeholder and add the new *HelloWorld* plugin to a page.

..note:: **Problems?**

    Use the logs to help you find what's going on, or going wrong::

        docker-compose logs web  # web server logs
        docker-compose logs db   # database server logs
        docker-compose logs      # both


Make changes to the application
===============================

As you continue developing the Addon, your changes are immediately available on the server,
making development a very efficient process. For example, you could add a ``name`` attribute to the
``HelloWorld`` class:

.. code-block:: python
   :emphasize-lines: 5

    class HelloWorld(CMSPluginBase):
        model = CMSPlugin
        render_template = "hello_world_erika/hello.html"  # don't forget to edit this
        text_enabled = True
        name = "Erika's Hello World"

which will provide a friendlier representation of the plugin when displayed to users in the list of
available plugins.

If you now `scroll through the available plugins <structure-and-content>`_ while editing the site
(use ``aldryn project open`` to open the site if you don't already have it open in the browser)
you'll see that the plugin that was previously named *HelloWorld* is now called *Erika's Hello
World*.

.. note:: **How this works**

    The ``addons-dev`` directory is your workspace for Addon development, and is placed on the
    Python path for the server. At the same time, the Django server running in the Docker machine
    auto-reloads when it detects code changes. As soon as you saved ``cms_plugins.py``, your
    changes were picked up and compiled, and the server restarted to make them available.

    See :ref:`local-django-server` for more information.

    If your changes introduce an error that crashes the server, when you try to reload the web page
    you will instead get an error::

         A server error occurred.  Please contact the administrator.

    See :ref:`errors-and-logging` for information on how to deal with this.

Once you have it working locally to your satisfaction, you're ready to upload it to Aldryn.


*************************
Using the Addon on Aldryn
*************************

Upload the Addon
================

Use the ``aldryn addon upload`` command::

    $ aldryn addon upload
    Warning: Aldryn config file 'aldryn_config.py' not found. Your app will not have any
    configurable settings.
    warning: no files found matching 'LICENSE'
    warning: no files found matching '*' under directory '*/boilerplates'
    warning: no files found matching '*' under directory '*/templates'
    warning: no files found matching '*' under directory '*/static'
    warning: no files found matching '*' under directory '*/locale'
    warning: check: missing required meta-data: url

    ok
    Configuration file is valid

    New version 0.0.1 of hello-world-erika uploaded to alpha channel

    https://control.aldryn.com/api/v1/apps/serve/hello-world-erika/
    0.0.1/266b549a-79fc-4d1d-a86d-11f3031ce33f/hello-world-erika-0.0.1.tar.gz

Your Addon is now on Aldryn. You can see it listed on `your Addons page
<https://control.aldryn.com/account/my-addons/>`_, and it's available to install into your projects.


Install the Addon
=================

Open the project's Dashboard, select *Manage Addons*

In *Manage Addons* you will note that your Addon doesn't yet show as having an update available.

This is because by default new Addons are placed in the *Alpha* :ref:`Release channel
<release-channels>`. Hit **Configure** to set how your project will use this new Addon, and set the
*Release channel* to *Alpha*. Once you save the configuration, the *Manage Addons* page will
indicate that an update is available.

Install it, and redeploy the Test server; the new plugin will now be available on your Aldryn
project too.


*************************
Uploading a newer version
*************************

From time to time you will want to upload an improved version of your Addon to Aldryn. In order to
do this, need to increment its version number in ``__init.py__``, so for your next version, change
that to ``0.0.2``, and so on.

Once more, validate::

    aldryn addon validate

and upload your plugin::

    aldryn addon upload


**********
Next steps
**********

This tutorial has covered the complete cycle of Addon development on Aldryn. It has only covered
the most simple example of an Addon.

See the :ref:`reference` for information about:

* :ref:`addon-configuration`
* :ref:`addon-packaging`
* :ref:`addon_publishing`
