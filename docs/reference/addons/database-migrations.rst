Database Migrations
===================

TODO:

when creating migrations for re-usable apps, please make sure you set dependencies to models in other apps correctly. e.g like this: https://github.com/aldryn/aldryn-people/commit/0ab4b8df3cdb99bff01ab5824743c720782ac30a otherwise this can cause migration errors when installing the app to an existing project or starting with an empty database.
The first migration that requires a model from a other app should have this. preferrably to the first migration in the other app that ensures that that other model is available.
