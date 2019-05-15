#! /bin/bash

concurrence=$1
duration_loops=$2
resultFile=$3
jmxPath=$4
rampUpPeriod=$5
ResultFileDash=$6
jmeterExePath=${JMETER_HOME}'/bin/'
jmeterExtPath=${JMETER_HOME}'/lib/ext/'

cd ..
cd Results

if [ "$yourVariable" = "test" ]
then
    ${jmeterExePath}jmeter -Jthreads=${concurrence} -Jduration=${duration_loops} -JrampUpPeriod=${rampUpPeriod} -n -t ${jmxPath} -l ${resultFile}.jtl >> ${resultFile}.log -e -o ${ResultFileDash}
else
    ${jmeterExePath}jmeter -Jthreads=${concurrence} -Jloops=${duration_loops} -JrampUpPeriod=${rampUpPeriod} -n -t ${jmxPath} -l ${resultFile}.jtl >> ${resultFile}.log -e -o ${ResultFileDash}
fi 

${jmeterExtPath}JMeterPluginsCMD.sh --generate-csv ${resultFile}.csv --input-jtl ${resultFile}.jtl --plugin-type AggregateReport
