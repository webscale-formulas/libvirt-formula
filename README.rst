===============
libvirt-formula
===============

A saltstack formula to manage libvirt and start the service.

More information `SALT AS A CLOUD CONTROLLER
<https://docs.saltstack.com/en/latest/topics/tutorials/cloud_controller.html>`_.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``libvirt``
-------------

Install libvirt; start the libvirtd service, and creates the certificates
for migration.

``libvirt.keys``
----------------

Installs the libvirt certificates to allow virtual machine migration.

``libvirt.python``
------------------

Installs the python bindings for libvirt

