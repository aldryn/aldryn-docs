Protected Files
===============

Protected files are those that should not be modified in any way.
This could apply to libraries such as ``normalize.css`` or ``jquery.min.js``

An example of a configuration showing only the ``protected`` block:

.. code-block:: json

    ...
    "protected": [
        "templates/base.html",
        "static/js/jquery.min.html",
        "static/css/normalize.css",
    ]
    ...