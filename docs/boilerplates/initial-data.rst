============
Initial Data
============

TODO this needs testing


Including initial data
----------------------

To include initial data in your boilerplate, add cmscloud_client to your installed apps in your project and
call the management command cmscloud_dumpdata <outfile> <language>. <outfile> must be a file named data.yaml
located next to your boilerplate.yaml file. <language> is the language code of the language you want to include
('en' is a good default choice). Only one language can be included.


Handling relations in plugins
-----------------------------

If your plugins include relationships to other models that need to be included, define a setting
``CMSCLOUD_DUMPDATA_FOLLOW`` which is a list of strings in the form of PluginName.relationship_field.
