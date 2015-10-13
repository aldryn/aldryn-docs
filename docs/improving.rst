######################################
Helping improve Aldryn's documentation
######################################

Whether you're a core member of the Aldryn development team or a visitor trying it out for the
first time, you can make a valuable contribution to Aldryn as a whole by helping us improve this
documentation.

You can help by:

* `giving us feedback <mailto:support@aldryn.com>`_ about something you thought was poorly or
  confusingly or simply not explained
* `sending us your suggestion <mailto:support@aldryn.com>`_ for better wording or ways of
  explaining something
* sending us a pull request via `GitHub <https://github.com/aldryn/aldryn-docs>`_

Remember that you don't need any technical expertise to be able to make useful comments about
documentation. In fact if you're not an expert, your opinion is especially important.


***************************************
Submitting a documentation pull request
***************************************

Our documentation is created with `Sphinx`_ and `restructuredText`_.

All documentation should be written in English (for now, anyway). Please don't feel that your
English isn't good enough; as long as it is understandable, we'll edit your text if that's required.

Feel free to submit work-in-progress pull requests, but mark them as such in the pull request title
if you do.


Documentation markup
====================

Sections
--------

We mostly follow the Python documentation conventions for section marking::

    ##########
    Page title
    ##########

    *******
    heading
    *******

    sub-heading
    ===========

    sub-sub-heading
    ---------------

    sub-sub-sub-heading
    ^^^^^^^^^^^^^^^^^^^

    sub-sub-sub-sub-heading
    """""""""""""""""""""""

Inline markup
-------------

* use double backticks - ````settings.py```` - for:
    * literals
    * file names
    * names of fields and other items in the Admin interface:
* use emphasis - ``*Home*`` for:
    * the names of available options in the Admin
    * values in or of fields
* use strong emphasis - ``**Control Panel**`` for:
    * buttons that perform an action
    * the names of key Aldryn components when they are first used in a page or section

.. _Sphinx: http://sphinx.pocoo.org/
.. _restructuredText: http://docutils.sourceforge.net/docs/ref/rst/introduction.html

Internal links
--------------

Please use absolute link paths - `/packaging` - rather than relative paths - `packaging`. It makes
it much easier to update them with a search & replace when files are moved.
