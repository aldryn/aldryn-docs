#######################
Command-line operations
#######################

See the :ref:`tutorial_backend_developers` for an introduction to the command-line and the :ref:`Command-line reference <command-line-client-reference>` documentation.


************************
Set up a project locally
************************

* run ``aldryn project setup <your project's slug>``


*************************************
Run a previously set-up local project
*************************************

* Launch Docker Quickstart Terminal
* run ``aldryn doctor`` to check that all is well with the environment
* make sure you are in the project directory that was created when you ran the ``setup`` command
* run ``aldryn project up`` to start the Docker containers and open your site


************************
Managing a local project
************************

These commands need to be run in the project's directory.

* check status: ``aldryn project status``
* ``aldryn project open`` will open the site in your web browser
* ``aldryn project stop`` shuts a project's containers down (roughly the opposite of ``up``)



********************
Key developer tools
********************

* ``docker-compose logs`` (with optional ``web`` and ``db`` arguments to specify the container)
* ``docker-compose run --rm web python manage.py shell`` will drop you into the Django shell for the
  project
