#! /bin/bash

concurrence=$1
duration_loops=$2
resultFile=$3
jmxPath=$4
rampUpPeriod=$5
ResultFileDash=$6
types=$7
protocol=$8
serverTest=$9
apiKey=${10}
internalServer=${11}
jmeterExePath=${JMETER_HOME}'/bin/'
jmeterExtPath=${JMETER_HOME}'/lib/ext/'

cd ..
cd Results

set -x
${jmeterExePath}jmeter -Jthreads=${concurrence} -Jduration=${duration_loops} -Jprotocol=${protocol} -JserverTest=${serverTest} -Japikey=${apiKey} -JinternalServer=${internalServer}  -JrampUpPeriod=${rampUpPeriod} -Jjmeter.reportgenerator.overall_granularity=10000 -n -t ${jmxPath} -l ${resultFile}.jtl >> ${resultFile}.log -e -o ${ResultFileDash}

# ${jmeterExtPath}JMeterPluginsCMD.sh --generate-csv ${resultFile}.csv --input-jtl ${resultFile}.jtl --plugin-type AggregateReport
