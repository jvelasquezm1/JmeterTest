REM #! /bin/bash

set concurrence=%1
set duration_loops=%2
set rampUpPeriod=%5
set resultFile=%3
set jmxPath=%4
set ResultFileDash=%6
set types=%7
set protocol=%8
set serverTest=%9
shift
set apiKey=%9
shift
set internalServer=%9

REM set disk=C:
set jmeterExePath=%jmeterExePath%
 
REM cd %disk%
cd %jmeterExePath%

call jmeter -Jthreads=%concurrence% -Jduration=%duration_loops% -Jprotocol=%protocol% -JserverTest=%serverTest% -Japikey=%apiKey% -JinternalServer=%internalServer% -JrampUpPeriod=%rampUpPeriod% -Jjmeter.reportgenerator.overall_granularity=10000 -n -t %jmxPath% -l %resultFile%.jtl >> %resultFile%.log -e -o %ResultFileDash%

REM set jmeterExtPath=%jmeterExtPath%

REM cd %jmeterExtPath%

REM call JMeterPluginsCMD.bat --generate-csv %resultFile%.csv --input-jtl %resultFile%.jtl --plugin-type AggregateReport

