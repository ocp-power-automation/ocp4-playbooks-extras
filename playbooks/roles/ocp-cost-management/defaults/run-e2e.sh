re_run_count=0
max_re_runs=1
echo -e "\ne2e summary:" > $COST_MANAGEMENT_WORKDIR/e2e-summary.txt
cat "${COST_MANAGEMENT_WORKDIR}/e2e-output.txt" | tail -n 1 >> $COST_MANAGEMENT_WORKDIR/e2e-summary.txt
sed -e 's/\"/\\"/g;s/.*/\"&\"/' "${COST_MANAGEMENT_WORKDIR}/e2e-output.txt" | awk '/Failing tests:/,EOF' | tail -n +3 | head -n -2 > $COST_MANAGEMENT_WORKDIR/failed_tests.txt
while [ $re_run_count -lt $max_re_runs ] && [ "0" -ne "$(wc -l < "${COST_MANAGEMENT_WORKDIR}/failed_tests.txt")" ]
do
    re_run_count=$(( $re_run_count + 1 ))
    ./bin/extended-platform-tests run -f $COST_MANAGEMENT_WORKDIR/failed_tests.txt -o $COST_MANAGEMENT_WORKDIR/e2e-re-run-output-${re_run_count}.txt
    sed -e 's/\"/\\"/g;s/.*/\"&\"/' "${COST_MANAGEMENT_WORKDIR}/e2e-re-run-output-${re_run_count}.txt" | awk '/Failing tests:/,EOF' | tail -n +3 | head -n -2 > $COST_MANAGEMENT_WORKDIR/failed_tests.txt
done
if [  $re_run_count -ne 0 ]; then
  echo -e "\n\ne2e summary after re-running:" >> $COST_MANAGEMENT_WORKDIR/e2e-summary.txt
  cat $COST_MANAGEMENT_WORKDIR/failed_tests.txt >> $COST_MANAGEMENT_WORKDIR/e2e-summary.txt
  cat "${COST_MANAGEMENT_WORKDIR}/e2e-re-run-output-${re_run_count}.txt" | tail -n 2 >> $COST_MANAGEMENT_WORKDIR/e2e-summary.txt
fi
