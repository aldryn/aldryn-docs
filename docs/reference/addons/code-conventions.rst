Code Conventions
================


The Aldryn certified Addons all follow a distinct coding style. Some rules are of a more cosmetic
nature, others exist to easy interoperability between Addons.

.. IMPORTANT::
   PEP8, PEP8, PEP8! But with a max line length of 100 instead of 80.

On Aldryn we strive to have a system that is as automated as possible. Whenever possible something
should work automatically. If it can't be done automatically we want to assist in the manual
process as much as possible.

Addon updates should be as automated as possible. Make sure you stay backwards compatible or
supply clean upgrade paths. A ``CHANGELOG.rst`` is a must. Every release should be listed,
the newest being at the top. Backwards incompatible changes must be clearly listed. Preferably
with a link to further documentation with help to migrate in such cases.
More about :ref:`packaging <addon-packaging>`



Model Field Naming
------------------

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
---------------

* ForeignKeys that can be blank, should also have ``on_delete=models.SET_NULL``. This prevents cascade deletes of a lot of attached content that is usually not what you want.
* Filer fields are also ForeignKeys, so the rule above applies!
* Tables and fields should never be different based on settings. (causes troubles with migrations)


Avoid Sessions for Anonymous Users whenever possible
----------------------------------------------------

For full-page caching.

.. TODO:: figure out some good rules for avoiding anonymous sessions.
          Should Apps be "certified" that they don't require anonymous sessions?
          Configurable with setting? csrf_cookie? current language cookie?

Frontend
--------

There are many Boilerplates and equally as many code conventions and
styleguides. We will not go as far as to command you to use tabs over spaces,
camelCase over under_score, but we might want you to redirect to our
`aldryn-boilerplate-bootstrap3 <https://aldryn-boilerplate-bootstrap3.readthedocs.org/en/latest/>`_'s
documentation which offers some advice.
