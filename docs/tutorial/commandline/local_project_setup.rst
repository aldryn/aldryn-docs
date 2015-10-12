.. _run_locally:

###############################
Run your Aldryn project locally
###############################

If your code works with django CMS, you can expect it to work with Aldryn.

One of Aldryn's most important features is the way it allows you to deploy your own Django code
while providing you with a comfortable and familiar local environment for development.

Aldryn provides a fairly standard Django environment, which means that just about any Django code
can be deployed to Aldryn. It does however have some specific requirements. In order to be sure
that your code will run as expected on our cloud-based servers, the local environment it provides
replicates as far as possible the one your code will encounter when deployed.

.. important::

    This how-to requires an up-to-date Aldryn project. Choose an Aldryn project to work with, and
    check that:

    * the *Base Project* is on version 3 or later
    * its *System* Addons (listed as ``[System] Aldryn SSO`` etc in the Control Panel) have been updated to the latest version
    * you have logged into the CMS for this project at least once

.. todo:: specify which boilerplate must be used


**********************
Log in with the client
**********************

The next step is to log in to Aldryn using the client::

    $ aldryn login
    Your browser has been opened to visit: https://control.aldryn.com/account/desktop-app/access-token/
    Please copy the access token and paste it here:

This will open https://control.aldryn.com/account/desktop-app/access-token/, from where you can
copy the access token, to paste into the shell.

You're now properly authenticated with Aldryn.


****************************
Working with Aldryn projects
****************************

List your projects
==================

Get a list of your Aldryn projects::

     $ aldryn project list
     Slug                                Name                               Organisation
     ----------------------------------  ---------------------------------  ---------------
     acme-website                        ACME Website                       ACME

.. note::

    The output of ``aldryn project list`` is piped through ``less``, so you can scroll up and down
    through it, and leave it with ``q`` for 'quit'.


Replicate a project locally
===========================

Choose a project to work on locally, and issue the ``setup`` command to download it and build it
locally::

    aldryn project setup acme-website  # use the appropriate slug for your project

.. note::

    Your project must be updated to a recent version (3.x) of the Aldryn *Base Project*. This will
    be indicated in your project's dashboard. If your project is not up-to-date, the Aldryn client
    will report::

        Error: Aldryn local development only works with projects using baseproject
        version 3 and have a valid 'docker-compose.yml' file.

    In such a case, update the Base Project using the Control Panel and try again.

If successful, the process will take a few minutes (depending on the project's configuration, this
may take several minutes) pull down the complete set of project files::

     $ aldryn project setup acme-website
     Creating workspace...

     cloning project repository
     Cloning into 'acme-website'...
     Locking the website...
     Unlocking the website...
     downloading remote docker images
     building local docker images
     creating new database container
     fetching database dump
     inserting database dump
     sync and migrate database


     Finished setting up your project's workspace!
     To start the project, please:
      - change directory into acme-website
      - run aldryn project up


Launch the project
==================

``setup`` builds the project and only needs to be run once. From now onwards, you can launch it at
any time from within the directory ``setup`` created with the ``up`` command::

    cd acme-website
    aldryn project up

.. note:: **Microsoft Windows users**

    If you are using Windows and Internet Explorer/Edge, you may find that the browser does display the page when running ``aldryn project up``. In this case, you either:

    * copy the URL from IE/Edge to another browser such as Firefox or Chrome
    * set Firefox or Chrome as your default browser

``up`` starts the Docker containers (and for convenience) also opens your browser to show the site
running locally.

``aldryn project stop`` shuts them down, and is roughly the opposite of ``up``.

When the container is running, you can use ``aldryn project open`` to open the site in your web
browser.

To check whether the container is running, use ``aldryn project status``.


Build frontend files
--------------------

In fact if you are using a standard Aldryn project for this tutorial, you will need to build its
frontend files before it displays correctly. (For other projects this may not be necessary, or they
may use their own frontend framework requiring some other operation.)

Run::

    docker-compose run --rm web gulp sass

to build the CSS and JavaScript files.

.. _login_locally:

Login locally
=============

With the site in your browser, select the *edit mode* link (or simply add ``?edit`` to the URL),
and and you will be presented with login options in the tool bar. Choose **Login as...**, select a
user from the menu and sign in.

You're now in front of a replica of your Aldryn project, running in exactly the same environment,
with the same applications, styling and content.

.. note::

    If you haven't logged in to the project's website on the Aldryn Control Panel, your local
    database will lack the user information required to present you with a pre-configured user.

    In this case you have two options:

    * go back to the site on the Control Panel and login, then issue ``aldryn project pull db``
      locally and try again
    * select **Create user** to set up an admin user locally

Explore the site locally. When you're ready, you can go on to :ref:`work_locally`.
