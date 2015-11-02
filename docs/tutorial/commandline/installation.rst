.. _local_dev_install_configure:

##############################
Installation and configuration
##############################

.. attention:: **Microsoft Windows users**

    The process for installing these components on Microsoft Windows is substantially different,
    and can be more difficult. We have a separate :ref:`software installation guide for Windows
    <local_dev_install_configure_windows>`, with simple instructions, to help those users.

You'll need to have two special pieces of software installed, **Docker Toolbox** and the **Aldryn
command-line client**. But first, you need to ensure that you have **Git** and an appropriate
version of **Python** installed. This document will help you install and configure all of them.


***
Git
***

Git is used to push and pull changes to and from the Aldryn cloud. It's used behind the scenes by
the ``aldryn`` command, and you can also invoke it manually for some operations.

.. note:: **If you don't already have Git installed**

    First, check whether Git is indeed installed. If you type ``git`` in your terminal and it tells
    you about how to use it, it's installed.

    Download Git for your system from `the official Git downloads page
    <http://git-scm.com/downloads>`_.

    Macintosh and Windows users can also download the `GitHub Desktop <https://desktop.github.com>`_
    application, which also installs the Git command-line application you will need.

    Once installed, in your terminal, provide some basic configuration (supply your name and email
    address)::

        git config --global user.name "<your name>"
        git config --global user.email "<your email address>"

If you're not already familiar with Git, the commands you will use with Aldryn will be described in
these how-to guides.


**********
Python 2.7
**********

The Aldryn command-line client is built in Python. The current versions requires that you have
Python 2.7 installed on your system.


.. _docker_toolbox:

**************
Docker Toolbox
**************

.. note:: **Linux users**

    Docker runs as a native daemon on Linux. To install it, follow the `official Docker
    installation guide <https://docs.docker.com/linux/step_one/>`_.

    Once you have completed those steps, you can
    continue to :ref:`install the Aldryn command-line client <install_command_line_client>`.

    Note that the Docker daemon always runs as root, though it is possible to access it using
    a client running as an unprivileged user by adding that user to the docker group.

    Since the Docker daemon runs as root, all activity happening inside Docker containers
    has root privileges. As a result, files and directories created in locally mounted
    directories from within containers will always be owned by root. The client
    attempts to overcome this when setting up new projects by changing the owner of
    the newly-created directories to the invoking user. To access files and directories
    create later by your application, you'll need to change the ownership or permissions yourself
    using the ``chown`` or ``chmod`` commands.

Visit the `Docker Toolbox <https://www.docker.com/toolbox>`_ site to download the appropriate
installer for your system (this is a fairly large download, so you can move on to the next step
while waiting for it to complete).

Once downloaded, follow the instructions to run the installer.

You'll be using the *Docker Quickstart Terminal* when working with Aldryn, so you can launch that
when invited.

Docker Quickstart Terminal is installed as an application. When launched, it will :ref:`open a new
shell <launch-docker-quickstart-terminal>`.


.. _install_command_line_client:

**************************
Aldryn command-line client
**************************

Install the client::

    pip install aldryn-client

.. note::

    If you have an older version already installed, use::

        pip install --upgrade aldryn-client

You can check the currently installed version by running ``aldryn version``. If it reports a
version lower than 2.0, you **must** upgrade it.

It is strongly advised to keep the client up-to-date by running ``pip install --upgrade
aldryn-client`` regularly.

.. note:: **Installation problems**

    Depending on your operating system and even the version of your operating system, you may find
    that ``pip install aldryn-client`` doesn't work.

    In this case your options include:
    * (OS X users, if you have trouble with pip) ``pip install --upgrade --no-use-wheel setuptools``
    * (OS X/Linux users, if permission is denied) try ``sudo pip install aldryn-client``
    * if ``pip`` is not installed, try one of:

        * use the `official pip installer <https://pip.pypa.io/en/latest/installing/#install-pip>`_
        ``sudo easy_install pip``
        * (Debian/Ubuntu users) ``sudo apt-get install python-pip``

    then try again.

        * create a new ``virtualenv``; pip will be available within that

Later, you will want to consult the :ref:`command-line client reference notes
<command-line-client-reference>`, but in the meantime, all the operations you'll need to use are
described in this tutorial.

.. _launch-docker-quickstart-terminal:

.. note::

    The client is `released as open-source software <https://github.com/aldryn/aldryn-client>`_, on
    GitHub.

    You can install the client directly from the GitHub repositotory with::

        pip install -e git+git://github.com/aldryn/aldryn-client.git#egg=aldryn_client


*********************************
Launch Docker Quickstart Terminal
*********************************

If you haven't already done so, launch a new shell using Docker Quickstart Terminal. This creates a
new virtual machine (``default``) and starts it up::

    Creating Machine default...
    Creating VirtualBox VM...
    Creating SSH key...
    Starting VirtualBox VM...
    Starting VM...
    To see how to connect Docker to this machine, run: docker-machine env default
    Starting machine default...
    Started machines may have new IP addresses. You may need to re-run the
    `docker-machine env` command.
    Setting environment variables for machine default...

                          ##         .
                      ## ## ##        ==
                   ## ## ## ## ##    ===
               /"""""""""""""""""\___/ ===
          ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
               \______ o           __/
                 \    \         __/
                  \____\_______/


    docker is configured to use the default machine with IP 192.168.99.101
    For help getting started, check out the docs at https://docs.docker.com

This can take a couple of minutes to complete, but the next time will be much quicker.

.. note:: **Linux users**

    Linux users should instead install Docker Compose::

        pip install docker-compose

    and then continue directly with ``aldryn doctor`` below.

Run the command ``aldryn doctor``, which should confirm that all is correct::

    Verifying your system's setup
     ✓ git client
     ✓ docker client
     ✓ docker server connection
     ✓ docker-compose

.. note:: **If you have problems with Docker**

    If you do find yourself encountering problems with Docker, as indicated by ``aldryn
    doctor``, running ``docker-machine restart default`` will usually help.

    OS X users who find that connections to Docker stop working after moving to a new network
    location should run::

        VBoxManage modifyvm "default" --natdnshostresolver1 off
        VBoxManage modifyvm "default" --natdnsproxy1 on

    to change the way the Virtual Box routes DNS requests.


.. _upload_key:

********************************
Upload your public key to Aldryn
********************************

In order for the Aldryn cloud and your local machine to communicate securely, Aldryn needs to
know your public key to verify your identity.

Visit https://control.aldryn.com/account/ssh-keys/ to check whether you have uploaded your public
key to Aldryn. Any keys already uploaded to Aldryn will be listed there.

If you haven't already done so, you'll need to copy your SSH public key from your
computer and add it to the Aldryn Control Panel. You'll only need to do this once.

.. note:: **If you need help with SSH keys**

    If you need help with setting up, finding or using your SSH keys, use our
    :ref:`guide to setting up SSH keys for Aldryn <setting_up_ssh_keys>` before
    returning to this section.

Having copied your public key to your clipboard, open https://control.aldryn.com/account/ssh-keys/
and paste your key to the *Public key* field. Add a name to the *Title* field to remind you which
computer this key belongs to.

Your Aldryn account will now recognise your computer as a trusted host, and you'll be protected by
encrypted communication for command-line operations between the two.

You're now ready to log in and :ref:`start working on a project <run_locally>`.
