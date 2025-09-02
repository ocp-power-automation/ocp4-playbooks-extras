Validate Topology Manger
========================

This playbook validates the Topology Manager for which it covers the following use cases:

* Validate Pod Alignment with CPU requests and Topology Manager policy set to Single numa node
* Validate Pod Alignment with CPU requests and Topology Manager policy set to Best Effort
* Validate Pod Alignment with CPU requests and Topology Manager policy set to Restricted
* Validate Pod Alignment with CPU requests and Topology Manager policy set to None

Note: Other few use cases need to be validated manually

- Validate pod alignment with CPU requests for Topology Manager 'single-numa-node' policy - We expect pod scheduling within NUMA locality.
- Validate pod alignment with CPU requests for Topology Manager 'best-effort' policy - We do not expect any pod scheduling to be rejected as deployments are not restricted to NUMA locality.  
- Validate pod alignment with CPU requests for Topology Manager 'restricted' policy - The policy will allow the deployments to use resources beyond NUMA locality. 
- Validate pod alignment with CPU requests for Topology Manager 'none' policy - This would not restrict any deployments from being scheduled .

So, in accordance to these criteria it is expected that all the deploymets get scheduled.

Pre-requisite & Requirements
----------------------------

- The cluster is in a known good state, without any errors.
- Analyze the NUMA nodes partition & CPU memory in worker-1 for the above use cases.

Role Variables
--------------

| Variable          | Required | Comments                                        |
| ----------------  | -------- | ----------------------------------------------- |
| topology_enabled  | no       | Set it to true to run this playbook.            |
| single_node_cpuv1 | yes      | Request desired no. of CPUs for the first pod.  |
| single_node_cpuv2 | yes      | Request desired no. of CPUs for the second pod. |
| besteffort_cpuv1  | yes      | Request desired no. of CPUs for the first pod.  |
| besteffort_cpuv2  | yes      | Request desired no. of CPUs for the second pod. |
| restricted_cpuv1  | yes      | Request desired no. of CPUs for the first pod.  |
| restricted_cpuv2  | yes      | Request desired no. of CPUs for the second pod. |
| none_cpuv1        | yes      | Request desired no. of CPUs for the first pod.  |
| none_cpuv2        | yes      | Request desired no. of CPUs for the second pod. |

Example Playbook
----------------

```
- name: Validate topology manager on Power
  hosts: bastion
  roles:
  - topology-manager
```

Steps to run playbook
---------------------

- Copy `ocp4-playbooks-extras/examples/inventory` file to the home or working directory and modify it to add a remote host
- Copy the `ocp4-playbooks-extras/examples/topology_vars.yaml` to the home or working directory and set the role variables for `roles/topology-manager` with the custom inputs.
- To execute the playbook run the below sample command

Sample Command
--------------

ansible-playbook -i inventory -e @topology_vars.yaml ~/ocp4-playbooks-extras/playbooks/topology-manager.yml

License
-------

See LICENCE.txt

Author Information
------------------

aniruddha.nayek@ibm.com

