hypershift-install: Create a Hypershift cluster in IBM Cloud Power VS service.
=========

Requirements
------------

 - Running OCP 4.x cluster is needed.

Role Variables
--------------
Common variables used for both hypershift deployment and destroy operations:

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| mgmt_cluster_kubeconfig  | no | ~/.kube/config| Path to the management clusters kubeconfig |
| hosted_cluster_name | no  |  rdr-hypershift-cluster | Name of the hypershift cluster |
| infra_id | no  |  rdr-hypershift-infra | Cluster ID with which to tag IBM Cloud resources |
| hypershift_dir | no | ~/hypershift  | Place for the hypershift git repo  |
| hypershift_git_repo | no  | https://github.com/openshift/hypershift  | git repository to install hypershift   |
| hypershift_git_branch | no  | main  |  Hypershift git repository branch  |
| ibmcloud_resource_group | yes  |  |  IBM Cloud Resource group. Click [here](https://cloud.ibm.com/docs/account?topic=account-rgs&interface=ui) for more information   |
|  powervs_region | yes  |  | Power VS region   |
|  powervs_zone | yes  | | Power VS zone   |
|  vpc_region | yes  |   |  Name of the VPC region in IBM Cloud  |
|  base_domain | yes  |   | The base domain of the cluster. It should be an existing CIS domain name  |

Variables specific to Hypershift deployment in addition to the common variables:
| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
|  hypershift_install | no  | false | Set to true to deploy hypershift   |
|  nodepool_replicas | no  | 2 | Worker node count   |
|  ocp_release_image | yes  | | OCP release image  |
|  ocp_pull_secret_path | no  | ~/.pullSecret | Openshift pull secret. Visit https://console.redhat.com/openshift/install/pull-secret to create one.   |
|  proc_type | no  | shared| Processor type (dedicated, shared, capped)  |
|  processors | no  | 0.5 |  Number of processors allocated. |
|  memory | no  | 32 | Amount of memory allocated  |
|  sys_type | no  | s922 | System type in Power VS  |


Variables specific to Hypershift destroy in addition to the common variables:
| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
|  hypershift_destroy | no  | false | Set to true to destroy hypershift cluster   |

Dependencies
------------

Export the IBM Cloud API Key
```
$ set +o history
$ export IBMCLOUD_API_KEY='<your API key>'
$ set -o history
```
Example Playbook
----------------
```
---
- name: Checks for Hypershift on Power VS
  hosts: bastion
  tasks:
    - name: Fail Hypershift installation incase 'IBMCLOUD_API_KEY' environment variable is an empty string
      fail:
        msg: IBMCLOUD_API_KEY environment variable must be a non-empty string.
      when: (lookup('env', 'IBMCLOUD_API_KEY') == "")

    - name: Check golang version for Hypershift deployment
      shell: go version | awk '{ print substr ($3,3) }'
      register: golang_version

    - fail:
        msg: golang is not installed or version < 1.18
      when: golang_version.rc !=0 or golang_version.stdout < "1.18"
    - debug:
        msg: "{{ golang_version }}"

    - include_role:
        name: hypershift
      vars:
        IBMCLOUD_API_KEY: "{{ lookup('env', 'IBMCLOUD_API_KEY') }}"

```
License
-------

See LICENCE.txt

Author Information
------------------

pravin.dsilva@ibm.com
