########
Concepts
########

============
Boilerplates
============

A **Boilerplate** defines the basic essence of an Aldryn site, through its default templates and
staticfiles. All Aldryn sites are based upon a Boilerplate - even if it happens to be the absolutely
minimal one possible, with no customisation.

A Boilerplate can be updated; when the updated version of the Boilerplate is deployed for
a site that uses it, the site will reflect the changes have been made.

A site's Boilerplate is *essential* to it. It's not merely an attribute of the site; it's what
defines it.

In the Aldryn platform, you can an existing Boilerplates to define a new site, or create and curate
your own Boilerplates that suit your purposes.

======
Themes
======

A **Theme**, like a Boilerplate, is described by a set of templates and staticfiles.

However Themes are *inessential* to a site. A site can have no theme at all, and a theme can be
applied and removed and replaced with another.

A Theme is overlaid upon (and can override files from) a Boilerplate. Themes are particularly
useful when you need to be able to apply common styling to a number of different sites, that might
be based upon different Boilerplates and have quite different functionality.

======
Addons
======

An **Addon** is a Django application or other package that has been prepared for integration into
the Aldryn platform.
