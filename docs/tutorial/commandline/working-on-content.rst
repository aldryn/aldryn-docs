.. _working_locally_on_content:

##################
Working on content
##################

********
Database
********

All changes to the content of a django CMS site are recorded in the database, so by pushing and
pulling the database to or from Aldryn, you can work locally or remotely and synchronise changes.

First, make some local changes to content - for example, create and publish a new django CMS page.

Now in the terminal, push the changes in the database to Aldryn::

    aldryn project push db

Those changes will be immediately reflected online, in the Test version of your site. Similarly,
if you make changes to your site's content on Aldryn, you can pull it down to the local version::

    aldryn project pull db

And then relaunch the local site to check that the changes are reflected locally::

    aldryn project up


*****
Media
*****

django CMS stores media files (images and other document) separately from the database in whichever
filesystem has been specified. If your changes involve changes to *files* (typically, uploading
files to the Filer, or moving or deleting them), then as well as transferring the database you will
also need to perform a similar operation on your media files.

Pulling and pushing media changes works in the same way, with the command ``aldryn project pull
media`` and ``aldryn project push media``.

Upload a new file to the Filer in your local project, and use a plugin to place it in a page.

Once again, push the changes to Aldryn, not forgetting to push your database changes *also*,
because in this case we have made changes to the database as well as media::

    aldryn project push media
    aldryn project push db

and check on Aldryn that they are shown there too. To do things the other way round, having made changes on Aldryn that you want locally::

    aldryn project pull media
    aldryn project pull db

.. warning:: The ``push`` and ``pull`` commands are **destructive operations**.

    Pushing and pulling data and files will overwrite information. Check that this is what you
    intend before confirming the operation.

    As you will note from the warning messaged displayed when you execute these commands, you should
    create backups before running them, so even if you inadvertently overwrite
    information, you can recover it from a backup.
