
rem step1: creting work space

SETX  dirBase %cd%
::SETX dirBase C:\Ensayo
SETX   data \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\Data\
SETX   results \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\Results\
SETX   jmeterScripts \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\SCRIPTS\Windows\
SETX   executionSuite \Projects\FLEX\FLEX_ASSESSMENT_SERVICES\EXECUTION_SUITE\
SETX   jmeterExePath %JMETER_HOME%\bin\
SETX   jmeterExtPath %JMETER_HOME%\lib\ext\



rem ECHO %dirBase%%data%
rem ECHO %dirBase%%results%
rem ECHO %dirBase%%jmeterScripts%
rem ECHO %dirBase%%executionScripts%
rem echo %executionSuiteZip%


rem MKDIR %dirBase%%data%
rem MKDIR %dirBase%%results%
rem MKDIR %dirBase%%jmeterScripts%
rem MKDIR %dirBase%%executionSuite%

rem SETX   DATA_JSCRIPTS %dirBase%%data%
rem SETX   RESULT_JSCRIPTS %dirBase%%results%

