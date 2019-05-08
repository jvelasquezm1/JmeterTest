#! /bin/bash

dir=${PWD}
cd ..
parent=${PWD}
cd EXECUTION_SUITE

#Files
handlerPython=${dir}'/handler.py'
jmeter=${JMETER_HOME}'/bin/jmeter'
params=${dir}'/Params.json'
jmxRoute=${parent}'/SCRIPTS/Windows/'
jmetersh=${dir}'/jmeterResults.sh'
resultsFolder=${parent}'/Results/'

#Execute python command
python ${handlerPython} ${jmeter} ${params} ${jmetersh} ${resultsFolder} ${jmxRoute}
