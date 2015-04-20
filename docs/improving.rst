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

***********************
Documentation structure
***********************

The documentation's structure reflects its three chief functions:

* :doc:`introduction/index` to introduce concepts and explain basic aspects of the technology
* :doc:`how-to/index` to take the user step-by-step through some key processes
* :doc:`Reference <reference/index>` to provide in-depth technical reference material

As far as possible when writing documentation it should be aimed at a place in one of these
sections (which can always themselves be expanded or restructured to accommodate new material).

How-to guides
=============

As far as possible, each of these should be self-contained and describe an end-to-end workflow.
How-to guides should list pre-requisites - what the user needs to have done, and what the user
needs to know.

It's appropriate to give a little explanation in passing, but the emphasis should be on the
practical steps and what the user is doing. Any in-depth explanation should be reserved for the
reference documentation.

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

We use Python documentation conventions for section marking:

* ``#`` with overline, for parts
* ``*`` with overline, for chapters
* ``=`` for sections
* ``-`` for subsections
* ``^`` for subsubsections
* ``"`` for paragraphs

Inline markup
-------------

* use backticks - `````` - for:
    * literals - ````cms.models.pagemodel````
    * filenames - ``edit ``settings.py````
    * names of fields and other specific items in the Admin interface - ``edit ``Redirect````
* use emphasis - ``*Home*`` - around:
    * the names of available options in or parts of the Admin - ``the *Toolbar*``
    * the names of important modes or states - ``switch to *Edit mode*``
    * values in or of fields - ``enter *Home*``
* use strong emphasis - ``**`` - around:
    * buttons that perform an action - ``hit **Save and close**``

Rules for using technical words
-------------------------------

There should be one consistent way of rendering any technical word, depending on its context.
Please follow these rules:

* when introducing a key term for the the first time, or for the first time in a document,
  highlight it to draw attention to it: "**Placeholders** are special model fields"
* in general use, simply use the word as if it were any ordinary word, with no capitalisation or
  highlighting: "Your placeholder can now be used." However, use "the Marketplace", "the Network" etc
* at the start of sentences or titles, capitalise in the usual way: "Placeholder management guide"
* when the word refers specifically to an object in the code, highlight it as a literal:
  "``Placeholder`` methods can be overwritten as required" - when appropriate, link the term to
  further reference documentation as well as simply highlighting it

.. _Sphinx: http://sphinx.pocoo.org/
.. _restructuredText: http://docutils.sourceforge.net/docs/ref/rst/introduction.html

Internal links
--------------

Use absolute links to other documentation pages - ``:doc:`/how_to/toolbar``` -
rather than relative links - ``:doc:`/../toolbar```. This makes it easier to
run search-and-replaces when items are moved in the structure.
