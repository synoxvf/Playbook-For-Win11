@echo off
:: Add .pow
reg.exe add "HKCR\.pow" /ve /t REG_SZ /d "Power Plan" /f
reg.exe add "HKCR\.pow" /v "FriendlyTypeName" /t REG_SZ /d "Power Plan" /f
reg.exe add "HKCR\.pow\DefaultIcon" /ve /t REG_EXPAND_SZ /d "%%SystemRoot%%\System32\powercfg.cpl,-202" /f
reg.exe add "HKCR\.pow\shell\Import\command" /ve /t REG_SZ /d "powercfg /import \"%%1\"" /f
:: Import
powercfg /import "%windir%\PowerPlan.pow" 00000000-0000-0000-0000-000000000000
powercfg /setactive 00000000-0000-0000-0000-000000000000
exit /b
