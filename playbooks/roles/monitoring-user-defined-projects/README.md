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

| Variable                               | Required | Default                        |Comments                                                                                              |
|----------------------------------------|----------|--------------------------------|----------------------------------------------------------------------------------------------------- |
| enable_user_defined_project_monitoring | no       | false                          | Flag to be set to true to enable monitoring-user-defined-project-monitoring role execution           |
| user_defined_app_name                  | no       | prometheus-example-app         | Name to create a user defined prometheus app, if not defined the default will be set                 |
| user_defined_namespace                 | no       | test-namespace                 | Name to create user defined namespace, if not defined the default will be set                        |
| service_monitor_name                   | no       | prometheus-example-app-monitor | Name for a ServiceMonitor object monitoring user defined app, if not defined the default will be set |
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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


License
-------

See LICENCE.txt


Author Information
------------------

Aditya Honkalas (Aditya.Honkalas@ibm.com)
