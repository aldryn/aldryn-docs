.. _working_locally_on_frontend:

##################################
Developing your project's frontend
##################################

You're now ready to work on your project's code, which you'll find in the same directory. The
project directory is in fact a Git repository, so you can work on it just as you'd work with any
Git-based project.

The project contains site assets, such as CSS and image files, Django configuration files
(``settings.py``, ``urls.py`` and so on) and more.


********************
Making local changes
********************

We'll begin by making a simple CSS change, just as we did in :ref:`edit_a_file_locally`. If you
have not yet completed that tutorial, you are strongly recommended to do that now, so that you are
familiar with some of the basics of the system.

Find and open the file ``private/sass/settings/_bootstrap.scss`` in your local project directory,
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

You can do the same with HTML files. For example, if you want to change the 404 ("Page not found")
template, edit ``/templates/404.html`` (note that the Aldryn Test server displays a Django
traceback, so you will only see the 404 page on the Live server).


*************************
Pushing changes to Aldryn
*************************

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
===

First, ``add`` the file to the staging area::

     git add private/sass/settings/_bootstrap.scss

You could actually just do::

    git add private

and any unstaged changes within ``private`` will be added. Run ``git status`` again::

    $ git status
    Changes to be committed:

    	modified:   private/sass/settings/_bootstrap.scss

commit
======

Next, ``commit`` the changes to be pushed::

    git commit -m "Changed text colour"

push
====

Finally, ``push`` the changes::

    git push origin develop

Your changes are now on Aldryn. They will instantly be recognised and your site will automatically
reload to show them.
