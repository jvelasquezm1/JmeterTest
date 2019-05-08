
REM Step1: Creting workspace

REM Global
SETX dirBase %cd%
SETX data \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\Data\
SETX results \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\Results\
SETX jmeterScripts \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\SCRIPTS\Windows\
SETX executionSuite \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\EXECUTION_SUITE\
SETX jmeterExePath %JMETER_HOME%\bin\
SETX jmeterExtPath %JMETER_HOME%\lib\ext\

REM Local
SET dirBase_=%cd%
SET data_=\Projects\FLEX\FLEX_ASSESSMENT_SERVICES\Data\
SET results_=\Projects\FLEX\FLEX_ASSESSMENT_SERVICES\Results\
SET jmeterScripts_=\Projects\FLEX\FLEX_ASSESSMENT_SERVICES\SCRIPTS\Windows\
SET executionSuite_=\Projects\FLEX\FLEX_ASSESSMENT_SERVICES\EXECUTION_SUITE\
SET jmeterExePath_=%JMETER_HOME%\bin\
SET jmeterExtPath_=%JMETER_HOME%\lib\ext\

REM Step 2: Creating folders
MKDIR %dirBase_%%data_%
MKDIR %dirBase_%%results_%
MKDIR %dirBase_%%jmeterScripts_%
MKDIR %dirBase_%%executionSuite_%

SETX DATA_JSCRIPTS %dirBase_%%data_%
SETX RESULT_JSCRIPTS %dirBase_%%results_%

SET DATA_JSCRIPTS_=%dirBase_%%data_%
SET RESULT_JSCRIPTS_=%dirBase_%%results_%

REM Step 3: Creating files
SET executionSuiteZip_=%dirBase_%/executionSuite.zip
SET jmeterScriptsZip_=%dirBase_%/jmeterScripts.zip
SET dataZip_=%dirBase_%/data.zip

PowerShell Expand-Archive -Path %executionSuiteZip_% -DestinationPath %dirBase_%%executionSuite_%

PowerShell Expand-Archive -Path %jmeterScriptsZip_% -DestinationPath %dirBase_%%jmeterScripts_%

PowerShell Expand-Archive -Path %dataZip_% -DestinationPath %DATA_JSCRIPTS_%
