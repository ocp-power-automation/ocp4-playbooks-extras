Request header identity provider test
=====================================

A request header is an identity provider method to identify users from request header values, such as `X-Remote-User`. It is typically used in combination with an authenticating proxy, which sets the request header value.

This ansible role will configure request header as an identity provider to authenticate users with cluster OAUTH server and grants *"cluster-reader"* as a default user role permission.



Requirements
------------
 - Running OCP 4.x cluster is needed.
 - Access to the cluster with the cluster-admin role. 

Dependencies
------------
 - None


Role Variables
--------------

| Variable                          | Required | Default                  | Comments                                                                                                                                                                                                                                                            |
|-----------------------------------|----------|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| request_header_provider           | no       | false                    | Set to true to enable request header test execution                                                                                                                                                                                                                 |
| request_header_user_display_name  | no       | Default User             | User's full name to be sent in a request header, if undefined default user display name will be set                                                                                                                                                                 |
| request_header_username           | no       | rh-user                  | Username to be sent in a request header, if undefined default username will be set                                                                                                                                                                                  |
| ca_configmap_name                 | no       | cert-auth-configmap      | User defined name for CA configmap object, if undefined default name will be set to the CA certificate configmap                                                                                                                                                    |
| request_header_cr_name            | no       | request-header-provider  | User defined name for identity provider CR object, if undefined default name will be set to the provider CR object                                                                                                                                                  |
| request_header_user_role          | no       | cluster-reader           | User role permission to be granted to the newly created user. the possible role permission can be `"admin", "basic-user", "cluster-admin", "cluster-status", "cluster-reader", "edit", "self-provisioner", "view"`, if empty default user role will be assigned     |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Example Playbook
----------------
```
---
- name: Configuring request header identity provider 
  hosts: bastion
  roles:
  - ocp-request-header-identity-provider
```

                                                                                         
Steps to run the playbook
-------------------------

 - Copy `ocp4-playbooks-extras/examples/inventory` file to the home or working directory and modify to add a remote host
 - Copy the `ocp4-playbooks-extras/examples/all.yaml` to the home or working directory and set the role variables for `roles/request-header-identity-provider` with the custom inputs. Enable the role execution by setting `request-header-provider` to `true`.
 - To execute the playbook run the below sample command


Sample Command
---------------

ansible-playbook -i inventory -e @all.yaml ~/ocp4-playbooks-extras/playbooks/main.yml


License
-------
See LICENCE.txt

Author Information
------------------
Aditya.Honkalas@ibm.com
