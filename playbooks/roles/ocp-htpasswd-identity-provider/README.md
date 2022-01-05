
ocp-htpasswd-identity-provider: HTPasswd identity provider
=========
This module will Configure an HTPasswd identity provider and grant cluster-reader to new user.

Requirements
------------
 - Running OCP 4.x cluster is needed.
 - Access to the cluster with the cluster-admin role. 

Dependencies
------------
 - None

Role Variables
--------------
| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| htpasswd_identity_provider  | yes | | Set this variable to true to run this module|
| htp_username  | yes | | Set the username for cluster |
| htp_password  | yes | | Set the password for cluster |
                                                                                                      
Example Playbook
----------------
```
---
- name: Configuring an HTPasswd identity provider
  hosts: bastion
  roles:
  - ocp-htpasswd-identity-provider
```

License
-------
See LICENCE.txt

Author Information
------------------
varad.ahirwadkar@ibm.com
