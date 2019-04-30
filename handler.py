import os
import sys
import time

#python <pythonFile> <binJmeter> <paramsFile> <jmxFile> <script.bat>

#Loading python paramneters
paramsLoaded = []

#Reading concurrence, duration and ramp up paramneters from params.txt
def main():
    if not paramsOk(sys.argv):
        sys.exit()
    paramsFile = sys.argv[2]
    loadTestParams(paramsFile)
    startTestSuite()

#Verifying that the number of parameter match with the expected 
def paramsOk(params):
    if len(params) < 7:
        print("Too few params, 6 expected " + str(len(params)-1) + " given")
        return False
    elif len(params) > 7:
        print("Too many params, 6 expected. " + str(len(params)-1) + " given")
        return False
    return True

#Setting number of execution of the cycle
def loadTestParams(paramsFile):
    with open(paramsFile,"r") as f:
        line = f.readline()
        while(line):
            line = line.strip("\n")
            if line and not line.startswith("#") :
                paramsLoaded.append(line.split(","))
            line = f.readline()

#Creating bthe folders to save the each execution results
def createResultsDir():
    resultsPath = sys.argv[5]
    scriptName = sys.argv[6]
    date = time.ctime(time.time())
    formatedDate = date.replace(" ", "_").replace(":", ".")
    folderName = "%s%s%s" % (resultsPath, formatedDate, scriptName)
    os.mkdir(folderName)
    return folderName

# Creatring parameters to jmeterResults script (jmeterResults2.bat)	
def startTestSuite():
	
    jmeterBin = sys.argv[1]
    JMXFile = sys.argv[3]
    batFile = sys.argv[4] + " "
    pathName = JMXFile.split("\\") 
	    
    fileName = pathName[-1].split(".")
    dirName = createResultsDir()
    for keyVal in paramsLoaded:
        concurrency, duration, rampUpPeriod = keyVal
        ResultFile = dirName + "\\" + fileName[0] + "_c" + concurrency + "_d" + duration
        ResultFileDash = dirName + "\\" + concurrency + "\\"
        command = "%s %s %s %s %s %s %s" % (batFile, concurrency, duration,ResultFile, JMXFile, rampUpPeriod, ResultFileDash) 
        p = os.system(command)
        msg = "Test for Jthread=%s and Jduration=%s ... done" % (concurrency,duration)
        print(msg)

main()
