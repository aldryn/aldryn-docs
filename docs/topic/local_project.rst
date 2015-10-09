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

The project directory is a Git repository, pulled from a Git server - ``git.aldryn.com``. You can interact with this git server in the usual ways. Generally however you will only be interested in using ``pull`` and ``push`` commands.

The ``addons`` directory contains an entry for every installed Addon in the project. It also
contains a ``settings.json``, holding the the settings that have been defined in the Control Panel
for each Addon.

[16:49] lis: The 'addons' directory contains  an entry for every installed Addon. You have a . And aldryn_config.py that knows how apply the global settings.
[16:52] Stefan Foulis: You can checkout an addons sourcecode into addons-dev and it will autmatically pick up the aldryn_config.py from there. If the addon you just cloned does not define any different dependencies than the Addon you already had installed, all that needs to be done to use that code is to restart the server. 		If there are new dependencies (or just to be sure) you'll have to run aldryn addon develop.
[16:52] Stefan Foulis: For your developing pleasure the current directory with all the sourcecode is mounted inside the container at /app. And whatever is in the 'data' will be /data inside the container.

* ping index.docker.io

* docker-machine ssh
::

    VBoxManage modifyvm "default" --natdnshostresolver1 off
    VBoxManage modifyvm "default" --natdnsproxy1 on
