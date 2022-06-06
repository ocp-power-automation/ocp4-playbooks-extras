ocp-hostpath: Configure the volume on the cluster's node and setup persistent storage using hostPath on the cluster
=========

This module will configure the volume on the cluster's node which can subsequently be used to configure hostpath persistent storage.

It will mount a directory from the host node's filesystem into a pod. 

Requirements
------------

 - Running OCP 4.x cluster is needed.

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| hostpath_setup_dir | no | ~/setup-files/hostpath-setup | Test directory |
| hostpath_node | no | worker-0 | Node to be used for the Hostpath storage |
| hostpath_storage_size | no | 10Gi | Size of the persistent volume |
| hostpath_pv_storage_path | no | /mnt/data | Path of the volume directory on the node |
| hostpath_pod_name | no | hostpath-storage | Name of the Pod to be created |
| hostpath_pod_mountpath | no | /usr/share/nginx/html | The path to mount the hostPath share inside the Pod |
| hostpath_pod_image | no | nginx | Name of the image |

Ensure the hostpath_node value is same as the one provided in the inventory file under the worker group.

Dependencies
------------

 - None

Example Playbook
----------------
- name: Setup the directory for hostpath on the node and provision hostPath volume on the cluster
  roles:
  - ocp-hostpath-deploy

License
-------

See LICENCE.txt

Author Information
------------------

pravin.dsilva@ibm.com
