OCP Autoscaling of Nodes on IPI (Installer Provision Infrastructure) cluster
=========
This ansible playbook can be used for Validating the autoscaling of nodes, by scaling up and down the machines using machineAutoscaler and clusterAutoscaler functions.

This playbook verifies two Autoscaling functions:
1. Scale Up
2. Scale Down


Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.


Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| autoscaling_enabled| no | false  | Flag to be set to true to run this playbook  |

Dependencies
------------

 - None

Example Playbook
----------------
```
---
- name: Validate autoscaling of nodes on PowerVS IPI
  hosts: localhost
  roles:
    - ocp-node-autoscaling
```

License
-------

See LICENCE.txt

Author Information
------------------

Prajwal.Gawande@ibm.com


