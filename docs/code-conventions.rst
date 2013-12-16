################
Code Conventions
################


The Aldryn certified Addons all follow a distinct coding style. Some rules are of a more cosmetic
nature, others exist to easy interoperability between Addons.

.. IMPORTANT::
   PEP8, PEP8, PEP8! But with a max line length of 100 instead of 80.


Model Field Naming
==================

Date and time:

Use the ``_at`` suffix for ``datetime`` and the ``_on`` suffix for ``dates``.

* timestamps (usually automatically created): ``created_at``, ``created_on``, ``modified_at``, ``modified_on`` (past time form!)
* date/datetime that control something: ``publish_at``, ``start_at``, ``end_at`` (use imperative form)
* item_count (for amounts)

Reverse relations:

* use the default ``<modelname>_set`` for ``ForeignKeys``. This avoids a lot of ambiguity and
  complexity with irregular plural forms.

python: use single quotes everywhere.

templates:

* see https://github.com/divio/divio-boilerplate/blob/master/README.rst

* template readability counts: it does not matter if the resulting html has excess whitespace after indenting loops and ifs


Database Fields
===============

* ForeignKeys that can be blank, should also have ``on_delete=models.SET_NULL``. This prevents cascade deletes of a lot of attached content that is usually not what you want.
* Filer fields are also ForeignKeys, so the rule above applies!