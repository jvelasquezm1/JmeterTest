REM #! /bin/bash

set concurrence=%1
set duration_loops=%2
set rampUpPeriod=%5
set resultFile=%3
set jmxPath=%4
set ResultFileDash=%6
set types=%7

REM set disk=C:
set jmeterExePath=%jmeterExePath%
 
REM cd %disk%
cd %jmeterExePath%

IF "%types%"="Duration" (
    call jmeter -Jthreads=%concurrence% -Jduration=%duration_loops% -JrampUpPeriod=%rampUpPeriod% -n -t %jmxPath% -l %resultFile%.jtl >> %resultFile%.log -e -o %ResultFileDash%
) ELSE (
    call jmeter -Jthreads=%concurrence% -Jloops=%duration_loops% -JrampUpPeriod=%rampUpPeriod% -n -t %jmxPath% -l %resultFile%.jtl >> %resultFile%.log -e -o %ResultFileDash%
)

set jmeterExtPath=%jmeterExtPath%

cd %jmeterExtPath%

call JMeterPluginsCMD.bat --generate-csv %resultFile%.csv --input-jtl %resultFile%.jtl --plugin-type AggregateReport

