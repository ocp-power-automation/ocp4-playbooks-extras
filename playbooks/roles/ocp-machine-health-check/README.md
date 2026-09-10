OCP Autoscaling of Nodes on IPI (Installer Provision Infrastructure) cluster
=========
This ansible playbook can be used for Validating the machineHealthCheck on IPI cluster, by monitoring and recovering Unhealthy machines and nodes on the cluster using machineHealthCheck functions.

This playbook verifies four different scenarios for machineHealthCheck:
1. Case-1: Delete 1 node If the node for a machine is removed from the cluster, a machine health check considers the machine to be unhealthy and remediates it immediately.
2. Case-2: Make a node in 'NotReady' state. If a machine fails the health check, the machine is automatically deleted and one is created to take its place. SSH to one of the worker nodes and stop the kubelet service so that it goes to 'NotReady' state.
3. Case-3: Validate the setting for "maxUnhealthy". For example, If maxUnhealthy is set to 2, remediation will not be performed if 3 or more nodes are unhealthy.

Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.


Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| machine_health_check_enable| no | false  | Flag to be set to true to run this playbook  |

Dependencies
------------

 - None

Example Playbook
----------------
```
---
- name: Validate machine health check on PowerVS IPI
  hosts: localhost
  roles:
    - ocp-machine-health-check
```

License
-------

See LICENCE.txt

Author Information
------------------

Prajwal.Gawande@ibm.com


