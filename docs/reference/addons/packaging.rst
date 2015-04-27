#######################
Packaging Aldryn Addons
#######################

An Addon is a re-usable Django appplication with some extra metadata that allows it to be deployed
in an Aldryn project.

.. _addon-packaging:

*********
Packaging
*********

See :ref:`package_your_addon` for step-by-step instructions on packaging a Django application as
an Addon.

In general though, an Addon needs to be a standard Python application with a ``setup.py`` and so on.

addon.json
==========

In addition, it requires a configuration file named ``addon.json`` which follows the general json
guidelines.


``addon.json`` has two required keys, ``package-name`` and ``installed-apps``:

.. code-block:: json

    {
        "package-name": "my-addon",
        "installed-apps": [
            "my_addon"
        ],
    }

Options
-------

.. option:: package—name

   The **package** name of your app. Generally it makes sense to use the name of your package given
   its the setup.py under ``name``, but it doesn't have to be the same - this is Aldryn's internal
   name for the package.

.. option:: installed—apps

   A list of apps that needs to be added to the ``INSTALLED_APPS`` of the project's ``settings.py``
   to make your app work.

``setup.py``
============

A standard ``setup.py``.

You are **strongly advised** to download the one Aldryn provides automatically and use that, making
any amendments (for example to ``install_requires``) as necessary.

``setup()`` **must** provide a version number. Aldryn relies on this to provide information about
updates, so it must be incremented properly. The Aldryn-provided version of ``setup.py`` follows
the convention of getting the version number from ``__init__.py``.

``LICENSE.txt``
===============

All Addons that are to be shared **must** have a valid license file, called ``LICENSE.txt``, in the
root of the Project. You can upload an Addon without a license file, but you won't be able to share
it.

When :ref:`creating your Addon in the Aldryn interface <package_your_addon>` creating your Addon
in the Aldryn interface, you can choose a suitable licence from the list available and download a
suitable one, or you can create your own.

``README.rst``
==============

Note that this file **must** be called ``README.rst``.

Please include:

* a short introduction what the package is about
* installation instructions for non-Aldryn users
* information about Aldryn compatibility
* links to Aldryn, documentation, the official source repository

``MANIFEST.in``
===============

A standard manifest file.

Aldryn provides one for download that will work for most packages.

``__init__.py``
===============

You are recommended to use the ``__init__.py`` provided by Aldryn for download (see the note about
version numbering above).

We recommend a version number in the format::

    __version__ = "0.0.1"
