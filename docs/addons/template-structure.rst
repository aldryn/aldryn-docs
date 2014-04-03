Template Structure
==================

To keep addons in sync, we recomment some guidelines in how to structure the templates folder.


Base Template
-------------

If your addon provides **apphook** functionalities, your single point of entry should be a ``base.html`` which extends
the roots base. For example:

.. code-block:: text

    templates/
    ├─ aldryn_blog/
    │  └─ base.html
    └─ base.html

This way we can ensure your addon is extending your general layout and adds additional functionalities. But this is
not all. The roots *base.html* should contain a block content: ``{% block content %}{% endblock content %}``. With
this convention in mind, you can easily create a layout which also works for all addons. Your apps base.html would
look something like:

.. code-block:: html

    {% extends "base.html" %}
    {% block content %}
        <div class="addon-blog">
            {% block blog_content %}{% endblock %}
        </div>
    {% endblock content %}

The **block blog_content** ensures that your addon has its own block extension to work with so all sub templates
have a common ground.


Addons
------

To structure addons (plugins), we recommend using a separate folder **addons** within your app. The name of the
added html file should represent the functionality of the addon. Here an example of our previous structure:

.. code-block:: text

    templates/
    ├─ aldryn_blog/
    │  ├─ addons
    │  │  └─ latest_posts.html
    │  └─ base.html
    └─ base.html

This way we get a good idea of where to find addons which can be injected using django CMS plugin system and apphook
functionalities. In some cases addons provide different themes or variants like the gallery. A recommended structure
there would be something like:

.. code-block:: text

    templates/
    ├─ aldryn_gallery/
    │  └─ addons
    │    ├─ base.html
    │    ├─ feature/
    │    │  └─ gallery.html
    │    └─ standard/
    │       └─ gallery.html
    └─ base.html

In this case the gallery provides two kind of templates, a standard version and a feature version. Both gallery.html
files extend ``aldryn_gallery/addons/base.html`` in order to keep some common elements in one file. Yet that base.html
is nowhere called from within the addon. The backend just picks standard/gallery.html or feature/gallery.html according
to the settings within the plugin.
