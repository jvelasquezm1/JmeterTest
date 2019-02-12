import os
import sys
import time


#python <pythonFile> <binJmeter> <paramsFile> <jmxFile> <script.sh>
#python /home/richar_amador/performance/assessmentServices/scripts/handler.py /home/richar_amador/performance/apache-jmeter-4.0/bin/jmeter /home/richar_amador/performance/assessmentServices/datasets/params.txt /home/richar_amador/performance/assessmentServices/scripts/getAssessmentDetail.jmx /home/richar_amador/performance/assessmentServices/scripts/jmeterResults.sh

paramsLoaded = []


def main():
    if not paramsOk(sys.argv):
        sys.exit()
    paramsFile = sys.argv[2]
    loadTestParams(paramsFile)
    startTestSuite()


def paramsOk(params):
    if len(params) < 5:
        print("Too few params, 4 expected " + str(len(params)-1) + " given")
        return False
    elif len(params) > 5:
        print("Too many params, 4 expected. " + str(len(params)-1) + " given")
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


def createResultsDir(concurrency, duration):
    userHome = os.getenv("HOME")
    pathToDesktop = userHome + "/performance/Results/"
    date = time.ctime(time.time())
    formatedDate = date.replace(" ", "_").replace(":", ".")
    folderName = "%s%s_c%s_d%s_%s" % (pathToDesktop, "Test", concurrency,
        duration,formatedDate)
    os.mkdir(folderName)
    return folderName


def startTestSuite():
    jmeterBin = sys.argv[1]
    JMXFile = sys.argv[3]
    batFile = sys.argv[4] + " "
    for keyVal in paramsLoaded:
        concurrency, duration = keyVal
        dirName = createResultsDir(concurrency, duration)
        ResultFile = dirName + "/result"    
        command = "%s %s %s %s %s" % (batFile, concurrency, duration,
            ResultFile, JMXFile) 
        p = os.system(command)
        p.read()  
        msg = "Test for Jthread=%s and Jduration=%s ... done" % (concurrency,
            duration)
        print(msg)

main()