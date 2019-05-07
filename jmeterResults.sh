#! /bin/bash

concurrence=$1
duration=$2
resultFile=$3
jmxPath=$4
rampUpPeriod=$5
ResultFileDash=$6
jmeterExePath=${JMETER_HOME}'/bin/'
jmeterExtPath=${JMETER_HOME}'/lib/ext/'

${jmeterExePath}jmeter -Jthreads=${concurrence} -Jduration=${duration} -JrampUpPeriod=${rampUpPeriod} -n -t ${jmxPath} -l ${resultFile}.jtl >> ${resultFile}.log -e -o ${ResultFileDash}

${jmeterExtPath}JMeterPluginsCMD.sh --generate-csv ${resultFile}.csv --input-jtl ${resultFile}.jtl --plugin-type AggregateReport
