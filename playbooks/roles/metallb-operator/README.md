MetalLB Operator
================
MetalLB operator allows cluster administrator to add a service of type `LoadBalancer` and add an external IP address for the service. It requires custom resource to deploy MetalLB, after adding a custom resource it runs software component pods controller and speaker to allocate external IP and monitoring.         

This role will deploy the MetalLB operator and MetalLB custom resource by setting the role variables given below. Role also includes the operator cleanup and e2e tests run from `openshift-tests-private` repo. 

**Note: User can modify the MetalLB CR defintion in `ocp4-playbooks-extras/playbooks/roles/metallb-operator/files/metallb_cr.yaml` file as per the test requirement.**


Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys: ***username***, ***password*** and ***registry***


Role Variables
--------------

| Variable                       | Required | Default                                                                              | Comments                                                                                                                    |
|--------------------------------|----------|------------------------------------------------------------------------------------- |-----------------------------------------------------------------------------------------------------------------------------|
| metallb_role_enable            | No       | false                                                                                | Flag variable to enable the role for execution.                                                                             |
| metallb_operator_deploy        | No       | false                                                                                | Flag variable to allow the operator deployment.                                                                             |
| metallb_run_e2e                | No       | false                                                                                | Flag variable to enable the e2e tests.                                                                                      |
| metallb_namespace              | No       | metallb-system                                                                       | Namespace to install an operator, it should be same as the default and shouldn't be changed.                                |
| metallb_operator_image         | No       | `quay.io/openshift-release-dev/ocp-release-nightly:iib-int-index-art-operators-4.13` | Operator image to setup custom CatalogSource, the default is given for Openshift version `4.13`.                            |
| metallb_channel                | No       | stable                                                                               | Operator channel to be subscribed for installation, it can changed for specific version or will be used the default.        |    
| metallb_custom_catalogsource   | No       | my-operator-catalog                                                                  | Name for a custom catalogsource, the default will be se if undefined.                                                       |
| metallb_work_dir               | No       | /tmp/metallb-operator                                                                | To create  Working directory path for metallb operator deployment.                                                          |
| metallb_e2e_repo               | No       | `https://github.com/openshift/openshift-tests-private`                               | GitHub e2e test repo URL.                                                                                                   |
| metallb_e2e_repo_branch        | No       | master                                                                               | Branch for e2e test repo.                                                                                                   |
| metallb_golang_tarball         | No       | `https://go.dev/dl/go1.20.2.linux-ppc64le.tar.gz`                                    | Golang install tarball to install the latest go version, the go version to be installed should be `>=18`.                   |
| metallb_e2e_timeout            | No       | 60m                                                                                  | Custom var to override the ginkgo's default timeout for running e2e tests. It can be set as per the test requirement.       |


Environment Variables
---------------------

| Variable             | Required       | Comments 
|----------------------|----------------|------------------------------------------------------------------------|
| GITHUB_USERNAME      | Yes            | Public GitHub account username to which the repository access granted. |
| GITHUB_ACCESS_TOKEN  | Yes            | GitHub personal access token to clone the repository.                  |


Example Playbook
----------------

```
  - name: MetalLB Operator installation and e2e run
    hosts: bastion
    roles:
    - metallb-operator
```


Steps to run playbook
----------------------

 - Add a new host IP in `ocp4-playbooks-extras/examples/inventory` file with the name `bastion`. 
 - Set the role variables in `ocp4-playbooks-extras/examples/all.yaml` with the custom values OR can be set from `ocp4-playbooks-extras/examples/metallb_operator_vars.yaml` if `cluster-resource-override-operator` to be run only.  
 - To execute the playbook run the below sample command.


Sample Command
---------------

- Run the below command if the role variables are set in `ocp4-playbooks-extras/examples/all.yaml`:
ansible-playbook -i inventory -e @all.yaml ~/ocp4-playbooks-extras/playbooks/main.yml

- Run the below command if variables are set in `ocp4-playbooks-extras/examples/metallb_operator_vars.yaml`:
ansible-playbook -i examples/inventory -e @examples/metallb_opertaor_vars.yaml playbooks/metallb-operator.yml


License
-------

See LICENCE.txt


Author Information
------------------

Aditya.Honkalas@ibm.com
