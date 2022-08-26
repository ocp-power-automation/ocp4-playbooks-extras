OCP CLI-plug-ins deployment and testing
=======================================

The role *"roles/ocp-cli-plugins"* provides automated deployment and testing for the CLI-plugins oc-mirror, oc-compliance, krew-cli and custom-cli plugin. User can add CLI-plugin names in the role variable *deploy_cli_plugins* for deploy and test the plugins as explained in **Role Variables** section.
This role install the prerequisite tools and depedencies for these plugins before deploying them.


Requirements
------------

 - Running OCP 4.x cluster.


Role Variables
--------------

| Variable                       | Required | Default                   |Comments                                                                                                                                                                                                                                                                          |
|--------------------------------|----------|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| enable_cli_plugins_test        | no       | false                     | Flag to be set to true to enable custom CLI-plug-in test playbook                                                                                                                                                                                                                |
| deploy_cli_plugins             | yes      | empty list                | List of cli-plugin names to be deployed and tested, plugin names must be among ["custom","krew","mirror","compliance"]. Empty list will not deploy or test any cli-plugin                                                                                                        |
| user_custom_plugin             | no       | empty string              | File name of user defined custom-cli-plugin prefixed with "oc-" e.g. user_custom_plugin: "oc-my-plugin.sh". Please refer to the sample plugin `role_path/files/oc-test-plugin.sh` in the role files and will be used as a default if not provided user defined custom plugin     |
| golang_tar_url                 | no       | empty string              | Golang tar URL for ppc64le architecture to install golang version >= 1.18, if not provided it will install golang with the default tarball URL given in the `defaults/main.yaml` for version 1.18.4 as per the minimum requirement                                               |
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Default Variables
-----------------

| Variable                       | Default                            | Comments
| -------------------------------|------------------------------------|----------------------------------------------------------------------------------------------------------------|
| cli_plugin_map                 | dict                               | A dictionary map between the cli-plugin names to respective task module files                                  |
| default_go_tar_url             | tarball URL                        | Golang tarball URL- https://go.dev/dl/go1.18.4.linux-ppc64le.tar.gz for power architecture and version 1.18.4  | 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



Steps to enable deploy and test CLI-plugins via playbook
---------------------------------------------------------

1. Custom CLI-plug-in: The playbook performs the test with the default custom-cli plugin named "oc-foo.sh", alternatively you can create your own custom plugin by following the below steps: 

    - Add the name "custom" into the list variable deploy_cli_plugins mentioned above in the Role Variables
    - Create a shell/bash file of your custom CLI-plugin with the prefix "oc-" in the name e.g. oc-test-plugin.txt
    - Place at role path ~/ocp4-playbooks-extras/playbooks/roles/ocp-cli-plugins/files/
    - Assign the plug-in name to variable "user_custom_plugin" in the var file cli_plugins_vars.yaml
    - Follow the below steps to run the playbook
    
2. Krew CLI-plug-in: To enable the krew-cli plugin test add the name "krew" into the list variable deploy_cli_plugins mentioned in the Role Variables and follow the steps to run the playbook.

3. oc-mirror CLI-plug-in: To enable the oc-mirror test cli-plugin test add the name "mirror" into the list variable deploy_cli_plugins mentioned in the Role Variables and follow the steps to run the playbook.

4. oc-compliance CLI-plug-in: To enable the oc-compliance cli-plugin test add the name "compliance" into the list variable deploy_cli_plugins mentioned in the Role Variables and follow the steps to run the playbook.


Dependencies
------------

 - None


Example Playbook
----------------

    - name: OCP CLI-plug-ins test suite
      hosts: bastion
      roles:
      - ocp-cli-plugins


Steps to run playbook
----------------------

 - Copy the ocp4-playbooks-extras/examples/inventory and ocp4-playbooks-extras/examples/cli_plugins_vars.yaml to the home/ working directory
 - To execute the playbook run the below sample command


Sample Command
---------------

ansible-playbook -i inventory -e @cli_plugins_vars.yaml ~/ocp4-playbooks-extras/playbooks/ocp-cli-plugins.yml


License
-------

See LICENCE.txt


Author Information
------------------

Aditya Honkalas (Aditya.Honkalas@ibm.com)
