OCP ETCD Encryption & ETCD Decryption
=========
This ansible playbook can be used for enabling the encryption of the OpenShift API server, Kubernetes API server resources and also Decryption of the same.  

It also verifies Encrypted/Decrypted status condition for the OpenShift API server, Kubernetes API server and OpenShift OAuth API server.  

This playbook has two modules:
1. Enabling etcd Encryption 
2. Disabling etcd Encrytpion


Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.


Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| ocp_etcd| no | false  | Flag to be set to true to run this playbook  |

Dependencies
------------

 - None
 
Example Playbook
----------------
```
-
  name: OCP etcd Encryption and Decryption 
  hosts: bastion
  roles:
    - role: ocp-etcd-encryption-decryption
```

License
-------

See LICENCE.txt

Author Information
------------------

varad.ahirwadkar@ibm.com
