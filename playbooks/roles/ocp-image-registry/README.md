
ocp-image-registry: Exposing OCP internal image registry
=========

This module will expose the OCP internal image registry.

Requirements
------------
 - Running OCP 4.x cluster is needed.
 - Identity provider (IDP) such as LDAP must be enabled and used to login to the image registry.

Dependencies
------------
 - None


Role Variables
--------------

| Variable           | Required | Default | Comments                                                  |
| ------------------ | -------- | ------- | --------------------------------------------------------- |
| registry\_container\_engine | No      | "podman"      |  Container enginer like Docker or Podman                          |
| registry\_username | Yes      | ""      | Username used for registry login                          |
| registry\_token | Yes      | ""      | Token used for authentication to login to the regsitry. For example, token can be retrieved by running: `oc whoami -t` |


Example Playbook
----------------

```
---
- name: Expose image registry
  hosts: bastion
  roles:
  - ocp-image-registry
```


License
-------

See LICENCE.txt

Author Information
------------------

Pravin D'Silva (pravind@us.ibm.com)
