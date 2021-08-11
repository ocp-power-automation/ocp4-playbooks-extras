ocp-cs: Common Services on OCP
=========

This module will install Common Services on OCP. Supported versions starting with 3.4 and above.

Requirements
------------

 - Running OCP 4.x cluster is needed.

Role Variables
--------------

| Variable                  | Required | Default                            | Comments                                                  |
|---------------------------|----------|------------------------------------|-----------------------------------------------------------|
| cs_setup_dir              | no       | ~/setup-files/cs-setup             | Place for config generation of Common Services files      |
| cs_operator_name          | no       | ibm-common-service-operator        | Name for operator subscription                            |
| cs_operand_namespace      | no       | ibm-common-services                | Namespace for Common Services oprands                     |
| cs_operator_project_name  | no       | common-service                     | Namespace to use for installing Common Services operators |
| cs_operator_catalog_image | no       | quay.io/opencloudio/ibm-common-service-catalog:latest | Catalog source image for IBM Common Services operators |
| cs_subscription_channel   | no       | stable-v1                          | Update channel for operator subscription                  |
| cs_subscription_strategy  | no       | Automatic                          | Approval stragergy for operator subscription              |
| cs_operand_list           | no       | ["ibm-cert-manager-operator","ibm-mongodb-operator","ibm-iam-operator","ibm-monitoring-exporters-operator","ibm-monitoring-prometheusext-operator","ibm-monitoring-grafana-operator","ibm-healthcheck-operator","ibm-management-ingress-operator","ibm-metering-operator","ibm-commonui-operator","ibm-ingress-nginx-operator","ibm-platform-api-operator"] | List of Common Services Operators to install |
| storageclass_name         | no       | nfs-storage-provisioner                | StorageClass name                                     |

Dependencies
------------

 - None

Example Playbook
----------------

    - name: Install common services
      hosts: bastion
      roles:
      - ocp-cs

License
-------

See LICENCE.txt

Author Information
------------------

Prajyot Parab (prajyot.parab@ibm.com)

