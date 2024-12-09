ocp-kube-burner
=========================
This playbook will run the kube-burner workload test

Requirements
------------

 - Running OCP 4.x cluster

Role Variables
--------------
| Variable                       | Required | Default     | Comments                                       |
|--------------------------------|----------|-------------|------------------------------------------------|
| enable_kube_burner             | no       |    false    | Set it to true to run this playbook            |
| kube_burner_repo               | no       |    false    | https://github.com/kube-burner/kube-burner.git |
| kube_burner_dir                | no       |    false    | /root/kube-burner                              |
| kube_burner_path               | no       |    false    | /root/kube-burner/examples/workloads           |
| kube_burner_version            | no       |    false    | set the required version                       |



Example Playbook
----------------

```
  - name: Run kube burner tests
    include_role:
      name: ocp-kube-burner
```

License
-------

See LICENCE.txt

Author Information
------------------

swapnil.bobade@ibm.com
