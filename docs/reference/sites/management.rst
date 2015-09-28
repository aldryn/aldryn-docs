########
Settings
########


================
General Settings
================

Change your project's name, languages and other key settings.

.. todo:: What happens if you change the name
.. todo:: What happens if you remove a language
.. todo:: Base project release channel
.. todo:: Page speed
.. todo:: Caching


================
Sharing Settings
================

A basic introduction to the sharing settings is provided in :ref:`collaborating`.

.. todo:: The permissions model


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
