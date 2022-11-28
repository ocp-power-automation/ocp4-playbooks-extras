!#/bin/sh

re_run_count=0
max_re_run=3

echo -e "\ne2e summary:" > $FIO_WORKDIR/e2e-summary.txt
cat "${FIO_WORKDIR}/fio-e2e-output.txt" | tail -n 2 >> $FIO_WORKDIR/e2e-summary.txt
sed -e 's/\"/\\"/g;s/.*/\"&\"/' "${FIO_WORKDIR}/fio-e2e-output.txt" | awk '/Failing tests:/,EOF' | tail -n +3 | head -n -2 > $FIO_WORKDIR/failed_tests.txt

while [ $re_run_count -lt $max_re_run ] && [ "0" -ne "$(wc -l < "${FIO_WORKDIR}/failed_tests.txt")" ]
do
  re_run_count=$(( $re_run_count + 1 ))
  ./bin/extended-platform-tests run -f $FIO_WORKDIR/failed_tests.txt -o $FIO_WORKDIR/fio-e2e-re-run-output-${re_run_count}.txt
  sed -e 's/\"/\\"/g;s/.*/\"&\"/' "${FIO_WORKDIR}/fio-e2e-re-run-output-${re_run_count}.txt" | awk '/Failing tests:/,EOF' | tail -n +3 | head -n -2 > $FIO_WORKDIR/failed_tests.txt
done

if [  $re_run_count -ne 0 ]; then
  echo -e "\ne2e summary after re-running:" >> $FIO_WORKDIR/e2e-summary.txt
  cat "${FIO_WORKDIR}/failed_tests.txt" >> $FIO_WORKDIR/e2e-summary.txt
  cat "${FIO_WORKDIR}/fio-e2e-re-run-output-${re_run_count}.txt" | tail -n 2 >> $FIO_WORKDIR/e2e-summary.txt
fi
