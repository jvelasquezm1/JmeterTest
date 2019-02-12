import os
import sys
import time

paramsLoaded = []

def main():
    if not paramsOk(sys.argv):
        sys.exit()
    paramsFile = sys.argv[2]
    loadTestParams(paramsFile)
    startTestSuite()

def paramsOk(params):
    if len(params) < 6:
        print("Too few params, 5 expected " + str(len(params)-1) + " given")
        return False
    elif len(params) > 6:
        print("Too many params, 5 expected. " + str(len(params)-1) + " given")
        return False
    return True

def loadTestParams(paramsFile):
    with open(paramsFile,"r") as f:
        line = f.readline()
        while(line):
            line = line.strip("\n")
            if line and not line.startswith("#") :
                paramsLoaded.append(line.split(","))
            line = f.readline()

def createResultsDir(concurrency, duration, jmxFile):
    pathName = jmxFile.split("/")
    fileName = pathName[-1].split(".")
    userHome = os.getenv("HOME")
    resultsPath = sys.argv[5]
    pathToDesktop = userHome + resultsPath
    date = time.ctime(time.time())
    formatedDate = date.replace(" ", "_").replace(":", ".")
    folderName = "%s%s_c%s_d%s_%s" % (pathToDesktop, fileName[0], concurrency,
        duration,formatedDate)
    os.mkdir(folderName)
    return folderName

def startTestSuite():
    jmeterBin = sys.argv[1]
    JMXFile = sys.argv[3]
    batFile = sys.argv[4] + " "
    for keyVal in paramsLoaded:
        concurrency, duration = keyVal
        dirName = createResultsDir(concurrency, duration, JMXFile)
        ResultFile = dirName + "/result"    
        command = "%s %s %s %s %s" % (batFile, concurrency, duration,
            ResultFile, JMXFile) 
        p = os.system(command)
        msg = "Test for Jthread=%s and Jduration=%s ... done" % (concurrency,
            duration)
        print(msg)

main()