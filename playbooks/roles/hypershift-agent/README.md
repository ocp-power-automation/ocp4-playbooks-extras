hypershift agent-based install: Helps in a deploying a Hypershift cluster
=========

Requirements
------------

 - Running OCP 4.x cluster is needed that acts as a management cluster.

Role Variables
--------------
Common variables used for both hypershift deployment and destroy operations:

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| hypershift_agent_install  | no | false | Enable it to install the hosted cluster |
| hypershift_agent_destroy  | no | false | Enable it to destroy the hosted cluster |
| acm_mce_install | no | false | Enable it to install ACM and MCE operator |
| hosted_cluster_name | no | hypershift-hosted | Name of the hypershift cluster |
| acm_catalogsource_name | no | redhat-operators-acm | Name of the ACM CatalogSource |
| acm_catalogsource_image | yes | | Custom catalog source index image for ACM Operator (Ex: brew.registry.redhat.io/rh-osbs/iib:860542 )|
| acm_upgrade_channel | no | release-2.12 | Upgrade channel for ACM operator |
| mce_catalogsource_name | no | redhat-operators-mce | Name of the MCE CatalogSource |
| mce_catalogsource_image | yes | | Custom catalog source index image for MCE Operator (Ex: brew.registry.redhat.io/rh-osbs/iib:861849) |
| mce_upgrade_channel | no | stable-2.7 | Upgrade channel for MCE Operator |
| base_domain | no | qe-ppc64le.cis.ibm.net | The base domain of the cluster |
| pull_secret_file | no | ~/.pullSecret | Pull secret file |
| ocp_release | yes | | ocp release version of the cluster to deploy |
| arch | no | ppc64le | cluster architecture |
| hypershift_dir | no | /root/hypershift | folder that will contain kubeconfig, etc |
| hypershift_git_repo | no | https://github.com/openshift/hypershift | git repository to install hypershift |
| hypershift_git_branch | no | main | Hypershift git repository branch |
| cluster_namespace | no | clusters |  |
| ssh_pub_key | no | ~/.ssh/id_rsa.pub | |
| db_volume_size | no | 10Gi | Database Volume Size |
| fs_volume_size | no | 100Gi | FileSystem Volume Size |
| iso_url | yes | | ISO url |
| root_fs_url | yes | | Root fs url |

Dependencies
------------

Login to the management cluster and then run the playbook.

Example Playbook
----------------
```
---
- name: Run ocp alerts
  hosts: bastion
  roles:
  - hypershift-agent
```

License
-------

See LICENCE.txt

Author Information
------------------

Aishwarya.Kamat@ibm.com
