===========
First steps
===========

This is a rough overview of how to create and implement a theme:

#. Create a base theme project similar to https://github.com/aldryn/aldryn-theme-standardsite

#. Add ``aldryn-snake`` and ``aldryn-theme-standardsite`` to your installed apps **before** any other
   apps that use templates or static files for local testing

#. Create essential symlinks to make templates recocnisable on your local setup:

   ``cd aldryn-theme-standardsite/aldryn_theme_standardsite/templates/``

   ``ln -s . aldryn_theme``

#. Copy and prepare all the files you need: **templates**, **static** and **private**

#. Create symlinks for missing libs within sass or similar if there are shared within your boilerplate:

   ``ln -s divio-boilerplate/private/sass/libs libs``

#. Create and maintain your ``app.json``