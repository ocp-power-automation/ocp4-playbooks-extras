#!/bin/bash
NUMBER=$1
ENCY_TYPE=$2
for i in /kubernetes.io/secrets /kubernetes.io/configmaps /openshift.io/routes /openshift.io/oauth/accesstokens
 do
   FILE=/tmp/"${i##*/}"-$ENCY_TYPE-values-$NUMBER.txt
   etcdctl get $i --prefix -w fields > "$FILE-with-key"
   etcdctl get $i --prefix -w fields | grep -e '"Value"' > $FILE
   echo "${i##*/} items: `cat $FILE | wc -l` prefix: `grep k8s:enc:$ENCY_TYPE:v1:$NUMBER $FILE | wc -l`"
 done
