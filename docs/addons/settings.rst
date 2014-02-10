========
Settings
========

if you want to provide settings (and a nice form) for your app, you may add a file ``aldryn_config.py``
to the root of your app (next to setup.py).

This file **must** contain a class named ``Form`` which **must** subclass ``aldryn_client.forms.BaseForm``.

The ``Form`` class may contain any number of form fields.

Available fields are:

* ``aldryn_client.forms.CharField``
* ``aldryn_client.forms.CheckboxField``
* ``aldryn_client.forms.SelectField``
* ``aldryn_client.forms.NumberField``
* ``aldryn_client.forms.StaticFileField``

All fields must provide a label as first argument and take a keyword argument named ``required`` to indicate
whether this field is required or not.

``CharFields`` take optional ``max_length`` and ``min_length`` arguments.

``SelectField`` takes a list of tuples (Django style) as required second argument).

``NumberField`` has optional ``min_value`` and ``max_value`` arguments.

``StaticFileField`` takes an optional ``extensions`` argument which is a list of valid file extensions.


Generating settings
-------------------

To generate settings, define a ``to_settings`` method which takes two arguments:

* A cleaned data of your form
* A dictionary of existing settings (which contains ``MIDDLEWARE_CLASSES``).

Add the settings you want on to the settings dictionary and return it.


Custom field validation
-----------------------

If you want to have custom field validation, subclass a field and overwrite it's ``clean`` method,
which takes a single argument (the value to clean) and should return a cleaned value or raise
``aldryn_client.forms.ValidationError`` with a nice message as to why the validation failed.


Custom Runtime APIs
-------------------

Add-ons can use special APIs to inject content into templates (either in the head or at the end of the body) from Python.

Those APIs are:

* ``aldryn.template_api.registry.add_to_head`` to add content to the head.
* ``aldryn.template_api.registry.add_to_tail`` to add content to the end of the body.

If you're using those APIs, you probably want to do so from a models.py file.
