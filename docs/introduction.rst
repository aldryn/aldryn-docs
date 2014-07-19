#########################################
Introduction to key features & components
#########################################

Aldryn is a cloud-based platform for Django-based websites. There are a number of similar services
available, so it's worth taking a moment to describe some of the basics.

Aldryn is designed to meet the needs of three distinct groups:

* content creators
* agencies and designers
* web application developers

In order to meet the multifarious and sometimes competing needs of these three groups, Aldryn
provides a suite of integrated tools and workflows.

**Content creators** are served by django CMS and the Aldryn Addons that can be installed. A number
of Addons already exist in the Aldryn Marketplace, but developers can readily develop and deploy
their own, from new or existing Django packages.

**Web agencies and designers** typically need to provide their clients with a site that the client
can subsequently manage on their own, working with tools and developers they are experienced with,
and able to work with rapidly. Aldryn provides flexible and effective ways of setting up sites so
that an agency can then hand over to clients, while still being able to retain oversight if
necessary. Future - or indeed continuous - development is possible, because Aldryn has been
designed to be a platform as much for hosting and site management as for development.

For **web application developers**, Aldryn provides a fully-featured Django environment. At the
same time it is a strongly-opinionated environment, which is of course necessary to permit it to
function as a cloud-based offering, that can be managed without difficulty by a non-technical user
using the Control Panel. Aldryn solves the problem of meeting these competing needs by making
possible **Local Development** in an environment (supported by tools that build it automaticallu)
that replicates the cloud environment.

=============
Control Panel
=============

The `Aldryn Control Panel <https://control.aldryn.com/control/>`_ is a web-based tool, and is the
primary management resource for Aldryn sites.

Most key features of the Control Panel are explained by the built-in **Tour**, but more advanced
features will be explained in the documentation for processes that require their use.

=================
The Aldryn Client
=================

The **Aldryn Client** is a command-line application. Key functions:

* **login**: the client can log you in to the Aldryn platform, to establish a direct connection
  between your local and the cloud environments
* **workspace replication**: replicate the cloud environment locally for development
* **file synchronisation**: aimed at front-end developers; allows local work on static files and
  assets
* **development management**: commands to validate and upload Addons and Boilerplates

======================
The Aldryn Desktop App
======================

Like the file synchronisation functions of the Aldryn Client, this is aimed at front-end
developers, and provides a graphical user interface for those functions.
