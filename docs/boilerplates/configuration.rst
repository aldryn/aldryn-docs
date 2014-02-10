==================
Configuration File
==================

A boilerplate requires a configuration file named ``boilerplate.json`` which follows the general json guidelines.
This file is placed within the root/ of your boilerplate and can be validated using the **cmscloud** clients command
``cmscloud boilerplate validate``.

The following is an example of a configuration file using all options:

.. code-block:: json

    {
        "name": "My Boilerplate",
        "description": "Uses default resets and stylings.",
        "version": "1.0.0",
        "url": "https://github.com/aldryn",
        "templates": [
            ["fullwidth.html", "full width"],
            ["sidebar_left.html", "sidebar left"],
            ["sidebar_right.html", "sidebar right"]
        ],
        "protected": [
            "templates/base.html",
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

.. option:: templates

   A list of tuples in the form of (template_path, verbose_name).
   The template_path is the path to the template as used by Django.
   The verbose name is what users will see.

.. option:: protected

   A list of files that are protected.
   Protected files will be upgraded when a user upgrades the boilerplate and has
   not changed the file since the last upgrade.

.. option:: author

   .. option:: name:

      Your name!

   .. option:: url:

      URL to your website (optional)
