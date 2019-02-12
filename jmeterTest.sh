#! /bin/bash

concurrence=$1
duration=$2
resultFile=$3
jmxPath=$4

/home/richar_amador/performance/apache-jmeter-4.0/bin/jmeter -Jthreads=${concurrency} -Jduration=${duration} -n -t ${jmxPath} -l ${resultFile}.jtl >> ${resultFile}.log

/home/richar_amador/performance/apache-jmeter-4.0/bin/JMeterPluginsCMD.sh --generate-csv ${resultFile}.csv --input-jtl ${resultFile}.jtl --plugin-type AggregateReport
