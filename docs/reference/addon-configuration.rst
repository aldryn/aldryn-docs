.. _addon-configuration:

###################
Addon configuration
###################

Your application may have configuration options. Typically for a Django application these will be set in ``settings.py``, but this is not available to Aldryn users.

Aldryn provides an alternative mechanism for configuration, that allows users to change such
settings through a web form. To provide this form for an Addon, Aldryn requires an
``aldryn_config.py`` in the root directory of the Addon.


*****************************
The ``aldryn_config.py`` file
*****************************

This file contain a class named ``Form`` that sub-classes ``aldryn_client.forms.BaseForm``::

    from aldryn_client import forms


    class Form(forms.BaseForm):
        ...

The ``Form`` class may contain any number of form fields.

Available fields are:

* ``aldryn_client.forms.CharField`` (optional arguments: ``min_length`` and ``max_length``)
* ``aldryn_client.forms.CheckboxField``
* ``aldryn_client.forms.SelectField`` (required second argument: a list of tuples)
* ``aldryn_client.forms.NumberField`` (optional arguments: ``min_value`` and ``max_value``)
* ``aldryn_client.forms.StaticFileField`` (optional argument: ``extensions``, a list of valid file
  extensions.)

All fields must provide a label as first argument and take a keyword argument named ``required`` to
indicate whether this field is required or not.


*******************
Generating settings
*******************

To generate settings from these fields, define a ``to_settings`` method on the class that takes two
arguments:

* the ``cleaned_data`` from the form
* a dictionary containing the existing settings

Add or manipulate the settings in dictionary as required, and return it.

For example::

    class Form(forms.BaseForm):
        # get the company name
        company_name = aldryn_client.forms.CharField("Company name", required=True)

        def to_settings(self, cleaned_data, settings_dict):
            # set the COMPANY_NAME based on company_name
            settings_dict['COMPANY_NAME'] = cleaned_data["company_name"]

            # if we are in DEBUG mode, as on the Test server, use the Django console backend
            # rather than really sending out messages (see
            # https://docs.djangoproject.com/en/1.8/topics/email/#console-backend)
            if settings_dict.get('DEBUG'):
                settings_dict['EMAIL_BACKEND'] = 'django.core.mail.backends.console.EmailBackend'

            return settings_dict


***********************
Custom field validation
***********************

For custom field validation, sub-class a field and overwrite its ``clean`` method. The ``clean``
method takes a single argument (the value to be cleaned) and should either return a cleaned value
or raise ``aldryn_client.forms.ValidationError`` with a useful message about why the validation
failed.

Example::

    from aldryn_client import forms


    class FavouriteColourField(CharField):
        def clean(self, colour):
            colour = super(FavouriteColourField, self).clean(colour)
            if colour == "black":
                raise forms.ValidationError("You can have any colour you like except black")
            else:
                return colour
