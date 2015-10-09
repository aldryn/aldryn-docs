.. _setting_up_ssh_keys:

#######################################
Setting up SSH Keys for use with Aldryn
#######################################

In order to set up secure communication between your local machine and Aldryn, you need to use
**SSH keys**. SSH ("Secure Shell") is a cryptographic (encrypted) network protocol that allows
remote login and other network services to operate securely over an insecure network.

.. note:: **If you already know how to manage keys**

    If you already know how to use and share keys, you can skip this document, and go straight to
    :ref:`upload_key`.


***********************
Check for existing keys
***********************

.. important:: **For Microsoft Windows users**

    In the operations below, Windows users should use the *Git Bash* terminal installed by Git.

In your terminal, list any existing keys::

    ls -al ~/.ssh

Any *public keys* will have a name ending in ``.pub``. Default examples include::

    id_rsa.pub
    id_dsa.pub
    id_ecdsa.pub
    id_ed25519.pub

Each should also be accompanied by a *private key* with a similar name, for example ``id_rsa``.

If you have keys already, you can choose a private-public key pair to use with Aldryn and move on
to :ref:`activate_your_key`. Otherwise continue to create a new pair.


***************************
Generate a new SSH key pair
***************************

Use the ``ssh-keygen`` command to generate a new key. Your session will go like this::

    % ssh-keygen -t rsa -b 4096 -C "your_email@example.com"  # substitute your actual email address
    Generating public/private rsa key pair.

Now you'll be asked where to save the key. It has to be in the ``.ssh`` directory, but you can give
it a different name from the suggested default (do this if you already have an ``id_rsa`` and don't
want to overwrite it)::

    Enter file in which to save the key (/Users/username/.ssh/id_rsa):  # hit return to accept the default

Provide a passphrase when promoted::

    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /Users/username/.ssh/id_rsa.
    Your public key has been saved in /Users/username/.ssh/id_rsa.pub.
    The key fingerprint is:
    SHA256:Jhk9dJBiVxronWssa7jKYIxEQPnGEHpopGfnUDwDylqY your_email@example.com

If you run ``ls -al ~/.ssh`` once more, you'll see your new private-public key pair listed.


.. _activate_your_key:

****************
Activate the key
****************

If this is a brand new key, you need to activate it. If it's an existing key, the chances are that
your key is already active, but there is no harm in ensuring this.

Check that the ``ssh-agent`` is running::

    % eval "$(ssh-agent -s)"
    # Agent pid 59566

and add your key to the agent activate it::

    ssh-add ~/.ssh/id_rsa  # don't forget to use the actual name of the chosen key


************************
Copy your SSH public key
************************

Copy your key. Open the **public** key file (the one ending with ``.pub``, **not** its counterpart,
which must remain private) in your text editor, and copy the entire contents of the file, without
modification, to your clipboard.

.. note::

    Windows users can use the ``clip`` command to do this::

        clip < ~/.ssh/id_rsa.pub

Now you can go on to :ref:`upload_key`. Microsoft Windows users should proceed to the
:ref:`upload instructions for Windows <upload_key_windows>`.
