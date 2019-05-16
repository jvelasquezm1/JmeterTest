#! /bin/bash

dir=${PWD}
cd ..
parent=${PWD}
cd EXECUTION_SUITE

#Files
handlerPython=${dir}'/utils/handler.py'
jmeter=${JMETER_HOME}'/bin/jmeter'
params=${dir}'/Params.json'
jmxRoute=${parent}'/SCRIPTS/Windows/'
jmetersh=${dir}'/utils/jmeterResults.sh'
resultsFolder=${parent}'/Results/'

#Execute python command
python ${handlerPython} ${jmeter} ${params} ${jmetersh} ${resultsFolder} ${jmxRoute} ${dir}
