Cluster Resource Override Operator
================
The **Cluster Resource Override Operator** is an admission webhook that allows you to control the level of overcommit and manage container density across all the nodes in your cluster. The Operator controls how nodes in specific projects can exceed defined memory and CPU limits.

This role will deploy the Cluster Resource Override operator by setting up the custom catalog-source with the set role vars for operator image and the resources overcommitment limits. The playbook will also run the e2e tests from the `http://github.com/openshift/cluster-resource-override-admission-operator` repository.


Requirements
------------

- Access to the cluster as a user with the cluster-admin role.
- The cluster is in a known good state, without any errors.
- OCP secret with name ***podman-secret*** in the default namespace which is used for global secret update and has following keys: ***username***, ***password*** and ***registry***


Role Variables
--------------

| Variable                          | Required | Default                                                                                               | Comments                                                                                                   |
|-----------------------------------|----------|-------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| cro_role_enable                   | No       | false                                                                                                 | Role enablement flag to run the playbook.                                                                  |
| cro_install_operator              | No       | false                                                                                                 | Role var to enable operator installation.                                                                  |
| cro_enable_global_secret          | No       | false                                                                                                 | Role var to uodate the global pull-secret.                                                                 |
| cro_e2e                           | No       | false                                                                                                 | Role var to run the e2e tests for ClusterResourceOverride operator.                                        |
| cro_namespace                     | No       | clusterresourceoverride-operator                                                                      | The name to be set to the namespace for operator deployment, default will be used if not set.              |
| cro_ocp_version                   | No       | 4.14                                                                                                  | OCP cluster version, it is used in`cro_operator_image` var to replace version in the image.                |
| cro_operator_image                | No       | `quay.io/openshift-release-dev/ocp-release-nightly:iib-int-index-art-operators-{{ cro_ocp_version }}` | Operator image registry path, the default path contains the `cro_ocp_version` to replace correct version.  |
| cro_channel                       | No       | stable                                                                                                | Operator channel name to set in the Subscription. default will be taken if not set.                        |
| cro_custom_catalogsource          | No       | redhat-operators-stage                                                                                | The name for the custom catalogsource, if not set default will be assigned.                                |
| cro_e2e_repo_url                  | No       | `https://github.com/openshift/cluster-resource-override-admission-operator.git`                       | GitHub repository to run the e2e tests for Cluster Resource Override Operator.                             |
| cro_e2e_test_repo_branch          | No       | master                                                                                                | Branch name of the GitHub e2e test repository.                                                             |
| cro_workdir                       | No       | "/tmp/cro-operator"                                                                                   | Working directory path for operator deployment.                                                            |
| cro_go_tarball                    | No       | `https://go.dev/dl/go1.20.linux-ppc64le.tar.gz`                                                       | Golang tarball to install the latest golang version `>=1.18`. The default is set for `1.19.6`.             |
| cro_test_deployment               | No       | cro-test                                                                                              | The pod name to deploy a pod for clusterresourceoverride operator test.                                    |
| cro_test_container_label          | No       | nginx                                                                                                 | Container label name to be set in the pod object definition.                                               |
| cro_test_container_image          | No       | `quay.io/powercloud/nginx-unprivileged:latest`                                                        | Container image to create test container in the pod. `nginx` image is given as a default.                  |
| cro_test_resource_cpu_limit       | No       | 512Mi                                                                                                 | CPU resource limit for the test container.                                                                 |
| cro_test_resource_memory_limit    | No       | 2000m                                                                                                 | Memory resource limit for the test container.                                                              |    


Example Playbook
----------------

```
  - name: cluster-kube-descheduler-operator deployment playbook
    hosts: bastion
    roles:
    - cluster-resource-override
```


Steps to run playbook
----------------------

 - Add a new host IP to the `ocp4-playbooks-extras/examples/inventory` file with the name `bastion`. 
 - Set the role variables in `ocp4-playbooks-extras/examples/all.yaml` with the custom values OR can be also set from `ocp4-playbooks-extras/examples/cluster_resource_override_operator.yaml` if only `cluster-resource-override-operator` to be run.  
 - To execute the playbook run the below sample command.


Sample Command
---------------

ansible-playbook -i inventory -e @all.yaml ~/ocp4-playbooks-extras/playbooks/main.yml


License
-------

See LICENCE.txt


Author Information
------------------

Aditya.Honkalas@ibm.com
