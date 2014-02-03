===========
First steps
===========

Boilerplates are a set of default templates and staticfiles, optionally with initial data.

To get started, create a normal Django (CMS) project and develop your boilerplate.
When you're happy with how it looks and optionally added some default content,
you can transform this into a boilerplate.

In your base template (or base templates), you must include the variable ``{{ TEMPLATE_API_REGISTRY.render_head }}``
in the head section of your HTML, and ``{{ TEMPLATE_API_REGISTRY.render_tail }}`` just before the closing **</body>** tag.

Further, your base template must include the ``{% cms_toolbar %}`` template tag right after the opening **<body>**
tag (make sure you ``{% load cms_tags %}`` first).

Also, you must include two sekizai namespaces, ``{% render_block 'css' %}`` in your head section and
``{% render_block 'js' %}`` just before the **{{ TEMPLATE_API_REGISTRY.render_tail }}** variable.

Now add a :doc:`boilerplate.json <configuration>` file to the root of your project
(next to the static and templates folders).