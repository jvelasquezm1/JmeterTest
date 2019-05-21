#! /bin/bash

dir=$PWD
cd ..
parent=$PWD
cd ..
workspace=$PWD
cd ..
cd ..
cd ..
projects=$PWD
cd Projects/FLEX/FLEX_ASSESSMENT_SERVICES/EXECUTION_SUITE/utils

#Files
handlerPython=${dir}'/handler4.py'
jmeter=${JMETER_HOME}'/bin/jmeter'
params=${parent}
jmxRoute=${workspace}'/SCRIPTS/Windows/'
jmetersh=${dir}'/jmeterResults.sh'
resultsFolder=${workspace}'/Results/'

#Execute python command
python ${handlerPython} ${jmeter} ${params} ${jmetersh} ${resultsFolder} ${jmxRoute} ${projects}
