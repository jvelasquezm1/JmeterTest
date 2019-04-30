
rem Step1: Creting workspace

REM Global
SETX dirBase %cd%
SETX data \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\Data\
SETX results \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\Results\
SETX jmeterScripts \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\SCRIPTS\Windows\
SETX executionSuite \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\EXECUTION_SUITE\
SETX jmeterExePath %JMETER_HOME%\bin\
SETX jmeterExtPath %JMETER_HOME%\lib\ext\

REM Local
SET dirBase %cd%
SET data \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\Data\
SET results \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\Results\
SET jmeterScripts \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\SCRIPTS\Windows\
SET executionSuite \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\EXECUTION_SUITE\
SET jmeterExePath %JMETER_HOME%\bin\
SET jmeterExtPath %JMETER_HOME%\lib\ext\

REM Step 2: Creating folders
MKDIR %dirBase%%data%
MKDIR %dirBase%%results%
MKDIR %dirBase%%jmeterScripts%
MKDIR %dirBase%%executionSuite%

SETX DATA_JSCRIPTS %dirBase%%data%
SETX RESULT_JSCRIPTS %dirBase%%results%

SET DATA_JSCRIPTS %dirBase%%data%
SET RESULT_JSCRIPTS %dirBase%%results%

REM Step 3: Creating files
SET executionSuiteZip=%dirBase%/executionSuite.zip
SET jmeterScriptsZip=%dirBase%/jmeterScripts.zip
SET dataZip=%dirBase%/data.zip

PowerShell Expand-Archive -Path %executionSuiteZip% -DestinationPath %dirBase%%executionSuite%

PowerShell Expand-Archive -Path %jmeterScriptsZip% -DestinationPath %dirBase%%jmeterScripts%

PowerShell Expand-Archive -Path %dataZip% -DestinationPath %DATA_JSCRIPTS%
