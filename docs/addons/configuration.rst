=============
Configuration
=============

If you want to write an addon, write a standard Django app (including working setup.py!).

An addon requires a configuration file named ``addon.json`` which follows the general json guidelines.
Place this file next to your setup.py and you should be ready to run ``aldryn addon validate``.

The following is an example of a configuration file using all options:

.. code-block:: json

    {
        "name": "My Addon",
        "description": "This is my custom application.",
        "version": "1.0.0",
        "url": "https://github.com/aldryn",
        "package-name": "my-addon",
        "installed-apps": [
            "my_addon"
        ],
        "author": {
            "name": "Divio",
            "url": "https://www.aldryn.com"
        }
    }


Options
-------

.. option:: name

   The name of your boilerplate

.. option:: description

   A description of your boilerplate

.. option:: version

   The version of this boilerplate (must be compatible with LooseVersion)

.. option:: url

   The url to your repository or website

.. option:: package-name

   The **package** name of your app (the thing you have in setup.py under ``name``)

.. option:: installed-apps

   A list of apps that need to be added to ``INSTALLED_APPS`` to make your app work.

.. option:: author

   .. option:: name:

      Your name!

   .. option:: url:

      URL to your website (optional)
