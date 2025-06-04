ocp-enabling-kdump
=========

This role is used for Enabling Kdump on worker node.

Requirements
------------

- OCP 4.x healthy cluster on PowerVS having 32gb reserve volume to worker node.

Role Variables
--------------
| Variable                       | Required | Default     | Comments                                       |
|--------------------------------|----------|-------------|------------------------------------------------|
| worker_node                  | yes       |     | Enter the name of the node in which kdump is to be done    |


Example Playbook
----------------

```
  ---
- name: Automate Enabling Kdump
  include_role:
  - ocp-kdump
```

License
------------------

See LICENCE.txt


Author Information
------------------

Yashansh.Sharma@ibm.com