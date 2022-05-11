ocp-iSCSI: Setup persistent storage using iSCSI on the cluster
=========
This module will mount a directory from the host node's filesystem into a pod. 

Requirements
------------
 - Running OCP 4.x cluster is needed
 - Running iscsi-target is required
 
Role Variables
--------------
| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| iSCSI_setup_directory | no | ~/setup-files/iSCSI-setup | Test directory |
| iSCSI_node | no | worker-0 | Node to be used for the iSCSI storage |
| iSCSI_pod_name | no | iscsipd | Name of the pod to be created |
| iSCSI_pod_mountpath | no | /mnt/iscsipd | The path to mount the hostPath share inside the pod |
| iSCSI_pod_image | no | quay.io/satwsing/centos | Name of the image |
| initiator_name | yes |  | Name of the Initiator |
| iqn | yes |  | Name of iqn |
| target_IP | yes |  | Target IP address |

Ensure the iSCSI_node value is same as the one provided in the inventory file under the worker group.

Dependencies
------------
 - Initiator is needed

Example Playbook
----------------
```
- name: Setup the config changes for iSCSI on the node
  hosts: "{{ iSCSI_node }}"
  tasks:
  - name: Setup the config changes for iSCSI on the node
    include_tasks: "{{ playbook_dir }}/roles/ocp-iscsi-deploy/tasks/config.yaml"

- name: Configure the changes for iSCSI on the node and  provision iSCSI volume on the cluster
  hosts: bastion
  roles:
  - ocp-iscsi-deploy
```

License
-------
See LICENCE.txt

Author Information
------------------
satwsin1@inibm.com
