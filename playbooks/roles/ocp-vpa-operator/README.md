Vertical Pod Autoscaler Operator
=========

This role is used for installation and verificatin of Vertical Pod Autoscaler. Before insatlling new VPA operator it first cleans old VPA resources. This playbook can be used for executing VPA e2e. Output of this role is saved in the directory specified by the variable `vpa_directory`.

It validates:
- Installation of VPA 
- VPA with different modes- Auto, Initial and Off
- Exempting containers from applying VPA recommendations (Implicit)
- Change in minimum replicas count

Role can use following workload objects:  
| Object Kind | Test application image  | Object name |
| ------ | ------ |------ | 
| Deployment | Nginx | deployment-nginx |
| StatefulSet | PostgresSQL | statefulset-postgresql | 
| ReplicaSet| Nginx | replicaset-nginx | 
| ReplicationController | Nginx | replicationcontroller-nginx | 
| DeploymentConfig | Nginx | deploymentconfig-nginx | 

**Note:**
- If all the flags are false then default playbook will install only VPA operator. It will not create VPA custom resource (CR) or workload object in the cluster.
- If no workload object is specified then by default playbook will run for all workload objects with the specified VPA mode.
- Replicas count of all workload objects is 2.
- While validating with minimum replicas count, cluster wide minimum replicas will be set to 3. VPA with `updateMode: Auto` will not update pod's resources automatically. Because all workload objects replicas are set to two. So, role will check for negative test case (Pods resources should not update).
- Initial results of e2e will be stored in `e2e_output.txt`. Re-running summary and failed test cases will be stored in `e2e_summary.txt` and `failed_testcases.txt` respectively.

Requirements
------------

 - Running OCP 4.x cluster is needed.
 - Create one OCP secret with name ***podman-secret***  in the default namespace which is used for global secret update and has following keys:
   ***username***, ***password***  and ***registry***  

eg. `podman-secret`
```
apiVersion: v1
kind: Secret
metadata:
  name: podman-secret
type: kubernetes.io/basic-auth
stringData:
  username: admin
  password: t0p-Secret
  registry: exampe.redhat.io
```

Role Variables
--------------

| Variable | Required | Default | Comments |
|----------|----------|---------|----------|
| vpa_update_channel  | no | stable | Subscription update channel |
| vpa_catalogsource_image  | no | It will use default catalog source `redhat-operators` | Catalog source index image |
| vpa_update_mode_auto  | no | false | It creates VPA with `updateMode: Auto` |
| vpa_update_mode_initial  | no | false | It creates VPA with `updateMode: Initial` |
| vpa_update_mode_off | no | false | It creates VPA with `updateMode: Off` |
| vpa_minimum_replicas_test | no | false | It validates VPA by changing minimum replicas to 3 |
| vpa_object_kind | no | All workload objects | It is a workload type. One value from: Deployment, StatefulSet, ReplicaSet, ReplicationController, DeploymentConfig |
| vpa_directory | no | /root/VPA_output | VPA directory |
| vpa_e2e | no | false | It executes the VPA e2e |
| vpa_cleanup | no | false | It is used to clean the VPA resources only |

Note: To set the go lang version and path please use the variables from the `golang-installation` role. Please make sure, value for `golang_installation_path` is `/usr/local/`.

Dependencies
------------

 - Role global-secret-update
 - Role set-custom-catalogsource
 - Role golang-installation

Example Playbook
----------------
```
---
- name: Include the Vertical Pod Autoscaler Operator role
  hosts: bastion
  tasks:
  - name: Include the global-secret-update role
    include_role:
      name: global-secret-update
    when: vpa_catalogsource_image != "" and vpa_catalogsource_image != None and vpa_cleanup == false

  - name: Include the Vertical Pod Autoscaler Operator role
    include_role:
      name: ocp-vpa-operator
```

License
-------

See LICENCE.txt

Author Information
------------------

varad.ahirwadkar@ibm.com
