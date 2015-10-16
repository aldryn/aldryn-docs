.. _command-line-client-reference:

##############################
The Aldryn command-line client
##############################


****************
About the client
****************

The Aldryn command-line client is written in Python. It's an open-source tool, available from its
`GitHub repository <https://github.com/aldryn/aldryn-client>`_.

We welcome bug-reports, pull requests and comments.


************
Installation
************

The client is available via ``pip``, so the easiest way to install it is simply::

     pip install aldryn-client

See :ref:`the installation guidance <install_command_line_client>` for more help with installation
if you run into trouble (or see the :ref:`guidance for Windows users
<install_command_line_client_windows>`).


*****
Usage
*****

Environment-related commands
============================

``aldryn doctor``
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
    Authenticates you to the Aldryn cloud platform. The login command opens your browser at
    https://control.aldryn.com/account/desktop-app/access-token/, where you can obtain an access
    token for identification purposes.


Project-related commands
========================

All project-related commands take the form ``aldryn project <sub-command>``.


Commands that can be run outside a project directory
----------------------------------------------------

``list``
    Lists your projects on the Aldryn cloud platform.

    Typical output::

         Slug                                Name                               Organisation
         ----------------------------------  ---------------------------------  ---------------
         acme-website                        ACME Website                       ACME

    The output of ``aldryn project list`` is piped through ``less``, so you can scroll up and down
    through it, and leave it with ``q`` for 'quit'.

``setup <project>``
    Pulls down and builds one of your projects (for example, ``aldryn project setup acme-website``).

    The project will be created in a new directory with the same name as the project. ``setup`` only
    needs to be run once.

Commands that must be run within a project directory
----------------------------------------------------

These commands all act on a particular project, and must be executed from within that project's
directory locally.

``status``
    It reports on the current state of a project, for example::

                Name                      Command               State          Ports
        ------------------------------------------------------------------------------------
        acmewebsite_db_1       /docker-entrypoint.sh postgres   Up      5432/tcp
        acmewebsite_web_1      python manage.py runserver ...   Up      0.0.0.0:8000->80/tcp

    Each project, as shown here, will have two associated Docker containers, one for the web server
    and one for the database.

``up``, ``stop``
    ``up``:

    * starts the Docker containers, if not already started
    * starts the Django server, if not already started
    * opens your web-browser at the home page of your locally-served site

    ``stop`` is roughly the opposite of ``up``, and stops the Docker containers if they're running.

``push db``, ``pull db``
    Push and pull database changes to and from Aldryn.

    Before pushing to Aldryn, you should make a backup of the database using *Manage Project*
    in the Aldryn Control Panel.

``push media``, ``pull media``
    Push and pull media file changes to and from Aldryn.

    Before pushing to Aldryn, you should make a backup of the files using *Manage Project*
    in the Aldryn Control Panel.

``update``
    ``aldryn project update`` must be executed *within* a project directory.

    ``update`` updates your local project directory with all code changes from Aldryn.

``cheatsheet``
    Opens the cheatsheet of useful commands for your project on the Aldryn website.

``dashboard``
    Opens the project's dashboard on the Aldryn website.

``live``, ``test``
    Open the project's live and test sites on Aldryn.

``open``
    Opens a browser window with the locally-running project.

``develop <package>``
    Install a package ``package`` from the ``addons-dev`` directory to your local project, and
    rebuild the ``web`` container. ``develop`` is the local equivalent of installing an Addon on
    Aldryn, then redeploying the Test server.


.. _addon-related-commands:

Addon-related commands
======================

``validate``
    Checks an Addon for validity. Note that it only checks that some basic configuration is in
    place; it cannot detect whether the Addon's code works well, or even if the Addon will actually
    work at all.
