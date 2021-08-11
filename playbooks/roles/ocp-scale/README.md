ocp-scale: OCP minimal scale test
=========

This module will run a minimal scale. Results will be stored in ~/scale_test_results/ directory on bastion.

Requirements
------------

 - Running OCP 4.x cluster is needed.

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| scale_test_git  | no | https://github.com/RobertKrawitz/OpenShift4-tools.git | Git repo url for the scale tests |
| scale_test_git_branch | no | master | Git repo branch for scale tests  |
| scale_test_dir | no | /tmp/OpenShift4-tools_ws/ | Test directory |
| scale_num_of_deployments | no | 100 | Number of pods to be created |
| scale_num_of_objects | no | 1 | Number of pods to be created in single oc call |
| scale_num_of_containers | no | 1 | Number of containers per pod |
| scale_num_of_namespaces | no | 1 | Number of namespaces to be created |
| scale_pod_type | no | 1 | Type of pods, other types are pause, server, cpu, sysbench |


Dependencies
------------

 - None

Example Playbook
----------------

    - name: Run scale test case
      hosts: bastion
      roles:
      - ocp-scale

License
-------

See LICENCE.txt

Author Information
------------------

sudeeshjohn@in.ibm.com

