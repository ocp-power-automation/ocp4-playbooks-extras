Enable monitoring for user defined projects 
===========================================

In OpenShift Container Platform users can enable monitoring for user-defined projects in addition to the default platform monitoring. This feature allows users to monitor their own projects in OpenShift Container Platform without the need for an additional monitoring solution. Using this new feature centralizes monitoring for core platform components and user-defined projects.

This role enables monitoring services created in the user defined projects. The playbook performs the following steps to enable user defined project monitoring:
 - Create a new namespace
 - Deploy a sample prometheus app
 - Create service to define the monitoring metrics
 - Deploy a ServiceMonitor resouce object
 - Update the cluster-monitoring-config object to enable monitoring for user defined projects
 - Check the service pods running
 - Grant the permissions to the external user
 - Extracting the secret token, bearer access token and thanos querier URL
 - Run querying command to access the monitoring metrics outside the cluster


Requirements
------------

 - Running OCP 4.x cluster.


Role Variables
--------------

| Variable                               | Required | Default                                      | Comments                                                                             |
|----------------------------------------|----------|----------------------------------------------|--------------------------------------------------------------------------------------|
| enable_user_defined_project_monitoring | no       | false                                        | Flag to enable monitoring-user-defined-project-monitoring role.                      |
| user_defined_app_name                  | no       | example-app                                  | App name for the user-defined-project.                                               |
| user_defined_namespace                 | no       | test-project1                                | User defined project name.                                                           |
| service_monitor_name                   | no       | example-app-monitor                          | Name of the ServiceMonitor for monitoring user defined app.                          |
| user_defined_app_image                 | no       | quay.io/powercloud/nginx-unprivileged:latest | Container image for deploying user-defined app, user can set any other custom image. |                                                                                                     
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Dependencies
------------

 - None


Example Playbook
----------------

  - name: Enabling user defined project monitoring
    hosts: bastion
    roles: 
    - monitoring-user-defined-projects


Steps to run playbook
----------------------

 - Copy `ocp4-playbooks-extras/examples/inventory` file to the home or working directory and modify to add a remote host
 - Copy the `ocp4-playbooks-extras/examples/all.yaml` to the home or working directory, set the role variables with the custom inputs and enable the role for executing test
 - To execute the playbook run the below sample command


Sample Command
---------------

ansible-playbook -i inventory -e @all.yaml ~/ocp4-playbooks-extras/playbooks/main.yml

OR to run the specific playbook use below command:
ansible-playbook -i inventory -e @examples/all.yaml ~/ocp4-playbooks-extras/playbooks/monitoring-user-defined-projects.yml 


License
-------

See LICENCE.txt


Author Information
------------------

Aditya Honkalas (Aditya.Honkalas@ibm.com)
