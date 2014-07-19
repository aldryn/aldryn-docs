########
Glossary
########

.. glossary::
    :sorted:

    Control Panel
        The main application of Aldryn. It allows adding and managing :term:`Sites`.
        Located at https://control.aldryn.com .

    Site
    Sites
        A django CMS website deployed from the :term:`Control Panel` running on the
        :term:`Cloud`.

    Base Project
        The base project used as a template for :term:`Sites`. This is
        not a website, but rather part of the :term:`Control Panel`. Git repository
        is at https://github.com/aldryn/cloud-base-project.

    Cloud
        The infrastructure that hosts :term:`Sites`.

    Addon
    Addons
        A Django application which can be installed to a :term:`Site`. Addons
        can be installed on :term:`Sites` using the :term:`Control Panel`

    Login
        Authentication application used by :term:`Control Panel`,
        https://www.django-cms.org and :term:`Deployed Sites`. Located at
        https://login.aldryn.com. Git repository is at
        https://github.com/aldryn/login.aldryn.com.

    Boilerplates
        A set of default templates, static files and optionally `Compass
        <http://compass-style.org>`_ files. A site's Boilerplate can be updated, but cannot be
        switched for another (unlike a Theme).

    Staging
        Changes you make to your environment are applied to its **staged** version.
        This gives you an opportunity to check their effects properly before you
        take the staged version **live**.
