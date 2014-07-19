Code Conventions
================

There are many Boilerplates and equally as many code conventions and styleguides. We will not go as far as to
command you to use tabs over spaces, camcelCase over under_score, but we might want you to redirect to our
`aldryn-boilerplate <https://github.com/divio/divio-boilerplate>`_'s README.rst which offers some advice.

When it all comes down, you can use whatever coding style you wish. There are though, some restrictions concerning
the folder structure:

.. code-block:: text

    mysite/
        ├─ private/
        ├─ static/
        └─ templates/

These folders are all **required**.


private
-------

You can place preprocessors within the private folder, such as "sass", "less" or "coffeescript".
These will automatically compile to your specified destination. In case of sass, configuration is defined
within ``config.rb``.

*This folder cannot be access over http.*


static
------

You can place almost any layout specific file here: css, javascript, fonts, cat pictures and even folders.

*This folder can be accessed ofer http.*


templates
---------

Django is per default always looking for a ``base.html`` file located within /templates/. This is the starting
point for your html structure and design.

*This folder cannot be access over http.*
