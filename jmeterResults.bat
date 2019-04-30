REM #! /bin/bash

set concurrence=%1
set duration=%2
set rampUpPeriod=%5
set resultFile=%3
set jmxPath=%4
set ResultFileDash=%6

REM set disk=C:
set jmeterExePath=%jmeterExePath%
 
 REM cd %disk%
 cd %jmeterExePath%
 
 call jmeter -Jthreads=%concurrence% -Jduration=%duration% -JrampUpPeriod=%rampUpPeriod% -n -t %jmxPath% -l %resultFile%.jtl >> %resultFile%.log -e -o %ResultFileDash%

set jmeterExtPath=%jmeterExtPath%
 
 cd %jmeterExtPath%
 
 call JMeterPluginsCMD.bat --generate-csv %resultFile%.csv --input-jtl %resultFile%.jtl --plugin-type AggregateReport

