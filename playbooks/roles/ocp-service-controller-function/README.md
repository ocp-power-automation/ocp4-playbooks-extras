OCP Service Controller Function on IPI (Installer Provision Infrastructure) cluster
=========
This ansible playbook can be used for validating the Service controller functions (services of type loadbalancer) on IPI cluster.

It deploys the sample-app and service loadbalancer to check the functionality on IPI cluster.


Requirements
------------

- OCP IPI 4.x healthy cluster
- The cluster is in a known good state, without any errors.



Role Variables
--------------

| Variable                    | Required | Default                                    | Comments                                            |
|-----------------------------|----------|--------------------------------------------|-----------------------------------------------------|
| ocp_service| no | false  | Flag to be set to true to run this playbook  |

Dependencies
------------

 - None

Example Playbook
----------------
```
- name: Run the Service Controller function
  hosts: localhost
  roles:
  - ocp-service-controller-function
```

License
-------

See LICENCE.txt

Author Information
------------------

Prajwal.Gawande@ibm.com

