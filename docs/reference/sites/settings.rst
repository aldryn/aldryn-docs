##########
Management
##########


=============
Manage Addons
=============

.. todo:: Installation
.. todo:: Configuration
.. todo:: Updating


Removing Addons
===============

Be aware when removing an Addon that you may leave your site in an unstable state.

For example,
if your site has a page with an apphook belonging to a particular application, removing that
application without first removing the apphook will cause an error every time you try to access
that page.


==============
Manage Project
==============

Backup and restore your project, its database, media files, and so on

.. todo:: create backups
.. todo:: Restore database
.. todo:: Download database dumps; restore from dump
.. todo:: Duplicate/delete/transfer


.. _domain_settings:

===============
Domain Settings
===============

In the Dashboard for your project, select *Domain settings* and provide the URL under which you want the site to be hosted.

Then point your the domain's records (DNS settings) to the address of the project, which will be given in dashboard, using it as a ``CNAME`` ('Canonical Name')::

    www.example.com CNAME my-site-name.us-iad-rs.aldryn.net

We use ``CNAME`` records rather than IP addresses (``A`` records) because the IP address of your
project is not guaranteed to remain the same. With a ``CNAME``, domain name services will always be
able to find your site even if the IP address changes.

Your domain registrar will allow you to set the ``CNAME`` for your site appropriately.
