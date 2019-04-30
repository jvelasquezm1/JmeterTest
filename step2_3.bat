
set executionSuiteZip=%dirBase%/executionSuite.zip
set jmeterScriptsZip=%dirBase%/jmeterScripts.zip
set dataZip=%dirBase%/data.zip

PowerShell Expand-Archive -Path %executionSuiteZip% -DestinationPath %dirBase%%executionSuite%

PowerShell Expand-Archive -Path %jmeterScriptsZip% -DestinationPath %dirBase%%jmeterScripts%

PowerShell Expand-Archive -Path %dataZip% -DestinationPath %DATA_JSCRIPTS%

::PowerShell Expand-Archive -Path "C:\Ensayo2\EXECUTION_SUITE.zip" -DestinationPath "C:\Ensayo2\Projects\FLEX\FLEX_ASSESSMENT_SERVICES\EXECUTION_SUITE"