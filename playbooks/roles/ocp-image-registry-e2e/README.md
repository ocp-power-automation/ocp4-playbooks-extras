Validate Image registry e2e
=========
This ansible playbook can be used to validate image registry feature in openshift cluster.  


Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys: ***username***, ***password*** and ***registry***


Role Variables
--------------

| Variable                                   | Required | Default                                                                              | Comments                                                                                                                       |
|--------------------------------------------|----------|--------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| validate_image_registry                            | no       | false                                                                                | Set it to true to run this playbook                                                                                            |
| image_registry_directory                          | no       | `/tmp/image-registry-test`                                                                       | Working directory for image registry tests                                                                                         |
| image_registry_golang_tarball                     | no       | https://go.dev/dl/go1.24.1.linux-ppc64le.tar.gz                                      | HTTPS URL for golang tarball                                                                                                   |
| image_registry_e2e_repo | no       | https://github.com/openshift/openshift-tests-private.git                             | Github repository for openshift tests private                                                                                  |
| image_registry_e2e_git_branch | no       | master                                                                               | Git branch for the openshift repo                                                                                              |


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
- name: Validate image registry and run e2e
  hosts: bastion
  roles:
  - ocp-image-registry-e2e
```

Steps to run playbook
----------------------

 - Copy `ocp4-playbooks-extras/examples/inventory` file to the home or working directory and modify it to add a remote host
 - To execute the playbook run the below sample command

Sample Command
---------------

ansible-playbook -i inventory -e examples/image-registry-e2e-vars.yaml ~/ocp4-playbooks-extras/playbooks/image-registry-e2e-vars.yaml

License
-------

See LICENCE.txt

Author Information
------------------

Hemali.Gujarathi4@ibm.com
