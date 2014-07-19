===========
Inheritance
===========

Inheritance is an important factor when creating a theme. If we look at a traditional setup, we would proceed as follows:

#. Create a project
#. Copy essential files (boilerplate)
#. Setup addons (packages)
#. Modify code (frontend)

We quickly lose the opportunity to update code automatically as we change code on almost any place. This can be
especially tricky if you have to support a specific frontend setup for multiple sites.

In case of aldryn we separate aldready **boilerplates** and keep them up to date, but what about the design?


How it works
------------

In short:

#. A boilerplate creates the foundation
#. Addons create the structure but do not modify the foundation
#. A theme creates the look and might modify the structure or foundation

After the site is created and a boilerplate is available, you will start adding addons to your site. Addons add
additional templates and static files to your setup. Addons do **not overwrite** existing templates or static files.

When adding a theme hovever, we might want to extend the foundation a bit or change the structure slightly. So
a theme can control both and overwrite files if required.
