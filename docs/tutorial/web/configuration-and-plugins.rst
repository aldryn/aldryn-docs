##########################################
Configuring applications and using plugins
##########################################

Your *Explorer site* comes with a number of applications installed by default. As well as django
CMS, you've already encountered Aldryn News & Blog and Django Filer.

Another application that is pre-installed is Aldryn Events. We'll explore some key django CMS
functionality through this.


.. _create-events-apphook:

=============================
Create an Events landing page
=============================

By default, a django CMS page's content comes from the plugins you insert into it, but if an
application has a django CMS **Apphook**, this application can insert content into your page
automatically.

For example, the Apphook for the Aldryn News & Blog application is what fills your *Blog* page with
the news articles in the system. We'll do the same with Events.

Create a django CMS page to hook the Aldryn Events application into, using *Page > Add Page* from the Toolbar. Call it *Events*, and select **Save and continue editing**.

In your new page's *Advanced settings*, set its ``Application`` to *Events* and **Save** again.

.. image:: images/apphook-setup.png
   :alt: the apphook setup
   :width: 50%
   :align: center

This page is now hooked into to the Aldryn Events application.

.. note::

    Sometimes after making changes related to Apphook configuration, you will see an error on your
    django CMS page. This is a temporary error. Refresh the page after a few moments and the error
    will have resolved itself.

    A future update will address this.


============
Add an event
============

When you're on the *Events* page, you'll see that the django CMS *Toolbar* now contains a new item,
*Events*. Select *Add Event...* from this menu.

.. image:: images/add-event.png
   :alt: the add event item

Provide some basic details:

* the ``Short description`` is a brief summary of the Event, that will be used in lists of Events
* an event must have a ``Start date``, but the other date/time fields are optional
* for the ``Location``, enter as complete address as possible - Aldryn Events will pass this on to
  Google Maps to display a map, so it needs to be unambiguous and accurate

and **Save** your event.

It now exists in the database and will be listed on the *Events* page. Notice that the calendar
also indicates that something’s on.

.. image:: images/event-sample.png
   :alt: an published Event
   :align: center
   :width: 50%

.. image:: images/calender.png
   :alt: the calendar
   :align: center
   :width: 50%

You can use the standard django CMS placeholder interface to add some more text content to your
events, as you did in :ref:`structure-and-content` earlier.


=============
Using plugins
=============

You've already inserted *Text* plugins into placeholders. Many applications also include their own
plugins, and Events is no exception, offering a number of different plugins.

Go back to the *Home* page, and enter *Structure* mode. Select the *Edit* menu of the *CONTENT*
placeholder, and scroll down through the list of available plugin options until you find the
*Event* plugins. Choose *Upcoming or past events*.

.. image:: images/events-plugin.png
   :alt: Aldryn Events plugins

Check the plugin's settings, and **Save**.

The plugin will be inserted at the bottom of the list of plugins in the *CONTENT* placeholder
block, but you can drag it to any position you like (even to another placeholder block).

When you return to *Content* mode, you'll see that on the *Home* page the plugin now automatically
lists the event you created.

.. image:: images/homepage-event.png
   :alt: The plugin at work in the home page
