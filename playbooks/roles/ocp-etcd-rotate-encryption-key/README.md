Rotate OCP ETCD encryption key
=========
This ansible playbook can be used to validate encryption key rotation for OpenShift API server and Kubernetes API server resources.  

Before rotating keys, encryption status for the OpenShift API server, Kubernetes API server and OpenShift OAuth API server will be verified and encrypted if not encrypted.


Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.


Role Variables
--------------
| Variable                                   | Required | Default                                                                              | Comments                                                                                                                       |
|--------------------------------------------|----------|--------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| ocp_etcd_key_rotation_enable           | no       | false                                                                                | Set the flag `true` to run this playbook.                                                                                     |
| encryption_type                            | no       | aescbc                                                                                | Type of encryption used to encrypt the etcd. Set to aesgcm for AES-GCM encryption type and aescbc for AES-CBC encryption type.datastore                                                                                            |
| NUMBER                   | no       | 1                                                                                 | Serial number of the new secrets to be created after encryption patch is applied                                                                       |

Dependencies
------------

 - None
 
Example Playbook
----------------
```
-
  name: OCP etcd rotate encryption key
  hosts: bastion
  roles:
    - role: ocp-etcd-rotate-encryption-key
```

Steps to run playbook
----------------------

 - Copy `ocp4-playbooks-extras/examples/inventory` file to the home or working directory and modify it to add a remote host
 - To execute the playbook run the below sample command

Sample Command
---------------

ansible-playbook -i inventory ~/ocp4-playbooks-extras/playbooks/ocp-etcd-rotate-encryption-key.yml

License
-------

See LICENCE.txt

Author Information
------------------

sajauddin.mohammad@ibm.com Suraj.Gudaji1@ibm.com
