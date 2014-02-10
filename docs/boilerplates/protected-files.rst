===============
Protected Files
===============

Protected files have an additional **lock status** which is visually represented on the aldryn.com online editor.
This status represents, that these files should not be modified in any way.
This could apply to libraries such as normalize.css or jquery.min.js

An example of a configuration showing only the **protected** block:

.. code-block:: json

    ...
    "protected": [
        "templates/base.html",
        "static/js/jquery.min.html",
        "static/css/normalize.css",
    ]
    ...