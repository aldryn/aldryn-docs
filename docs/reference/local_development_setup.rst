##################################
About the local development set-up
##################################

.. note::

    For a complete introduction to the local development environment, see the
    :ref:`tutorial_backend_developers` tutorial.

The :ref:`first time you launch the Docker Quickstart Terminal <docker_toolbox>`, it creates a
virtual machine called ``default``. This will be the host for all the Docker containers you need
to run for your local Aldryn projects.

When you set up a local version of one of your Aldryn projects, the ``aldryn project setup``
command creates a local *project directory* for it, and pulls down your project (the actual Django
project), and its database and media files.

It creates two Docker containers:

  * one to run Django (``projectname_web_1``)
  * another to host and serve the project's database (``projectname_db_1``)


.. _local_project_directory:

***************************
The local project directory
***************************

Your project and its media files reside on your own local filesystem - the project directory
created when you run the ``setup`` command - and the Django Docker container mounts it as a remote
filesystem.

The project directory is a Git repository, pulled from a Git server - ``git.aldryn.com``. You can
interact with this git server in the usual ways. Generally however you will only be interested in
using ``pull`` and ``push`` commands.


``addons``
==========

The ``addons`` directory contains an entry for every installed Addon in the project. It also
contains a ``settings.json``, holding the the settings that have been defined in the Control Panel
for each Addon.

The ``addons.dev`` directory allows you to clone an Addon's source code into it.


.. _addons.dev:

``addons.dev``
==============

Your workspace for Addon development.

If you are familiar with Python virtual environments, this directory functions much like the
``src`` directory in a ``virtualenv``. It's on the Python path and any modules placed there will be
discovered and made available to the Python environment.


.. _local-django-server:

***********************
The local Django server
***********************

The server can be started with ``aldryn project up``, executed in the main project directory.


Auto-reloading
==============

In your ``projectname_web_1`` container, the Django server auto-reloads when it detects code
changes, just like the Django runserver does. This includes any code it has loaded, including code
in the :ref:`addons.dev` directory.

Changes will be immediately picked up and compiled, and the server restarted to make them available.

.. _errors-and-logging:

Errors and logging
==================

If your changes introduce an error that crashes the server, when you try to reload the web page
you will instead get an error::

     A server error occurred.  Please contact the administrator.

In this case you will need to see where the error occurred, so run::

    docker-compose logs

to see the traceback.

``docker-compose logs`` optionally takes the arguments ``web`` and ``db`` to specify the particular
container. A useful way of working is to have ``docker-compose logs`` open in one terminal
window while you work in another.

After correcting the error and saving changes, the server will auto-reload the code and restart.

.. note::

    Depending on the error, an auto-reload may not be enough. In this case you will need to
    stop and restart the server manually, with::

         aldryn project stop; aldryn project up


Installing an Addon
===================

If an Addon requires new dependencies, run ``aldryn addon develop`` to install them.
