.. _local_development_installation_windows:

***************************
Install software on Windows
***************************


.. note:: note for Joseph: I have kept exactly the same structure as for the standard installation document; I hope your steps work in this order but if not you will need to re-arrange. Feel free to keep or remove any existing text.


Installing the required software on Windows requires some special steps.

.. attention:: **Not using Microsoft Windows?**

    Please use the :ref:`standard installation instructions <local_development_installation>`.

Git
===

* how to install git (enable "add git to path")

Python 2.7
==========

* How to install Python (enable "add python exe to path")


.. _docker_toolbox_windows:

Install Docker Toolbox
======================

* install via pip docker compose
* docker toolbox (including kitematic)
* start docker quick terminal
* start kitematic, skip connect docker hub
* use "docker cli" button from there

Vist the `Docker Toolbox <https://www.docker.com/toolbox>`_ site to download the appropriate
installer for your system (this is a fairly large download, so you can move on to the next step
while waiting for it to complete).

Once downloaded, follow the instructions to run the installer.

You'll be using the *Docker Quickstart Terminal* when working with Aldryn, so you can launch that
when invited.

Docker Quickstart Terminal is installed as an application. When launched, it will :ref:`open a new
shell <launch-docker-quickstart-terminal>`.


Install the Aldryn command-line client
======================================

* install via pip aldryn client

Install the client::

    pip install aldryn-client

.. note:: Installation problems

     Depending on your operating system and even the version of your operating system, you may find
     that ``pip install aldryn-client`` doesn't work.

     In this case your options include:

     * (OS X/Linux users, if permission is denied) try ``sudo pip install aldryn-client``
     * if ``pip`` is not installed, try one of:

         * use the `official pip installer <https://pip.pypa.io/en/latest/installing/#install-pip>`_
           ``sudo easy_install pip``

    then try again

     * create a new ``virtualenv``; pip will be available within that


If you already have an older version of the client installed, use the ``--update`` option::

    pip install --update aldryn-client

You can check the currently installed version by running ``aldryn version``. If it reports a version lower than 2.0, you **must** update.

It is strongly advised to keep the client up-to-date by running ``pip install aldryn-client``
regularly.
