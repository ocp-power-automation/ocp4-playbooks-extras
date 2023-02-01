OCP Pod disruption budget
=======================================

The role *"roles/ocp-pod-disruption-budget"* is an object to define the max disruption that can be caused to a collection of pods.
*minAvailable* is the number of pods must always be available, even during a disruption.
*maxUnavailable* is the number of pods can be unavailable during a disruption.
Values for *minAvailable* or *maxUnavailable* can be expressed as integers or as a percentage.

*Note -* You can specify only one of *maxUnavailable* and *minAvailable* in a single PodDisruptionBudget



Requirements
------------

 - Running OCP 4.x cluster.


Role Variables
--------------

| Variable                       | Required | Default                   |Comments                                                                                                                                                                                                                                                                          |
|--------------------------------|----------|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| pdb_enable        		     | no       | false                     | Flag to be set to true to enable pod disruption budget |   
| pdb_minAvailable        		 | no       | 3                         | Number of pods must always be available, even during a disruption |   
| pdb_maxUnavailable             | no       | -                         | Maximum number of pods that can be unavailable simultaneously |                   
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Dependencies
------------

 - None


Example Playbook
----------------

    - name: Start Pod disruption budget
      hosts: bastion
      roles:
        - ocp-pod-disruption-budget


Steps to run playbook
----------------------

 - Copy the ocp4-playbooks-extras/examples/inventory to the home/working directory
 - To execute the playbook run the below sample command


Sample Command
---------------

ansible-playbook -i inventory -e @examples/all.yaml ~/ocp4-playbooks-extras/playbooks/ocp-pod-disruption-budget.yml


License
-------

See LICENCE.txt


Author Information
------------------

Swapnil Bobade (swapnil.bobade@ibm.com)
