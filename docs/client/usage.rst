Using the client
================

After installing, you'll have a command line tool called ``aldryn`` at your disposal.
Running it with no arguments will give you all possible commands.


Logging in
----------

Before using the client, you need to log in, call ``aldryn login`` and provide your `username` and `password`. This will
store a token in your local ``.netrc`` file that will be used for subsequent requests.


Local File Sync
---------------

You can sync your files locally calling ``aldryn sync [--sitename=<sitename>]``.
The optional argument ``--sitename=<sitename>`` specifies which site to sync with.
It must be set the first time you run the command in the selected directory.
On the subsequent calls from that directory the cached `sitename` will be used.
To be sure you are syncing the right site you can provide the ``--sitename`` argument
which then must match the cached one.

.. attention::
    To perform the initial sync you must select an **empty** or **new** directory!
