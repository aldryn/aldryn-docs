======
Addons
======

Addons are the building blocks for your website. An Addon is a re-usable django app with some
extra metadata that makes it work on aldryn.

Todo:

* dependency definitions (in setup.py, version ranges)
* migration rules (never delete)
* baseproject compatibility (to Django & django CMS version? or to base-project version?)
* sitemap.xml integration (an api/app?)
* multilingual rules
* draft/publish rules
* template naming and structure rules
* boilerplate support rules
* cms integration rules
    * plugin naming
    * toolbar integration guidelines
    * apphook guidelines
    * exception handling in apphooks/plugins (should not break with no apphook defined yet)
    * adding default apphook on installation

when available:

* search integration rules
* celery rules


.. toctree::
    :maxdepth: 2

    packaging
    addon-configuration
    code-conventions
    database-migrations
    injecting_html
    template-structure
