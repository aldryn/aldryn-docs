.. _domain_names:

###########################
Using your own domain names
###########################


You'll probably want to use your own domain name with Aldryn, rather than having a site served at
``example.us-iad-rs.aldryn.io`` or similar.

Your custom domain will only apply to your project's *Live* site - the *Test* site will continue to
be served under our ``aldryn.io`` domain.

You'll get one included *Live* server instance as standard with each of our account packages, and
can add as many more as you need.


***************************
On the Aldryn Control Panel
***************************

On the Aldryn Control Panel for your site, select *Domain Settings*, and enter your domain name.,
for example ``example.com``. If you want to use sub-domains, such as ``www.example.com``, add those
separately.


********************
At your DNS provider
********************

You will also need to configure the domains at your DNS provider.

Aldryn will suggest the entries to use.

.. important::

    Aldryn simply provides a *suggestion* of the values to use.

    Even if you accept them, you will still need to enter them into your zone file correctly; you
    cannot just paste the suggested line in to the file. Most DNS control panels will require you
    to enter the type of record, the name and the value into separate fields.


Using an ``ALIAS``
==================

For root domains, such as ``example.com``, it will suggest using a DNS ``ALIAS``. This allows the
DNS system to resolve ``example.com`` to your Aldryn server.

For example, you'd edit your zone file to include::

    example.com ALIAS example.us-iad-rs.aldryn.io

.. note::

    Not all DNS providers support ``ALIAS`` records. In this case, you will have to use either
    a ``CNAME`` or an ``A`` record.


Using a ``CNAME``
=================

For sub-domains, such as ``www.example.com``, Aldryn will suggest using a DNS ``CNAME``. This
allows the DNS system to resolve ``www.example.com`` to your Aldryn server. For example::

    www.example.com CNAME example.us-iad-rs.aldryn.io

.. note::

    A limitation of ``CNAMES`` is that they **only** work on sub-domains. You will not be able to
    resolve a root domain such as ``example.com`` to your Aldryn site with a CNAME.


Using an ``A`` record
=====================

An ``A`` record (an *Address* record) directly maps a domain name to an IP address. You can manage
both domains and sub-domains with an ``A`` record.

You can use the IP address of your Aldryn server to add an ``A`` record to your domain's
configuration.

.. note::

    Although your site's IP address will only change under rare circumstances, it is not guaranteed
    never to change. Using an ``A`` record means that you may in future need to edit your domain's
    zone file in response to infrastructure changes on Aldryn.

    However, we will inform users should this ever be necessary.

    If possible, use an ``ALIAS`` rather than an ``A`` record for root domains, and a ``CNAME``
    rather an ``A`` record for sub-domains.
