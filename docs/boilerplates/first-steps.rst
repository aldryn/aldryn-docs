===========
First Steps
===========

Boilerplates are a set of default templates and staticfiles, optionally with initial data.

The structure will be something like:

* **/private/** for files like less, sass or haml (this folder is not publicly accessible)
* **/static/** for static files like images, stylesheets and javascript
* **/templates/** for all required templates including the starting base.html
* **boilerplate.json** the configuration file described in :doc:`boilerplate.json <configuration>`

A full example can be found on https://github.com/divio/divio-boilerplate.


Templates
---------

Django sets the standard template to ``templates/base.html``. So we will start our "Hello World" example within this
files. But before we write any code, we need to clarify some concepts Aldryn uses. First of all, there are
two important libraries for managing media and snippet insertions:

* `django-sekizai <https://github.com/ojii/django-sekizai>`_
* `aldryn-snake <https://github.com/aldryn/aldryn-snake>`_

**django-sekizai** requires ``{% render_block 'css' %}`` and ``{% render_block 'js' %}`` to be inserted
within your base.html. The css block needs to be added within the **<head>** section of your document.
The js block can bee added either within the **<head>** or **<body>** section. However we recommend
adding it just before the **</body>** tag so your site loads first everything else before it reaches the javascript
part.

**aldryn-snake** adds two very specific tags:
``{{ ALDRYN_SNAKE.render_head }}`` and ``{{ ALDRYN_SNAKE.render_tail }}``. These behave similar to django-sekizai,
except they can also render entire html snippets or code. render_head should be added before the closing **</head>**
section and render_tail just before the closing **</body>** tag.

In addition, we need to implement the **django-cms** specific tags. Add ``{% load cms_tags %}`` as the very first line
within your base.html and than include ``{% cms_toolbar %}`` just after your **<body>** tag.

Now we include some basic markup into **base.html** and the result should be similar to:

.. code-block:: html

    {% load cms_tags %}
    <!doctype html>
    <html>
    <head>
        <meta charset="utf-8" />
        <title>Hello World</title>
        {% render_block "css" %}
        {{ ALDRYN_SNAKE.render_head }}
    </head>
    <body>
        {% cms_toolbar %}

        <p>Hello World</p>p>

        {% render_block "js" %}
        {{ ALDRYN_SNAKE.render_tail }}
    </body>
    </html>


.. HINT::
   Within the divio-boilerplate we use **base_root.html** to define this setup and base.html extends base_root.html.
   This is a perfect example of how djangos template inheritance works and you might want to check more possibilities
   within the  `django template documentation <https://docs.djangoproject.com/en/dev/ref/templates/>`_.


Static Files
------------

This folder is completely accessible to the public. You can access files by combining your websites URL
and the folder **/static/**. You would end up with something like http://www.aldryn.com/static/favicon.png.

The structure there can be freely arranged as you please. For the divio-boilerplate we choose shorthands like
**js**, **css**, **img**. You can also place your fonts, favicons and much more into /static/.

We recommend adding only layout specific files. Images for galleries or downloadable files should be managed
using the `django-filer <https://github.com/stefanfoulis/django-filer>`_ which can be accessed through the admin.

You can link within your templates to your static files using django's ``{% static "" %}`` template tag.
For this to work, you need to add ``{% load static %}`` first and than reference to your file, for example:
``{% static "img/logo.png" %}``. You can ommit /static/ as the template tag will automatically append the correct path.
This is helpfull if you are using CDN's, which Aldryn uses per default. So we **recommend** to always use this tag
within your templates or snippets.


Private Files
-------------

todo