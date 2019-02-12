#! /bin/bash

concurrence=$1
duration=$2
resultFile=$3
jmxPath=$4

${jmeterRoute}/jmeter -Jthreads=${concurrency} -Jduration=${duration} -n -t ${jmxPath} -l ${resultFile}.jtl >> ${resultFile}.log

${cmdRoute}/JMeterPluginsCMD.sh --generate-csv ${resultFile}.csv --input-jtl ${resultFile}.jtl --plugin-type AggregateReport
