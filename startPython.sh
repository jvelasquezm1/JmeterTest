#! /bin/bash

#Route
services=/performance/assessmentServices/

#Files
handlerPython=${HOME}${services}scripts/handler2.py
jmeter=${HOME}/performance/apache-jmeter-4.0/bin/jmeter
params=${HOME}${services}datasets/params.txt
jmxFile=${HOME}${services}scripts/getAssessmentDetail.jmx
jmetersh=${HOME}${services}scripts/jmeterResults.sh
resultsFolder=${services}results/

#Execute python command
python ${handlerPython} ${jmeter} ${params} ${jmxFile} ${jmetersh} ${resultsFolder}
