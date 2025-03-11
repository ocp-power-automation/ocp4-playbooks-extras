Validate CPU Manager
=========
This ansible playbook can be used to validate cpu manager feature in openshift cluster.  


 
Requirements
------------

- OCP 4.x healthy cluster on Power with 3 master and 3 worker nodes, without any errors.
- Access to the cluster as a user with the cluster-admin role.


Role Variables
--------------

| Variable                                   | Required | Default                                                                              | Comments                                                                                                                       |
|--------------------------------------------|----------|--------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| validate_cpum                            | no       | false                                                                                | Set it to true to run this playbook                                                                                            |
| pod_namespace                    | no       | "cpumanager-test"                                                                               | Namespace where  cpu manager test pods are created                                                                                                      |
| cpu_manager_directory                          | no       | `/tmp/cpu-manager-test-logs`                                                                       | Working directory for cpu manager tests                                                                                         |
| cpu_golang_tarball                     | no       | https://go.dev/dl/go1.24.1.linux-ppc64le.tar.gz                                      | HTTPS URL for golang tarball                                                                                                   |
| openshift_tests_private_repository | no       | https://github.com/openshift/openshift-tests-private.git                             | Github repository for openshift tests private                                                                                  |
| openshift_tests_private_git_branch | no       | master                                                                               | Git branch for the openshift repo                                                                                              |
| cpum_test_image                         | no       | gcr.io/google_containers/pause:3.2                                          | Test image to deploy test pod                                                                                                |
| node_name                         | no       | worker-0                                          | Node where the cpu manager test pods will be created pod                                                                                                |
| pod_cpu                         | no       | 4                                          | CPU allocated to the test pods                                                                                                |

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
-
  name: OCP etcd rotate encryption key
  hosts: bastion
  roles:
    - role: ocp-cpu-manager
```

Steps to run playbook
----------------------

 - Copy `ocp4-playbooks-extras/examples/inventory` file to the home or working directory and modify it to add a remote host
 - To execute the playbook run the below sample command

Sample Command
---------------

ansible-playbook -i inventory ~/ocp4-playbooks-extras/playbooks/ocp-cpu-manager.yml

License
-------

See LICENCE.txt

Author Information
------------------

Suraj.Gudaji1@ibm.com
