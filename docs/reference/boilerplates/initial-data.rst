Initial Data
============


.. WARNING::
   This feature is still in development and might be temporary unavailable.

To include initial data in your Boilerplate, add **aldryn_client** to your installed apps in your project and
call the management command ``aldryn_dumpdata <outfile> <language>``.

**<outfile>** must be a file named ``data.json`` located next to your ``boilerplate.json`` file.

**<language>** is the language code of the language you want to include
('en' is a good default choice). Only one language can be included.


Handling relations in plugins
-----------------------------

If your plugins include relationships to other models that need to be included, define a setting
``ALDRYN_DUMPDATA_FOLLOW`` which is a list of strings in the form of ``PluginName.relationship_field``.
