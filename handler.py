import os
import sys
import time
import json


# python <pythonFile> <bin_jmeter> <params_file> <jmx_file> <script.bat>

# Reading concurrence, duration and ramp up parameters from params.txt
def main():
    if not params_ok(sys.argv):
        sys.exit()
    os.system("node " + os.path.join(".", "JSONParser", "index.js"))
    os.chdir("..")
    params_file = os.path.join(sys.argv[2], "utils", "Params.json")
    params_loaded = load_test_params(params_file)
    start_test_suite(params_loaded)


# Verifying that the number of parameter match with the expected
def params_ok(params):
    if len(params) < 7:
        print("Too few params, 6 expected " + str(len(params) - 1) + " given")
        return False
    elif len(params) > 7:
        print("Too many params, 6 expected. " + str(len(params) - 1) + " given")
        return False
    return True


# Setting number of execution of the cycle
def load_test_params(params_file):
    with open(params_file, "r") as paramsJson:
        datastore = json.load(paramsJson)
        return datastore


# Creating the folders to save the each execution results
def create_results_dir(script_name, concurrency, duration_loops):
    results_path = sys.argv[4]
    date = time.ctime(time.time())
    formatted_date = date.replace(" ", "_").replace(":", ".")
    folder_name = "%s%s%s%s%s%s%s" % (results_path, formatted_date, script_name, "_c", concurrency, "_d", duration_loops)
    if not os.path.exists(folder_name):
        os.mkdir(folder_name)
    return folder_name


# Creating parameters to jmeter_results script (jmeterResults2.bat)
def start_test_suite(params_loaded):
    bat_file = sys.argv[3] + " "
    for data in params_loaded["params"]:
        duration_loops = data["duration_loops"]
        d_type = data["d_type"]
        concurrency = data["concurrency"]
        ramp_up_period = data["rampup"]
        protocol = data["protocol"]
        serverTest = data["serverTest"]
        apiKey = data["apiKey"]
        internalServer = data["internalServer"]
        jmx_file = sys.argv[5] + data["script"]
        dir_name = create_results_dir(data["script"], concurrency, duration_loops)
        path_name = os.path.split(jmx_file)
        file_name = path_name[-1].split(".")
        result_file = os.path.join(dir_name, file_name[0] + "_c" + concurrency + "_d" + duration_loops)
        result_file_dash = os.path.join(dir_name, concurrency)
        command = "%s %s %s %s %s %s %s %s %s %s %s %s" % (
            bat_file, concurrency, duration_loops, result_file, jmx_file, ramp_up_period, result_file_dash, d_type,
            protocol, serverTest, apiKey, internalServer)
        os.system(command)
        msg = "Test for Jthread=%s and Jduration=%s ... done" % (concurrency, duration_loops)
        if(data["script"].lower().find("deletedassessmentresult") == -1):
            print(msg)
        else:
            scriptName = data["script"].replace(".jmx", "")
            dataIn = os.path.join(sys.argv[6],"Projects","FLEX","FLEX_ASSESSMENT_SERVICES","Data","dataIn"+scriptName[0].upper()+scriptName[1:]+"_1"+".csv")
            dataOut = os.path.join(sys.argv[6],"Projects","FLEX","FLEX_ASSESSMENT_SERVICES","Data","dataOut"+scriptName[0].upper()+scriptName[1:]+"_1"+".csv")
            os.system("node " + os.path.join(".", "utils", "JSONParser", "newDataIn.js") + " " + dataIn + " " + dataOut)
            print("Data In updated")
            print(msg)
   
main()
