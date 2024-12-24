Scheduler-Plugins
=================

The `scheduler-plugins` role allows users to define and configure which scheduler plugins to deploy and test in an OpenShift cluster via the `deploy_scheduler_plugins` variable. The role ensures all prerequisites and dependencies are installed and ready before deploying the specified plugins.
                                                                                                                                     The role automates the installation, configuration, and testing of various scheduler plugins for OpenShift. By configuring the `deploy_scheduler_plugins` variable, users can specify which plugins to deploy and test, and the role will handle the necessary tasks.

Requirements
------------

- OCP 4.x healthy cluster on PowerVC.

Role Variables
--------------

| Variable  | Required  | Default | Comments |
| ------ | ------ |------ | -----|
| scheuler_plugins_enable | no | False | Set it to true to run this playbook |
| kubeconfig_path | no | /root/openstack-upi/auth/kubeconfig | Path to the kubeconfig file for accessing the OpenShift cluster. | 
| scheduler_image | no | registry.k8s.io/scheduler-plugins/kube-scheduler:v0.30.6 | The image used for the scheduler plugin.| 
| nginx_image | no | quay.io/powercloud/nginx-unprivileged:latest | Nginx image used for testing deployments | 
| pause_image | no | registry.k8s.io/pause:3.6 | Image for pause containers used in tests.| 

Playbook Overview
-----------------

The playbook consists of several tasks that are grouped as follows:

Scheduler Plugin Installation

1. Clone the scheduler-plugins repository: Clones the GitHub repository for the scheduler plugins.
2. Create the scheduler-plugins namespace: Creates the namespace in the OpenShift cluster for scheduling plugins.
3. Install scheduler-plugins Helm chart: Deploys the scheduler-plugins chart using Helm.
4. Update scheduler-plugins-scheduler image: Updates the scheduler-plugins image used in OpenShift with a specific version.

Capacity Scheduler Plugin Test

1. Create Namespaces: Creates two namespaces, quota1 and quota2.
2. Apply ElasticQuota: Applies an ElasticQuota to quota1 and quota2 namespaces.
3. Deploy nginx: Deploys an Nginx application to quota1 and quota2 using the scheduler-plugins scheduler.

Co-Scheduling Plugin Test

1. Set OpenShift project: Switches the OpenShift project to scheduler-plugins.
2. Create PodGroup (po.yaml): Creates a PodGroup to test co-scheduling functionality.
3. Create and apply Deployment: Creates a deployment with specific configurations (e.g., using the pause container for testing).
4. Scale Deployment: Scales the deployment to test scheduling behavior.
5. Clean up: Removes temporary files after the test.

Node Resource Scheduler Plugin Test

1. Set OpenShift project: Switches the OpenShift project to scheduler-plugins.
2. Modify ConfigMap: Modifies the scheduler configuration to enable the NodeResourcesAllocatable plugin.
3. Apply the new ConfigMap: Applies the modified scheduler configuration.
4. Delete scheduler-plugins pods: Deletes the scheduler-plugins pods to apply changes.
5. Verify scheduler pod status: Ensures that the scheduler and operator pods are running with the updated configuration.


Dependencies
------------

- None

Example Playbook
----------------
```
---
- name: OCP Scheduler Plugins Deployment and Test Suite
  hosts: bastion
  roles:
    - scheduler-plugins
```

License
-------

See LICENCE.txt

Author Information
------------------

ananya.kumari@ibm.com
