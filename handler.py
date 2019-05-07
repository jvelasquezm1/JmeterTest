import os
import sys
import time
import pandas as pd
import numpy

#python <pythonFile> <binJmeter> <paramsFile> <jmxFile> <script.bat>

#Reading concurrence, duration and ramp up paramneters from params.txt
def main():
    if not paramsOk(sys.argv):
        sys.exit()
    paramsFile = sys.argv[2]
    paramsLoaded = loadTestParams(paramsFile)
    startTestSuite(paramsLoaded)

#Verifying that the number of parameter match with the expected 
def paramsOk(params):
    if len(params) < 6:
        print("Too few params, 5 expected " + str(len(params)-1) + " given")
        return False
    elif len(params) > 6:
        print("Too many params, 5 expected. " + str(len(params)-1) + " given")
        return False
    return True

#Setting number of execution of the cycle
def loadTestParams(paramsFile):
    df = pd.read_excel(paramsFile, sheet_name='Sheet1')
    return df

#Creating bthe folders to save the each execution results
def createResultsDir(scriptName, concurrency):
    resultsPath = sys.argv[4]
    date = time.ctime(time.time())
    formatedDate = date.replace(" ", "_").replace(":", ".")
    folderName = "%s%s%s%s" % (resultsPath, formatedDate, scriptName, concurrency)
    os.mkdir(folderName)
    return folderName

# Creatring parameters to jmeterResults script (jmeterResults2.bat)	
def startTestSuite(paramsLoaded):
	
    jmeterBin = sys.argv[1]
    batFile = sys.argv[3] + " "
    for index, row in paramsLoaded.iterrows():
        if(row['Total Duration'] == row['Total Duration']):
            duration = str(row['Total Duration'])
            concurrency = str(row['Concurrence Users'])
            rampUpPeriod = str(row['Ramp-Up'])
            JMXFile = sys.argv[5]+str(row['Jmeter Script'])
            dirName = createResultsDir(str(row['Jmeter Script']), concurrency)
            pathName = os.path.split(JMXFile)
            fileName = pathName[-1].split(".")
            ResultFile = os.path.join(dirName, fileName[0] + "_c" + concurrency + "_d" + duration)
            ResultFileDash = os.path.join(dirName, concurrency)
            command = "%s %s %s %s %s %s %s" % (batFile, concurrency, duration, ResultFile, JMXFile, rampUpPeriod, ResultFileDash) 
            p = os.system(command)
            msg = "Test for Jthread=%s and Jduration=%s ... done" % (concurrency,duration)
            print(msg)

main()
