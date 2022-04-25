@echo off
@REM for /f "tokens=1-8 delims=," %%A in (User_Info.csv) do md %%D
for /f "tokens=1-8 delims=," %%A in (User_Info.csv) do xcopy /E /C /J /S /q /i /K /D /H /Y User2 %%D


@REM for /f "tokens=1-8 delims=," %%F in (User_Info.csv) do xcopy User2 %E% /E /C /J /S /q /i /K /D /H /Y