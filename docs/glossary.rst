########
Glossary
########

.. glossary::

    Control Panel
        The main application of Aldryn. It allows adding and managing :term:`Sites`.
        Located at https://control.aldryn.com .

    Site
    Sites
        A django CMS website deployed from the :term:`Control Panel` running on the :term:`Cloud`.

    Base Project
        The base project used as a template for :term:`Sites`. This is
        not a website, but rather part of the :term:`Control Panel`. Git repository
        is at https://github.com/aldryn/cloud-base-project.

    Cloud
        The infrastructure that host :term:`Sites`.

    Addon
    Addons
        A Django application which can be installed to a :term:`Site`. Addons
        can be installed to :term:`Sites` on the :term:`Control Panel`

    Login
        Authentication application used by :term:`Control Panel`,
        https://www.django-cms.org and :term:`Deployed Sites`. Located at https://login.aldryn.com.
        Git repository is at https://github.com/aldryn/login.aldryn.com.

    Boilerplates
        A set of templates, static files and optionally compass files. Similar to a theme, but
        Aldryn does not allow changing of boilerplates, which is why they're not named theme.