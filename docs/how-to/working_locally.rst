.. _work_locally:

###################################
Work on your Aldryn project locally
###################################

.. important::

    This how-to assumes that you have a project running locally and have been able to log in. If
    that's not the case, you should follow the steps in :ref:`run_locally` first and then return
    here to continue.

If your project is set up locally, just run::

    aldryn project up

to start the container and server and open your browser with the site, and :ref:`login_locally`.

******************
Working on content
******************

Make some local changes to content - for example, create and publish a new django CMS page.


Making changes to the project
=============================

You're now ready to work on your project's code, which you'll find in the same directory. The
project directory is in fact a Git repository, so you can work on it just as you'd work with any
Git-based project.

Find and open the file ``private/SASS/settings/_bootstrap.scss``, and in change the line::

    $text-color: #666;

to ``red``::

    $text-color: red;



ping index.docker.io

docker-machine ssh

10177  VBoxManage modifyvm "default" --natdnshostresolver1 off
10178  VBoxManage modifyvm "default" --natdnsproxy1 on
