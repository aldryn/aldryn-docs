.. _local_development_installation:

*********************
Software installation
*********************

You'll need to have two key pieces of software installed, **Docker Toolbox** and the **Aldryn
command-line client**. But first, you need to ensure that you have **Git** and an appropriate
version of **Python** installed.

Git
===

Git is used to push and pull changes to and from the Aldryn cloud. It's used behind the scenes by
the ``aldryn`` command, and you can also invoke it manually for some operations.

.. note:: **If you don't already have Git installed**

    Download Git for your system from `the official Git downloads page
    <http://git-scm.com/downloads>`_.

    In your terminal, provide some basic configuration (supply your name and email address)::

        git config --global user.name "<your name>"
        git config --global user.email "<your email address>"

If you're not already familiar with Git, the commands you will use with Aldryn will be described in
these how-to guides.


Python 2.7
==========

The Aldryn command-line client is built in Python. The current versions requires that you have
Python 2.7 installed on your system.


Install Docker Toolbox
======================

Vist the `Docker Toolbox <https://www.docker.com/toolbox>`_ site to download the appropriate
installer for your system (this is a fairly large download, so you can move on to the next step
while waiting for it to complete).

Once downloaded, follow the instructions to run the installer.

You'll be using the *Docker Quickstart Terminal* when working with Aldryn, so you can launch that
when invited.

Docker Quickstart Terminal is installed as application. When launched, it will :ref:`open a new
shell <launch-docker-quickstart-terminal>`.


Install the Aldryn command-line client
======================================

Install the client::

    pip install aldryn-client

.. note:: Installation problems

    Depending on your operating system and even the version of your operating system, you may find
    that ``pip install aldryn-client`` doesn't work.

    In this case your options include:

    * (OS X/Linux users, if permission is denied) try ``sudo pip install aldryn-client``
    * if ``pip`` is not installed, try one of:

        * use the `official pip installer <https://pip.pypa.io/en/latest/installing/#install-pip>`_
        * run ``sudo easy_install pip``

        then try again

    * create a new ``virtualenv``; pip will be available within that


If you already have an older version of the client installed, use the ``--update`` option::

    pip install --update aldryn-client

You can check the currently installed version by running ``aldryn version``. If it reports a version lower than 2.0, you **must** update.

It is strongly advised to keep the client up-to-date by running ``pip install aldryn-client``
regularly.
