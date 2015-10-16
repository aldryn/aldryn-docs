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

You're now ready to make local changes and push them to Aldryn. In the next three sections of the
tutorial, we'll cover :ref:`working_locally_on_content`, :ref:`working_locally_on_frontend` and
:ref:`working_locally_on_backend`.
