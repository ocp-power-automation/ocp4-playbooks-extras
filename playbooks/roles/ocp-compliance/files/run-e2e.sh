re_run_count=0
max_re_runs=3
echo -e "\ne2e summary:" > $COMPLIANCE_WORKDIR/e2e-summary.txt
cat "${COMPLIANCE_WORKDIR}/e2e-output.txt" | tail -n 1 >> $COMPLIANCE_WORKDIR/e2e-summary.txt
sed -e 's/\"/\\"/g;s/.*/\"&\"/' "${COMPLIANCE_WORKDIR}/e2e-output.txt" | awk '/Failing tests:/,EOF' | tail -n +3 | head -n -2 > $COMPLIANCE_WORKDIR/failed_tests.txt
while [ $re_run_count -lt $max_re_runs ] && [ "0" -ne "$(wc -l < "${COMPLIANCE_WORKDIR}/failed_tests.txt")" ]
do
    re_run_count=$(( $re_run_count + 1 ))
    ./bin/extended-platform-tests run -f $COMPLIANCE_WORKDIR/failed_tests.txt -o $COMPLIANCE_WORKDIR/e2e-re-run-output-${re_run_count}.txt
    sed -e 's/\"/\\"/g;s/.*/\"&\"/' "${COMPLIANCE_WORKDIR}/e2e-re-run-output-${re_run_count}.txt" | awk '/Failing tests:/,EOF' | tail -n +3 | head -n -2 > $COMPLIANCE_WORKDIR/failed_tests.txt
done
if [  $re_run_count -ne 0 ]; then
  echo -e "\n\ne2e summary after re-running:" >> $COMPLIANCE_WORKDIR/e2e-summary.txt
  cat $COMPLIANCE_WORKDIR/failed_tests.txt >> $COMPLIANCE_WORKDIR/e2e-summary.txt
  cat "${COMPLIANCE_WORKDIR}/e2e-re-run-output-${re_run_count}.txt" | tail -n 2 >> $COMPLIANCE_WORKDIR/e2e-summary.txt
fi
