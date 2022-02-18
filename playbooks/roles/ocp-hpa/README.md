Horizontal Pod Autoscaler
=========

This playbook installs Horizontal Pod Autoscaler for different kinds of objects like Deployment, StatefulSet, ReplicaSet, ReplicationController, DeploymentConfig and verifies scaling.

It supports autoscaling for memory utilization, CPU utilization and for both memory and CPU utilization with two target types `AverageValue` and `Utilization`.

Output of this playbook is stored in `/root/hpa_output.txt`.

**This playbook installs different kinds of objects :**
| Object Kind | Test Application | Object name | 
| ------ | ------ |------ | 
| Deployment | nginx | deployment-nginx |
| StatefulSet | postgresql-db | postgresql-db | 
| ReplicaSet | nginx | replicaset-nginx | 
| ReplicationController | nginx | replicationcontroller-nginx | 
| DeploymentConfig | nginx | deploymentconfig-nginx | 


Requirements
------------

 - Running OCP 4.x cluster is needed.
 - StorageClass resource is present on cluster for dynamically provisioned storage on demand.


Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| hpa_memory_utilization | no | false | Flag to be set to true to run HPA for memory utilization |
| hpa_cpu_utilization | no | false | Flag to be set to true to run HPA for CPU utilization |
| hpa_memory_cpu_utilization | no | false | Flag to be set to true to run HPA for memory and CPU utilization |
| target_type | no | AverageValue | It used to set target type AverageValue or Utilization |
| average_memory | no | 1Mi or 1 | It used to set target type value for memory. Default value is based on `target_type` |
| average_cpu | no | 1m or 3 | It used to set target type value for CPU. Default value is based on `target_type` |
| hpa_min_replicas | no | 1 | It is used to set minimun number of replica while scaling |
| hpa_max_replicas | no | 5 | It is used to set maximum number of replica while scaling |
| object_kind | no | All 5 workload objects. | Possible values are Deployment, StatefulSet, ReplicaSet, ReplicationController, DeploymentConfig|

**Note:**
- When we use `target_type` as `AverageValue` then default value for `average_memory` is `1Mi` and/or value for `average_cpu` is `1m`.
- When we use `target_type` as `Utilization` then default value for `average_memory` is `1` and/or value for `average_cpu` is `3`.

Dependencies
------------

 - None

Example Playbook
----------------
```
---
- name: Run  horizontal pod autoscaler
  hosts: bastion
  roles:
  - ocp-hpa

```

## License

See LICENCE.txt

## Author Information

varad.ahirwadkar@ibm.com
