vsim +access+r;
run -all;
acdb save;
acdb report -db fcover.acdb -txt -o cov.txt -verbose
exec cat cov.txt;
exit

  // this file is used for format report
  // turn on use run.do tcl file below tool
