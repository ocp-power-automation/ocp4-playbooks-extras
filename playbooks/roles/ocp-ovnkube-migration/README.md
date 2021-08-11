ocp_ovnkube_migration: OCP ovnkube-migration configuration
=========

This module will migrate default CNI plugin for kubernetes from openshift-sdn to ovnkube

Requirements
------------

 - Running OCP 4.x cluster is needed.
 - User can provide custom pods and ensure it works fine(Deploy Nginx)

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| file_src  | yes | ../files/nginx.yaml  | Path of nginx deployment file  |
| file_dest  | yes  | /tmp/nginx.yaml  | Destination path   |

Dependencies
------------

 - None

Example Playbook
----------------

    - name: Run ocp ovnkube migration
      hosts: bastion
      roles:
      - ocp-ovnkube-migration

License
-------

See LICENCE.txt

Author Information
------------------

amey.shikerkar@ibm.com

