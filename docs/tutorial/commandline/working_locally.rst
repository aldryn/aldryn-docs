.. _work_locally:

###################################
Work on your Aldryn project locally
###################################

.. important::

    This how-to assumes that you have a project running locally and have been able to log in. If
    that's not the case, you should follow the steps in :ref:`run_locally` first and then return
    here to continue.

    Below we also assume that you are in the local directory for your project, the one created when
    you first ran the ``aldryn project setup`` command.

Use ``aldryn project status`` for useful information about the state of your project::

    $ aldryn project status
            Name                      Command                State     Ports
    ------------------------------------------------------------------------
    acmewebsite_db_1        /docker-entrypoint.sh postgres   Exit 0
    acmewebsite_web_1       python manage.py runserver ...   Exit 137

There are two Docker containers for your project: ``acmewebsite_db_1`` for the database, and
``acmewebsite_web_1`` for the Django server. This reflects the architecture of the Aldryn cloud,
where the project itself and its database run on different machines.

In this case, the ``status`` command shows that both exist, but are not running.

.. note::

    If the command reports::

        Error: Aldryn project file '.aldryn' could not be found! Please make sure you're
        in an Aldryn project folder and the file exists.

    then probably you're not actually issuing the command in the correct directory.

Run::

    aldryn project up

to start the container and server and open your browser with the site.


You can check its status again::

    % aldryn project status
            Name                      Command               State          Ports
    ------------------------------------------------------------------------------------
    acmewebsite_db_1       /docker-entrypoint.sh postgres   Up      5432/tcp
    acmewebsite_web_1      python manage.py runserver ...   Up      0.0.0.0:8000->80/tcp

and :ref:`login_locally`.


******************
Working on content
******************

Database
========

All changes to the content of a django CMS site are recorded in the database, so by pushing and
pulling the database to or from Aldryn, you can work locally or remotely and synchronise changes.

First, make some local changes to content - for example, create and publish a new django CMS page.

Now in the terminal, push the changes in the database to Aldryn::

    aldryn project push db

Those changes will be immediately reflected online, in the Test version of your site. Similarly,
if you make changes to your site's content on Aldryn, you can pull it down to the local version::

    aldryn project pull db

And then relaunch the local site to check that the changes are reflected locally::

    aldryn project up


Media
=====

django CMS stores media files (images and other document) separately from the database in whichever
filesystem has been specified. If your changes involve changes to *files* (typically, uploading
files to the Filer, or moving or deleting them), then as well as transferring the database you will
also need to perform a similar operation on your media files.

Pulling and pushing media changes works in the same way, with the command ``aldryn project pull
media`` and ``aldryn project push media``.

Upload a new file to the Filer in your local project, and use a plugin to place it in a page.

Once again, push the changes to Aldryn, not forgetting to push your database changes *also*,
because in this case we have made changes to the database as well as media::

    aldryn project push media
    aldryn project push db

and check on Aldryn that they are shown there too. To do things the other way round, having made changes on Aldryn that you want locally::

    aldryn project pull media
    aldryn project pull db

.. warning:: The ``push`` and ``pull`` commands are **destructive operations**.

    Pushing and pulling data and files will overwrite information. Check that this is what you
    intend before confirming the operation.

    As you will note from the warning messaged displayed when you execute these commands, they both
    create backups before completing their work, so even if you inadvertently overwrite
    information, you can recover it from a backup.


***************
Working on code
***************

You're now ready to work on your project's code, which you'll find in the same directory. The
project directory is in fact a Git repository, so you can work on it just as you'd work with any
Git-based project.

The project contains site assets, such as CSS and image files, Django configuration files
(``settings.py``, ``urls.py`` and so on) and more.


Frontend
========

Making local changes
--------------------

We'll begin by making a simple CSS change, just as we did in :ref:`edit_a_file_locally`. If you
have not yet completed that tutorial, you are strongly recommended to do that now, so that you are
familiar with some of the basics of the system.

Find and open the file ``private/SASS/settings/_bootstrap.scss`` in your local project directory,
and change the line that refers to ``text-color``::

    $text-color: #666;

to ``red``::

    $text-color: red;

Your changes will **not** immediately be reflected on your site, because the CSS needs to be
recompiled. You can do this on a one-off basis using::

    docker-compose run --rm web gulp sass

but more typically, you would leave this process running so that any changes you make are compiled
automatically::

    docker-compose run --rm web gulp watch

You'll then see them the next time you refresh the page.

.. note:: **About Gulp**

    `gulp <http://gulpjs.com>`_ is a toolkit for frontend web developers that helps automate
    repetitive and time-consuming tasks in the development workflow. We use it in the Aldryn
    architecture to manage the building of your site's frontend static files.

    You don't need to know more about gulp if you don't want to. All the commands you need to use
    for local development purposes are listed in this documentation.


Pushing changes to Aldryn
-------------------------

Your local project directory is a Git repository, and Aldryn runs a Git server. To push your
local changes to the Aldryn cloud, you simply push them to the server.

.. note:: **What on earth is Git?**

    If you've never used Git, or hadn't even had to install it before you read the
    :ref:`local_dev_install_configure` section, don't worry, you don't need to know much about
    it. All you need to know are some very basic commands to use it.

    If you do know Git, the following will be very familiar.

``git status`` provides useful information about the state of your files. If you run it now, you
should be informed that you have *modified* a file::

    $ git status
    Changes not staged for commit:
    	modified:   private/sass/settings/_bootstrap.scss

To get the changes to Aldryn, you need to perform three separate operations: *add*, *commit* and *push*.

add
^^^

First, ``add`` the file to the staging area::

     git add private/sass/settings/_bootstrap.scss

You could actually just do::

    git add private

and any unstaged changes within ``private`` will be added. Run ``git status`` again::

    $ git status
    Changes to be committed:

    	modified:   private/sass/settings/_bootstrap.scss

commit
^^^^^^

Next, ``commit`` the changes to be pushed::

    git commit -m "Changed text colour"

push
^^^^

Finally, ``push`` the changes::

    git push origin develop

Your changes are now on Aldryn. They will instantly be recognised and your site will automatically
reload to show them.
