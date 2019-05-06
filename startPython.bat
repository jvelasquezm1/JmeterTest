

rem set dirBase=%cd%
REM #Route Here you can set the paths according your machine directories
set workSpace=%dirBase%
REM Path of the suite of scripts to configure the cycles of executions
set executionSuite=%executionSuite%
REM Path of jmeter.bat
set jmeterPath=%jmeterExePath%
REM Path of scripts of jmeter to execute (.jmx files)
set jmeterScripts=%jmeterScripts%
REM Path to save the result of cycle executions
set executionResultsPath=%results%

REM Python parameters
set handlerPython=%workSpace%%executionSuite%handler4.py
set jmeter=%jmeterPath%
set params=%workSpace%%executionSuite%Params.xlsx
set jmxRoute=%workSpace%%jmeterScripts%
set jmetersh=%workSpace%%executionSuite%jmeterResults2.bat
set resultsFolder=%workSpace%%executionResultsPath%

REM Execute python command
python %handlerPython% %jmeter% %params% %jmetersh% %resultsFolder% %jmxRoute%
