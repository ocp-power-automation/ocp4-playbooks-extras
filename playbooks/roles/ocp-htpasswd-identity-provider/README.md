
ocp-htpasswd-identity-provider: HTPasswd identity provider
=========
This module will Configure an HTPasswd identity provider and grant cluster-reader to new user.

**Note:** Please make sure that, the working directory (`htpasswd_directory`) and assigned role (`htpasswd_user_role`) is same while creating and deleting the user.

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
| htpasswd_identity_provider  | yes | false | Set this variable to true to run this module|
| htpasswd_username  | yes | | Set the username for cluster |
| htpasswd_password  | yes | | Set the password for cluster |
| htpasswd_user_role  | no | cluster-reader | Set the role for user |
| htpasswd_directory  | yes | | Absoulte path for working directory |
| htpasswd_delete_user  | yes | false | Set to true to delete user |

htp_idp_username, htp_idp_password, htp_idp_user_role, htp_idp_directory, htp_idp_delete_user are the variables from the another roles.
                                                                                                      
Example Playbook
----------------
```
---
- name: Configuring an HTPasswd identity provider
  hosts: bastion
  roles:
  - ocp-htpasswd-identity-provider
```

Importing role from another playbook
```
- name: Include role for creating HTPasswd user
  include_role:
    name: ocp-htpasswd-identity-provider
  vars:
    htp_idp_username: "ldap_user1" 
    htp_idp_password: "ldap_user1"
    htp_idp_user_role: "cluster-admin"
    htp_idp_directory: "/tmp/htpasswd"
    htp_idp_delete_user: false
```

License
-------
See LICENCE.txt

Author Information
------------------
varad.ahirwadkar@ibm.com
