.. _work_locally:

##############################
Basic local project management
##############################

.. important::

    This how-to assumes that you have already completed the previous steps of the tutorial and have
    previously been able to get your site running. If that's not the case, you should follow the
    steps in :ref:`local_setup` first and then return here to continue.

    Below we also assume that you are in the local directory for your project, the one created when
    you first ran the ``aldryn project setup`` command.

Use ``aldryn project status`` for useful information about the state of your project.

.. note::

    If the command reports::

        Error: Aldryn project file '.aldryn' could not be found! Please make sure you're
        in an Aldryn project folder and the file exists.

    then probably you're not actually issuing the command in the correct directory.

::

    % aldryn project status
            Name                      Command               State          Ports
    ------------------------------------------------------------------------------------
    acmewebsite_db_1       /docker-entrypoint.sh postgres   Up      5432/tcp
    acmewebsite_web_1      python manage.py runserver ...   Up      0.0.0.0:8000->80/tcp

This is what you want to see, that both containers are *Up*.

There are two Docker containers for your project:

* ``acmewebsite_db_1`` for the database
* ``acmewebsite_web_1`` for the Django server

This reflects the architecture of the Aldryn cloud, where the project itself and its database run
on different machines.

You can control their status with ``aldryn project up`` and ``aldryn project stop``. Stop them if they are *Up*::

    % aldryn project stop
    Stopping acmewebsite_web_1... done
    Stopping acmewebsite_db_1... done

    % aldryn project status
            Name                      Command                State     Ports
    ------------------------------------------------------------------------
    acmewebsite_db_1        /docker-entrypoint.sh postgres   Exit 0
    acmewebsite_web_1       python manage.py runserver ...   Exit 137

In this case, the ``status`` command shows that both exist, but are not running.

And bring them back with::

    % aldryn project up
    Your project is configured to run at http://192.168.99.105:8000/
    Waiting for project to start.....

which starts the containers and server and opens your browser with the site.

You can check its status again::

    % aldryn project status
            Name                      Command               State          Ports
    ------------------------------------------------------------------------------------
    acmewebsite_db_1       /docker-entrypoint.sh postgres   Up      5432/tcp
    acmewebsite_web_1      python manage.py runserver ...   Up      0.0.0.0:8000->80/tcp

and :ref:`login_locally` as you did previously.

You're now ready to make local changes and push them to Aldryn. In the next three sections of the
tutorial, we'll cover :ref:`working_locally_on_content`, :ref:`working_locally_on_frontend` and
:ref:`working_locally_on_backend`.
