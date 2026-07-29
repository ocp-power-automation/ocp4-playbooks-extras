Validate eco-gotests
=========
This ansible playbook can be used to validate eco-gotests for filter testcases in openshift cluster.  


Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys: ***username***, ***password*** and ***registry***


Role Variables
--------------

| Variable                                   | Required | Default                                                                              | Comments                                                                                                                       |
|--------------------------------------------|----------|--------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| openshift_test_private_validation                            | yes     | false                                                                                | Set it to true to run this playbook                                                                                            |
| openshift_test_private_directory                          | yes       | `/tmp/openshift_test_private_e2e`                                                                       | Working directory for openshift_test_private e2e  tests                                                                                         |
| openshift_test_private_golang_tarball                     | yes       | https://go.dev/dl/go1.24.1.linux-ppc64le.tar.gz                                      | HTTPS URL for golang tarball                                                                                                   |
| openshift_test_private_e2e_repo | yes      | https://github.com/openshift/openshift-tests-private.git                             | Github repository for openshift tests private                                                                                  |
| openshift_test_private_git_branch | yes      | master                                                                               | Git branch for the openshift repo                                                                                              |
| testcase_filters | yes      | ''            | By default, it will run all the e2e testcase, Set this value to run  multiple/single testcase.  For example: 'Image_Registry\\|API_Server' OR '56072'   |
 

Environment Variables
---------------------

| Variable             | Required       | Comments                                                                |
|----------------------|----------------|--------------------------------------------                             |
| GITHUB_USERNAME      | yes            | Public GitHub account username to which the repository access granted.  |
| GITHUB_ACCESS_TOKEN  | yes            | GitHub personal access token to clone the repository.                   |

Dependencies
------------

 - None
 
Example Playbook
----------------
```
- name: Validate eco-gotests
  hosts: bastion
  roles:
  - eco-gotests

```

Steps to run playbook
----------------------

 - Copy `ocp4-playbooks-extras/examples/inventory` file to the home or working directory and modify it to add a remote host
 - To execute the playbook run the below sample command

Sample Command
---------------

ansible-playbook -i inventory -e examples/eco-gotests-vars.yaml ~/ocp4-playbooks-extras/playbooks/eco-gotests.yml

License
-------

See LICENCE.txt

Author Information
------------------

rajakumar.batulla@ibm.com
