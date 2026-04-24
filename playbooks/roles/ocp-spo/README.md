ocp-spo
===================

This role is used to deploy and validate Security Profiles Operator on OCP cluster.

Requirements
--------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys: ***username***, ***password*** and ***registry***


Role Variables
--------------
| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| spo_enabled  | no | false | Enable it to run this playbook |
| spo_catalogsource_image | no | | Catalog source index image |
| spo_upgrade_channel | no | release-alpha-rhel-8 | Upgrade channel for SPO |
| quay_username | yes | | quay account username where the operator images will be pushed |
| quay_token | yes | | quay account token |
| login_ocp_token | yes | | Openshift login token similar to "--token=sha256~C0VXA0zxpgCg4Z4yDDsIe3oC9kmwnX4aciJ69k8h7kM --server=https://api.rdr-*.ibm.com:6443" |
| openshift_test_private_validation | no | false | Set it to true to run the openshift-tests-private tests |
| openshift_test_private_golang_tarball | no | https://go.dev/dl/go1.24.1.linux-ppc64le.tar.gz | HTTPS URL for golang tarball |
| openshift_test_private_git_branch | no | | Git branch for the openshift repo |
| spo_testcase_filters | no | Security_Profiles_Operator | Filters out SPO related test cases |


Environment Variables
---------------------

| Variable             | Required       | Comments                                                                |
|----------------------|----------------|--------------------------------------------                             |
| GITHUB_USERNAME      | yes            | Public GitHub account username to which the repository access granted.  |
| GITHUB_ACCESS_TOKEN  | yes            | GitHub personal access token to clone the repository.                   |

Dependencies
------------

- To run e2e test cases, it requires access to the openshift-test-private repository.

Example Playbook
----------------
```
- name: SPO installation and validation
  hosts: bastion
  roles:
  - ocp-spo

```

License
-------

See LICENCE.txt

Author Information
------------------

Aishwarya.Kamat@ibm.com
