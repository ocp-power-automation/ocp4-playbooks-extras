OCP - Network Observability Operator
=========

The `ocp-network-observability` role can be used to install both released and un-released Network Observability operator version along with the Loki operator. The playbook invokes the automation script from `https://github.com/openshift-qe/ocp-qe-perfscale-ci` repository which deploys the lokistack and flowcollector for initialising the eBPF agent pods with the operator installation. The role also enables running e2e tests for Network Observability opertaor and stores the output to the `~/workdir` path. 

Requirements
------------

- Stable OCP 4.x cluster with the worker nodes having ***4 vCPUs*** and ***84GiB Memory*** compute resource to each node.
- An aws_access_key_id and aws_secret_access_key of AWS IAM user account with `AWSS3FullAccess` permission.
- Access to the `https://github.com/openshift/openshift-tests-private` repository for running e2e tests.


Role Variables
--------------

| Variable                | Required | Default                                              | Comments                                                                                                                                                                                                                                                                                                    |
--------------------------|----------|------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| noo_role_enable         | No       | false                                                | Enables the role to execution.                                                                                                                                                                                                                                                                              |
| noo_deploy              | No       | false                                                | Enables the netobserv operator installation and resource deployment.                                                                                                                                                                                                                                        |
| noo_directory           | No       | /tmp/network-observability                           | Working directory path.                                                                                                                                                                                                                                                                                     |  
| noo_catalogsource_image | No       | empty string                                         | Brew registry index image for installing operator via custom catalogsource.                                                                                                                                                                                                                                 |
| noo_installation_source | No       | Official                                             | Input for operator installation source, it can be set with the value as "Internal"- for installing pre-released operator from brew registry, "Official"- for installing latest GA-released downstream operator version, "OperatorHub"- for installing latest officially-released upstream operator version. |
| noo_catalogsource_name  | No       | qe-app-registry                                      | Name for creating custom catalogsource.                                                                                                                                                                                                                                                                     |
| noo_loki_operator       | No       | Released                                             | Input for Loki operator installation, default will be "Released" if not set otherwise.                                                                                                                                                                                                                      |  
| noo_lokistack_size      | No       | 1x.extra-small                                       | Input for lokistack size, it can be set with the value as "1x.extra-small", "1x.small" OR "1x.medium".                                                                                                                                                                                                      |
| noo_e2e_repo_branch     | No       | main                                                 | OCP "release-4.x" branch for `openshift-tests-private` repository for running netobserv e2e tests on specific OCP cluster.                                                                                                                                                                                  |       
| noo_go_tarball          | No       | https://go.dev/dl/go1.20.10.linux-ppc64le.tar.gz     | Golang installation URL for ppc64le/linux arch, will be used default for v1.20.1 if not set otherwise.                                                                                                                                                                                                      |
| noo_backend_e2e         | No       | false                                                | Enables the e2e run for Network Observability operator.                                                                                                                                                                                                                                                     |
| noo_e2e_gituhb_repo     | No       | https://github.com/openshift/openshift-tests-private | `openshift-tests-private` e2e test repository URL for Network Observability operator.                                                                                                                                                                                                                       |


Environment Variables
---------------------

| Variable              | Required | Comments                                                                            |
------------------------|----------|-------------------------------------------------------------------------------------|
| GITHUB_USERNAME       | Yes      | GitHub username.                                                                    |
| GITHUB_ACCESS_TOKEN   | Yes      | GitHub access token.                                                                |
| AWS_ACCESS_KEY_ID     | Yes      | aws_access_key_id of an AWS IAM user account with `AWSS3FullAccess` permission.     |
| AWS_SECRET_ACCESS_KEY | Yes      | aws_secret_access_key of an AWS IAM user account with `AWSS3FullAccess` permission. |
| AWS_DEFAULT_REGION    | Yes      | aws_default_region for AWS IAM account.


Example Playbook
----------------

```
- name:
  hosts: bastion
  roles: 
  - ocp-network-observability
    
```


Steps to run the playbook
--------------------------

- Set the above role vars for enabling operator deployment and e2e run with the appropriate values set to input parameters in the `examples/all.yaml` OR `examples/ocp_network_observability_vars.yaml`. 

- Set the GitHub and AWS enviroment vars listed above

- Change the `examples/inventory` 

- Run the command- `ansible-playbook -i examples/inventory -e @examples/all.yaml playbooks/main.yml`


License
-------

BSD


Author Information
------------------

Aditya.Honkalas@ibm.com
