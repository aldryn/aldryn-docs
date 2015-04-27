##################
Template Structure
##################

.. note::

    In this document we assume you are working with a standard Aldryn Boilerplate that uses the `Aldryn Boilerplates
    <https://github.com/aldryn/aldryn-boilerplates>`_ helper package. These follow certain patterns, and you are
    encouraged to follow them too.

    You **don't have to follow these conventions**, though we recommend that you do. Following them will mean your Addon
    will be more likely to play nicely with other Addons, behave in ways that other users and developers expect and
    generally be a useful and valued contribution to the Aldryn ecosystem.

    So, treat all directions in this document, unless explicitly indicated otherwise, as recommendations that you can
    choose not to follow.


This documentation extends the official django CMS `Developing addon applications: best practices
<http://docs.django-cms.org/topic/developing_addons.html>`_. It's important to note that within the Aldryn ecosystem
these recommendations are much stronger, and in some cases define *requirements*, not just good practices, so treat the
recommendations there with due respect.

====================================================
Maintaining compatibility with multiple Boilerplates
====================================================

Your Addon may have templates that are simple enough to be **compatible** with multiple Boilerplates. Typically though,
you can **enhance** your Addon's templates' by adapting them to a particular Boilerplate - for example, applying
CSS classes to the elements in the HTML to take advantage of the Boilerplate's CSS and JavaScript provisions.

In this case, for each Boilerplate you'd like to support, also add a set of templates at::

    boilerplates/boilerplate_name/templates/

For example::

    aldryn_addon
        templates/
            aldryn_addon/
                 base.html
        boilerplates/
            aldryn_boilerplate_bootstrap3/
                templates/
                    aldryn_addon/
                         base.html
            boilerplate_name/
                templates/
                    aldryn_addon/
                         base.html

and do this for as many Boilerplates as you wish to support.

This does of course mean more work for you as a project maintainer. The payoff is enhanced compatibility with multiple
Boilerplates. When uploading your Addon to the Marketplace, ensure that you indicate which Boilerplates get special
support in this way.

For more general information about good practices in creating Addons, see `Developing addon applications: best practices
<http://docs.django-cms.org/topic/developing_addons.html>`_ in the official django CMS documentation.
