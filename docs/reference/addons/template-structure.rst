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
        <div class="aldryn aldryn-blog">
            {% block blog_content %}{% endblock %}
        </div>
    {% endblock content %}

The **block blog_content** ensures that your addon has its own block extension to work with so all sub templates
have a common ground.


Addons
------

To structure addons (plugins), we recommend using a separate folder **plugins** within your app. The name of the
added html file should represent the functionality of the addon. Here an example of our previous structure:

.. code-block:: text

    templates/
    ├─ aldryn_blog/
    │  ├─ plugins
    │  │  └─ latest_posts.html
    │  └─ base.html
    └─ base.html

This way we get a good idea of where to find addons which can be injected using django CMS plugin system and apphook
functionalities. In some cases addons provide different themes or variants like the gallery. A recommended structure
there would be something like:

.. code-block:: text

    templates/
    ├─ aldryn_gallery/
    │  └─ plugins
    │    ├─ base.html
    │    ├─ feature/
    │    │  └─ gallery.html
    │    └─ standard/
    │       └─ gallery.html
    └─ base.html

In this case the gallery provides two kind of templates, a standard version and a feature version. Both gallery.html
files extend ``aldryn_gallery/plugins/base.html`` in order to keep some common elements in one file. Yet that base.html
is nowhere called from within the addon. The backend just picks standard/gallery.html or feature/gallery.html according
to the settings within the plugin.

Naming
------

Ideally use the prefix of your package name as a class name followed by the
addon name, for example::

    <div class="aldryn aldryn-events"></div>

In addition you can nest further if you are rendering a plugin or a list view
etc.::

    <div class="aldryn aldryn-events aldryn-events-latest">
        <ul>
            <li>...</li>
        </ul>
    </div>

This allows frontend developers to customise your templates using css alone
without changing the templates structure

Sekizai
-------

It is recommended to use single-line sekizai declarations in order to merge
duplicated entries for file injections::

    {% load sekizai_tags %}
    {% addtoblock "css" %}<link href="{% static 'css/theme.css' %}" rel="stylesheet">{% endaddtoblock %}
    {% addtoblock "js" %}<script src="{% static 'libs/jquery.min.js' %}"></script>{% endaddtoblock %}

Inline JavaScript should be avoided at all.
