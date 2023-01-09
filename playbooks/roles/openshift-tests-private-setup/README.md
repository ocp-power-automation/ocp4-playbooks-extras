openshift-tests-private-setup
==========

This role initializes the following steps to setup `openshift-tests-private` test repository. 
- Installing development tools
- Creating sub-directory
- Clonning the git repository
- Installing golang
- Running make build in the target directory

This role can be included in the other roles for initializing the above pre-requisites.


Requirements
------------

- The cluster is in a known good state, without any errors.


Role Variables
--------------

| Variable                                  | Required | Default                                                      | Comments                                                                                                                 |
|-------------------------------------------|----------|--------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| openshift_tests_private_setup_enable      | no       | false                                                        | Set the flag `true` to run this playbook.                                                                                |
| golang_install_tarball                    | no       | `https://go.dev/dl/go1.19.4.linux-ppc64le.tar.gz`            | Golang tarball for `ppc64le` arch with version `>= 1.18` as per the minimum requirement.                                 |
| openshift_tests_private_basedir           | no       | `~/ocp-validation`                                           | Base directory path to clone the `openshift-tests-private` repo. It will get created if path not exists or not provided. |
| openshift_tests_private_clone_url         | no       | `https://github.com/openshift/openshift-tests-private`       | Git clone URL of the tests private repo.                                                                                 |
| openshift_tests_private_branch            | no       | master                                                       | Branch to be used for specified test repo.                                                                               |
| openshift_tests_private_make_build_target | no       | `~/ocp-validation/openshift-tests-private`                   | Target directory for make build command.                                                                                 |


Environment Variables
---------------------

| Variable             | Required       | Comments                                                               |
|----------------------|----------------|------------------------------------------------------------------------|
| GITHUB_USERNAME      | yes            | Public GitHub account username to which the repository access granted. |
| GITHUB_ACCESS_TOKEN  | yes            | GitHub personal access token to clone the repository.                  |


**Note- The above environment variables are required to be set to provide your GitHub credentials.**


Example Playbook
----------------

```
  - name: openshift-tests-private repository setup role
    hosts: bastion
    roles:
    - openshift-tests-private-setup
```


Steps to use this role
----------------------

To use this role in other roles to setup `openshift-tests-private` repo, use the `include_role` module and supply the role variables in the `vars` as below:

```
- name: Include the openshift-tests-private-setup role
  include_role:
    name: openshift-tests-private-setup
  vars:
    golang_install_tarball: "https://go.dev/dl/go1.19.4.linux-ppc64le.tar.gz"
    openshift_tests_private_basedir: "~/ocp-validation" 
    openshift_tests_private_clone_url: "https://github.com/openshift/openshift-tests-private" 
    openshift_tests_private_branch: "master"
    openshift_tests_private_make_build_target: "~/ocp-validation/openshift-tests-private"
```

To run this role indenpendently add host in the inventory file, set the role variables in the `ocp4-playbooks-extras/examples/openshift_tests_private_vars.yaml` and run the below sample command from `ocp4-playbooks-extras`.


Sample Command
---------------

ansible-playbook -i inventory -e @openshift_tests_private_setup_vars.yaml ~/ocp4-playbooks-extras/playbooks/openshift-tests-private-setup.yaml


License
-------

See LICENCE.txt


Author Information
------------------

Aditya.Honkalas@ibm.com

