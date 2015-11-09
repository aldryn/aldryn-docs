.. _addon-packaging:

###############
Addon packaging
###############

An Aldryn Addon should be packaged like a standard Django application, and needs be accompanied by
some additional files for Aldryn's use.


***************
Packaging files
***************

These files should all be placed in the root directory of your Addon, leaving you with a file structure that looks
like::

    your-addon/         # the outer package directory
        addon.json
        setup.py
        MANIFEST.in
        LICENSE.txt
        README.rst
        your_addon/     # the inner module directory
            __init__.py
            models.py
            tests.py
            views.py
            templates

Other than ``addon.json``, these are all standard Python packaging files.

.. note::

    If you use the files Aldryn provides when :ref:`creating a new Addon on Aldryn
    <prepare_aldryn_for_addon>`, you will have a set of minimal but adequate files to work with.


``addons.json``
===============

The only strictly-required file, and needed for :ref:`aldryn addon validate
<addon-related-commands>` to run successfully.

Here's an example of a configuration file using all options:

.. code-block:: json

    {
        "name": "My Addon",
        "description": "This is my custom application.",
        "url": "https://github.com/aldryn",
        "package-name": "my-addon",
        "installed-apps": [
            "my_addon"
        ],
        "author": {
            "name": "Divio",
            "url": "https://www.aldryn.com"
        },
        "license": {
            "name": "BSD"
        }
    }


Options
-------

Most of the options are self-explanatory, but please take note of:

.. describe:: package—name

   The **package** name of the application; this needs to match the ``name`` option in ``setup.py``.

.. describe:: installed—apps

   A list of applications that needs to be added to ``INSTALLED_APPS`` in ``settings.py``.


``setup.py``
============

An Addon needs to be packaged in the usual Python way, starting with the ``setup.py`` file.


``README.rst``
--------------

The ``README.rst`` as provided by Aldryn will be empty unless you have a *Description* for it in
`managing your Addons <https://control.aldryn.com/account/my-addons/>`_ on Aldryn. You can of
course you can edit the file manually, but you will need to add the *Description* on Aldryn
separately.

This should be a short introduction what the package is about, and provide some basic instructions for non-Aldryn users, if the application can be used independently.

Include a link back to Aldryn:

* In RST: ``This package is compatible with `Aldryn <http://www.aldryn.com>`_.``


``LICENSE.txt``
---------------

Any Addon that you would like others to be able to use **must** have a valid licence file,
otherwise you will be unable to share it on Aldryn.

Aldryn has a set of licences to choose from in `managing your Addons
<https://control.aldryn.com/account/my-addons/>`_, but you can add your own.


``MANIFEST.in``
---------------

The ``MANIFEST.in`` file lists the locations of resources such as templates that need to be included in an installation.


``__init.py__``
---------------

``__init.py__`` contains the application version. This starts at ``0.0.1`` by default, since it's
the first version of any new application.

Please follow a meaningful versioning scheme, such as `Semantic Versioning <http://semver.org>`_.