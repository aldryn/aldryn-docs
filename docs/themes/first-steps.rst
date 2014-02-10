===========
First steps
===========

This is a rough overview of how to create and implement a theme:

#. Create a base theme project similar to https://github.com/aldryn/aldryn-theme-standardsite

#. Add ``aldryn-snake`` and ``aldryn-theme-standardsite`` to your installed apps **before** any other
   apps that use templates or static files for local testing

#. Create essential symlinks to make templates recocnisable on your local setup:

   ``cd aldryn-theme-standardsite/aldryn_theme_standardsite/templates/``

   ``ln -s . aldryn_theme_standardsite``

#. Copy and prepare all the files you need: **templates**, **static** and **private**

#. Create symlinks for missing libs within sass or similar if there are shared within your boilerplate:

   ``ln -s aldryn-boilerplate/private/sass/libs libs``

#. Create and maintain your ``addon.json``


When to use a theme?
--------------------

We recommend using a theme only if you use the same design/frontend within multiple sites. This allows you to update
the design centrally and apply the change to all your sites.

However, it does not make sense to create a theme for a single site/design, as the update process can be done either
within the boilerplate alone or manually.