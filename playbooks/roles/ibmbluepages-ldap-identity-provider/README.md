LDAP identity provider test 
============================

This ansible role will configure LDAP as an identity provider for user authentication with **IBM Blue Pages LDAP** server and grants *"cluster-reader"* as a default user role permission.


**Note: Please set the below mentioned environment variables for the IBM login credentials.**


Requirements
------------
 - Running OCP 4.x cluster is needed.
 - Access to the cluster with the cluster-admin role.

Dependencies
------------
 - None


Role Variables
--------------

| Variable                     | Required | Default     | Comments                                                                                                                                                                                                                                                                    |
|------------------------------|----------|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ldap_identity_provider       | yes      | false       | Set to true to enable LDAP test execution                                                                                                                                                                                                                                   |
| ldap_cr_name                 | no       | empty       | User defined name to the LDAP CR object, if undefined *"ldapidp"* will be set by default                                                                                                                                                                                    |
| ldap_user_role               | no       | empty       | User role permission to be granted to the newly created user. the possible role permission can be `"admin", "basic-user", "cluster-admin", "cluster-status", "cluster-reader", "edit", "self-provisioner", "view"`, if empty *cluster-reader* will be assigned by default   |
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Environment Variables
---------------------

| Variables                   | Required     | Comment                                                                                                                                   |
|-----------------------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| IBM_EMAIL_ID                | yes          | IBM email-id to be used for loging in to the cluster.                                                                                     |
| IBM_PASSWORD                | yes          | Associated password with the IBM email-id.                                                                                                |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------                                                   

Example Playbook
----------------
```
---
- name: Configuring LDAP identity provider with IBM Blue Pages
  hosts: bastion
  roles:
  - ibmbluepages-ldap-identity-provider
```


License
-------
See LICENCE.txt

Author Information
------------------
Aditya.Honkalas@ibm.com
