##############
Custom Domains
##############

Enter your custom domain on the general settings tab on the controlpanel. Then point your DNS to your site url.::

    www.example.com CNAME my-site-name.us-iad-rs.aldryn.net

Here are instructions on adding DNS-records for some popular DNS providers:

    * http://support.dnsimple.com/articles/advanced-editor
    * http://support.godaddy.com/help/article/680/managing-dns-for-your-domain-names#cnames


why a CNAME record?
===================

We recommend using a CNAME record since the IP of your app might change over time. With a CNAME these changes "just work". If you choose to use an A-record you'll have to manually adjust DNS settings in case of an IP change.
