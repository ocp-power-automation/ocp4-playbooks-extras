Set Custom Catalog Source 
=========

This is a role which is used to set the ImageContentSourcePolicy and custom CatalogSource. This role can be used in different ansible playbooks as a sub role. This role can not be used independently.

Role Variables
--------------

| Variable | Required | Default | Comments |
|----------|----------|---------|----------|
| custom_catalogsource_name | yes |  | Name of the catalog source which will be used while creating the operator's subscription |
| custom_catalogsource_display_name | yes |  | Display name of the catalog source |
| custom_catalogsource_image | yes |  | Image to use in the catalog source |

**Note:**
Variables can be used by external role to create custom CatalogSource.

eg. The `set-custom-catalogsource` role is used in SBO role as following:
```
  - name: Include role to create ImageContentSourcePolicy and CatalogSource
    include_role:
      name: set-custom-catalogsource
    vars:
      custom_catalogsource_name: "{{sbo_catalogsource_name}}"
      custom_catalogsource_display_name: "SBO Operator"
      custom_catalogsource_image: "{{sbo_catalogsource_image}}"
  when: sbo_catalogsource_image != '' and sbo_catalogsource_image != None
```
Variables `sbo_catalogsource_name` and `sbo_catalogsource_image` can be set in the SBO variable file.

Dependencies
------------

 - None

Example Playbook
----------------
```
---
- name: Set custom catalog source
  hosts: bastion
  roles:
  - set-custom-catalogsource
```

## License

See LICENCE.txt

## Author Information

varad.ahirwadkar@ibm.com
