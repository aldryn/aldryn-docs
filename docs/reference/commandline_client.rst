.. _command-line-client-reference:

##############################
The Aldryn command-line client
##############################

*****
Usage
*****


``aldryn doctor``
=================

Checks your set-up to confirm that all is well with:

* your Git client (required to communicate with the Git server on Aldryn)
* the Docker client (required to communicate with the Docker server running locally)
* the connection to the Docker server
* docker-compose (required to manage the Docker containers)

Expected output::

    Verifying your system setup
     ✓  git client
     ✓  docker client
     ✓  docker server connection
     ✓  docker-compose


``aldryn login``
================

Authenticates you to the Aldryn cloud platform. The login command opens your browser at
https://control.aldryn.com/account/desktop-app/access-token/, where you can obtain an access token
for identification purposes.


``aldryn project <sub-command>``
================================

Is always used with a sub-command. These are:


``list``
--------

Lists your projects on the Aldryn cloud platform.

Typical output::

     Slug                                Name                               Organisation
     ----------------------------------  ---------------------------------  ---------------
     acme-website                        ACME Website                       ACME

The output of ``aldryn project list`` is piped through ``less``, so you can scroll up and down
through it, and leave it with ``q`` for 'quit'.


``setup <project>``
-------------------

Pulls down and builds one of your projects (for example, ``aldryn project setup acme-website``).

The project will be created in a new directory with the same name as the project. ``setup`` only
needs to be run once.


``status``
----------

``aldryn project status`` must be executed *within* a project directory.

It reports on the current state of a project, for example::

            Name                      Command               State          Ports
    ------------------------------------------------------------------------------------
    acmewebsite_db_1       /docker-entrypoint.sh postgres   Up      5432/tcp
    acmewebsite_web_1      python manage.py runserver ...   Up      0.0.0.0:8000->80/tcp

Each project, as shown here, will have two associated Docker containers, one for the web server and
one for the database.


``up``
------

``aldryn project up`` must be executed *within* a project directory.

``up``:

* starts the Docker containers, if not already started
* starts the Django server, if not already started
* opens your web-browser at the home page of your locally-served site


``push db``, ``pull db``
------------------------

These commands must be executed *within* a project directory.

Push and pull database changes to and from Aldryn.

Before pushing to Aldryn, a backup of the database on Aldryn will be made.


``push media``, ``pull media``
------------------------------

These commands must be executed *within* a project directory.

Push and pull media file changes to and from Aldryn.

Before pushing to Aldryn, a backup of the files on Aldryn will be made.
