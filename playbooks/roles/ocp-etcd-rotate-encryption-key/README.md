Rotate OCP ETCD encryption key
=========
This ansible playbook can be used to rotate encryption key for OpenShift API server and Kubernetes API server resources.  

Before rotating keys, encryption status for the OpenShift API server, Kubernetes API server and OpenShift OAuth API server will be verified.


Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.


Role Variables
--------------

 - None

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

License
-------

See LICENCE.txt

Author Information
------------------

sajauddin.mohammad@ibm.com
