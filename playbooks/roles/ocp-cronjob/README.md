OCP Cronjob creation
=======================================

The role *"roles/ocp-cronjob"* provides automated creation of cronjobs. User can add cronjob value in the role variables for creation **Role Variables** section.
This role will create the cronjob and we can monitor the jobs usig oc commands


Requirements
------------

 - Running OCP 4.x cluster.


Role Variables
--------------

| Variable                            | Required | Default                   |Comments                                                                                                                         | 
|-------------------------------------|----------|---------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| enable_cronjob        		      | no       | false                     | Flag to be set to true to enable cronjob |   
| cronjob_schedule        		  	  | no       | * * * * *                 | schedule field for the job is specified in cron format. Here, the job run every minute |                    
| cronjob_concurrencyPolicy           | no       | Allow              		 | specifies how the job controller treats concurrent jobs within a cron job, values can be - ["Allow","forbid","replace"]     |
| cronjob_startingDeadlineSeconds     | no       | 200              		 | starting deadline specifies a deadline (in seconds) for starting the job    |
| cronjob_suspend             		  | no       | false              		 | prevent subsequent runs of the cron job |
| cronjob_successfulJobsHistoryLimit  | no       | 3              			 | store the successful jobs history limit     |
| cronjob_failedJobsHistoryLimit      | no       | 2             			 | store the failed jobs history limit    |
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|


Dependencies
------------

 - None


Example Playbook
----------------

    - name: Start cronjob
      hosts: bastion
      roles:
        - ocp-cronjob


Steps to run playbook
----------------------

 - Copy the ocp4-playbooks-extras/examples/inventory to the home/working directory
 - To execute the playbook run the below sample command


Sample Command
---------------

ansible-playbook -i inventory -e @examples/all.yaml ~/ocp4-playbooks-extras/playbooks/ocp-cronjob.yml


License
-------

See LICENCE.txt


Author Information
------------------

Swapnil Bobade (swapnil.bobade@ibm.com)
