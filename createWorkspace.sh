#!/bin/bash
# Step1: Creting workspace

# Global
rootProjects='Projects/FLEX/FLEX_ASSESSMENT_SERVICES/'
data=${rootProjects}'Data/'
results=${rootProjects}'Results/'
jmeterScripts=${rootProjects}'SCRIPTS/Windows/'
executionSuite=${rootProjects}'EXECUTION_SUITE/'

# Step 2: Creating folders
mkdir -p ${data}
mkdir -p ${results}
mkdir -p ${jmeterScripts}
mkdir -p ${executionSuite}

# Step 3: Creating files
executionSuiteZip=executionSuite.zip
jmeterScriptsZip=jmeterScripts.zip
dataZip=data.zip

unzip ${executionSuiteZip} -d ${executionSuite}
unzip ${jmeterScriptsZip} -d ${jmeterScripts}
unzip ${dataZip} -d ${data}
