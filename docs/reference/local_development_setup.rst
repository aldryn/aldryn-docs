##################################
About the local development set-up
##################################

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


``addons.dev``
==============

Once cloned, a correctly-configured Addon that requires no new dependencies will only require a
server restart to be available in your local site.

If an Addon requires new dependencies, run ``aldryn addon develop`` to install them.
