Injecting HTML
==============

Add-ons can use special APIs to inject content into templates
(either in the head or at the end of the body) from Python.
This is done by by the aldryn-snake app. It is pre-installed in all aldryn sites and all
templates render these sections by convention.

Those APIs are:

* ``aldryn_snake.template_api.registry.add_to_head`` to add content to the head.
* ``aldryn_snake.template_api.registry.add_to_tail`` to add content to the end of the body.

If you're using those APIs, you probably want to do so from a models.py file (so they are
registered at import time).