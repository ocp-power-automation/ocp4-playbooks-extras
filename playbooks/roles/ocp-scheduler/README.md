ocp-scheduler
============

Scheduler profiles are an alternative to configuring a scheduler policy for scheduling pods on cluster nodes. It provides three types of scheduling profiles to configure such as `HighNodeUtilization`, `LowNodeUtilization` and `NoScoring` for efficient node resource usage. 
This role allows to configure the scheduling profile and running e2e test suite from `openshift-tests-private` repository.


Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.


Role Variables
--------------

| Variable                       | Required | Default                                                 | Comments                                                                           |
|--------------------------------|----------|---------------------------------------------------------|------------------------------------------------------------------------------------|
| scheduler_role_enable          | no       | false                                                   | Set the flag `true` to run this playbook.                                          |
| configure_scheduler_profile    | no       | false                                                   | Set the flag `true` to configure given scheduling profile.                         |
| scheduler_profile              | no       | `HighNodeUtilization`                                   | Scheduler profile to be configured, default will be configured if undefined.       |
| scheduler_e2e_test_run         | no       | false                                                   | Set the flag `true` to enable the e2e test run for scheduler.                      |
| scheduler_workdir              | no       | `~/ocp-scheduler`                                       | Base working directory for scheduler profile test.                                 |
| scheduler_subdir_list          | no       | `["script","e2e-test"]`                                 | List of sub-directories for saving shell script files and e2e test results.        |
| scheduler_e2e_github_repo      | no       | `https://github.com/openshift/openshift-tests-private`  | GitHub e2e test repository.                                                        |
| scheduler_e2e_github_branch    | no       | master                                                  | Test repository branch.                                                            |
| scheduler_pod_cpu_resource     | no       | 100m                                                    | Requested CPU to deploy a pod, it can be customized as per the requirement.        |
| scheduler_pod_cpu_limit        | no       | 200m                                                    | Maximum CPU limit to deploy a pod.                                                 |
| scheduler_pod_memory_resource  | no       | 32Mi                                                    | Requested memory to deploy a pod, it can be customized as per the requirement.     |
| scheduler_pod_memory_limit     | no       | 64Mi                                                    | Maximum memory limit to deploy a pod.                                              |
| scheduler_pod_count            | no       | 20                                                      | Number of maximum pods to be deployed.                                             |


Environment Variables
---------------------

| Variable             | Required       | Comments                                                                |
|----------------------|----------------|-------------------------------------------------------------------------|
| GITHUB_USERNAME      | yes            | Public GitHub account username to which the repository access granted.  |
| GITHUB_ACCESS_TOKEN  | yes            | GitHub personal access token to clone the repository.                   |


**Note: This environment should be set before running the playbook for clonning e2e test repository.**


Example Playbook
----------------

```
  - name: OCP scheduler profile validation and e2e test run 
    hosts: bastion
    roles:
    - ocp-scheduler
```


Steps to run playbook
----------------------

 - Copy `ocp4-playbooks-extras/examples/inventory` file to the home or working directory and modify it to add a remote host
 - Copy the `ocp4-playbooks-extras/examples/all.yaml` to the home or working directory and set `roles/ocp-scheduler` role variables with custom inputs.
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

