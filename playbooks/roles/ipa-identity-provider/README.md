IPA identity provider configuration and test
============================================

The IPA (Identity Policy Audit) server allows you to manage your kerberos, DNS, hosts, users, sudo rules, password policies, and automounts in a central location. IPA is a combination of packages, including—but not limited to—bind, ldap, pam, and so on. It combines all of these to provide identity management for your environment. 

This ansible role will install, configure and test IPA identity provider with an open source identity management system FreeIPA on OCP 4.x cluster. To use this role it is required to set the environment variables viz. IPA_ADMIN_PASSWORD, IPA_DM_PASSWORD and IPA_USER_PASSWORD as mentioned below on a control host(on a host where you are running this playbook). you can set the role variables with inputs instead of defaults.


Requirements
------------

 - Running OCP 4.x cluster.


Role Variables
--------------

| Variable                          | Required | Default                                                |Comments                                                                                                                                                                                                                                                                          |
|-----------------------------------|----------|--------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ipa_identity_provider             | no       | false                                                  | Flag to enable the execution for ipa-identity-provider playbook                                                                                                                                                                                                                  |
| ipa_project_name                  | no       | freeipa-test                                           | User defined name for creating a new namespace, if not defined default name will be assigned as a name                                                                                                                                                                           |
| ipa_user_uid                      | no       | user01                                                 | User-ID for a new user to be added on IPA server, if not defined the default name will be used                                                                                                                                                                                   |
| freeipa_openshift_container_image | no       | quay.io/powercloud/freeipa-openshift-container:latest  | Container build image of FreeIPA for Openshift platform and ppc64le supported architecture, it can be replaced with your custom build image by building new image using `github.com/freeipa/freeipa-container` and `github.com/freeipa/freeipa-openshift-container` repositories |
| ipa_provider_cr_name              | no       | IPA                                                    | Name for a identity provider custom-resource object, if undefined the default will be assigned                                                                                                                                                                                   |
| ipa_user_first_name               | no       | Summer                                                 | User display name for a new IPA user, if not defined default will be used                                                                                                                                                                                                        |
| ipa_user_last_name                | no       | Star                                                   | User display name for a new IPA user, if not dfined default will be used                                                                                                                                                                                                         |  
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Environment Variable
--------------------

| Variable            | Required  | Comments                                            |
|---------------------|-----------|-----------------------------------------------------|
| IPA_ADMIN_PASSWORD  | yes       | It is a Kerberos password for an IPA administrator  |
| IPA_DM_PASSWORD     | yes       | It is a password for a directory manager user       |
| IPA_USER_PASSWORD   | yes       | It is a password for an IPA user to be added        |
-------------------------------------------------------------------------------------------

**Note: The above environment varibles must be set before running this playbook, if not set the plabook will be failed to execute.**


Dependencies
------------

 - None


Example Playbook
----------------
```
    - name: IPA identity provider test with FreeIPA
      hosts: bastion
      roles:
      - ocp-cli-plugins
```

Steps to run playbook
----------------------

 - Copy `ocp4-playbooks-extras/examples/inventory` file to the home or working directory and modify it to add a remote host
 - Copy the `ocp4-playbooks-extras/examples/all.yaml` to the home or working directory and set the role variables for `roles/ipa-identity-provider` with the custom inputs. Enable the role by setting the variable `ipa-identity-provider` to `true`.
 - To execute the playbook run the below sample command


Sample Command
---------------

ansible-playbook -i inventory -e @all.yaml ~/ocp4-playbooks-extras/playbooks/main.yml


License
-------

See LICENCE.txt


Author Information
------------------

Aditya Honkalas (Aditya.Honkalas@ibm.com)
