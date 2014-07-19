=============
Configuration
=============

A theme requires the same setup as an addon. In addition you will have to declare the assigned boilerplate.
For example, `aldryn-theme-standardsite <https://github.com/aldryn/aldryn-theme-standardsite>`_ requires
aldryn-boilerplate, so we assign ``"theme": "aldryn-boilerplate"`` at the top to declare it as a **theme addon**.

This is the example for aldryn-theme-standardsite:

.. code-block:: json

    {
        "theme": "aldryn-boilerplate",
        "name": "Theme Standardsite",
        "description": "Custom theme",
        "version": "0.0.1.a",
        "url": "https://github.com/aldryn/aldryn-theme-standardsite",
        "package-name": "aldryn-theme-standardsite",
        "installed-apps": [
            "aldryn_theme_standardsite"
        ],
        "author": {
            "name": "Divio AG",
            "url": "https://www.divio.ch"
        }
    }
