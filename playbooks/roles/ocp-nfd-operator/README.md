Node Feature Discovery (NFD) Operator Installation
=========
This playbook is used for Installation of NFD Operator and verificationof successful installation.


Requirements
------------

 - Running OCP 4.x or 5.x cluster is needed.
 - Cluster must support ImageDigestMirrorSet (OCP 4.13+).

Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| ocp_nfd  |yes | False| Flag to be set to true to run this playbook |
| update_channel  | no | It uses default channel | It is used to set subscription channel for NFD Operator |
| nfd_instance_image_version  | no | It uses cluster version(eg. 4.9) |This image is used while creating NFD Custom Resource |
| nfd_catalogsource  | no | It uses default redhat-operators CatalogSource | It is used to set Index-Image of NFD Operator in the CatalogSource |
| check_nxgzip_label  |no | False| set to true when using p10 or p11 server |

#### Note:

- The playbook automatically detects the cluster version (4.x or 5.x) and uses the appropriate registry path.
- To modify *ImageDigestMirrorSet*, update the template at `playbooks/roles/ocp-nfd-operator/templates/ImageDigestMirrorSet.yaml.j2`.
- The `{{ openshift_version }}` variable is automatically set to `openshift4` or `openshift5` based on cluster version.

Default ImageDigestMirrorSet configuration:
```yaml
spec:
  imageDigestMirrors:
  - mirrors:
    - quay.io/redhat-user-workloads/ocp-art-tenant/art-images-share
    source: registry.redhat.io/{{ openshift_version }}/ose-cluster-nfd-operator-bundle
  - mirrors:
    - quay.io/redhat-user-workloads/ocp-art-tenant/art-images-share
    source: registry.redhat.io/{{ openshift_version }}/ose-cluster-nfd-rhel9-operator
  - mirrors:
    - quay.io/redhat-user-workloads/ocp-art-tenant/art-images-share
    source: registry.redhat.io/{{ openshift_version }}/ose-node-feature-discovery-rhel9
```

Dependencies
------------

 - None

Example Playbook
----------------
```
---
- name: Include the Node Feature Discovery Operator role
  hosts: bastion
  roles:
  - ocp-nfd-operator
```

What's New
----------

- **Migrated from ImageContentSourcePolicy to ImageDigestMirrorSet** (OCP 4.13+ requirement)
- **Automatic version detection**: Playbook detects cluster version and uses appropriate registry paths
- **Removed global-secret-update dependency**: No longer required
- **Support for both OCP 4.x and 5.x clusters**: Uses `openshift4` or `openshift5` registry paths automatically

License
-------

See LICENCE.txt

Author Information
------------------

varad.ahirwadkar@ibm.com
Vaishnavi.Dukare@ibm.com
