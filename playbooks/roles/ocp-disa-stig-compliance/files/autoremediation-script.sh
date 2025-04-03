for REMEDIATION in $(oc get compliancecheckresults.compliance --no-headers | grep -v PASS | grep -v usb | awk '{print $1}') 
do 
    FOUND="$((oc get complianceremediations ${REMEDIATION} 2> /dev/null 1> /dev/null && echo 0) || echo 1)" 
    if [[ "${FOUND}" == "0" ]] 
    then 
        oc -n openshift-compliance patch complianceremediations/${REMEDIATION} --patch '{"spec":{"apply":true}}' --type=merge 
    fi 
done 
