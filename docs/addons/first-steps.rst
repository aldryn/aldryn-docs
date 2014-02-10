===========
First steps
===========

Before using the client, you need to log in, call ``aldryn login`` and provide your username and password.
This will store a token in your local **.netrc** file that will be used for subsequent requests.


Local Setup
-----------

You can override the host it's talking to by setting the environment variable ``ALDRYN_HOST`` to something
(for example: http://localhost:8000). If you want to use the client locally, just invoke it like this:

``ALDRYN_HOST=http://localhost:8000 aldryn <command>``