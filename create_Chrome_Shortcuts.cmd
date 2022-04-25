@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "tokens=1-8 delims=," %%A in (User_Info.csv) do (
set userid=%%B
set usernm=%%C %%C

echo Set oWS = WScript.CreateObject^( "WScript.Shell" ^) > CreateShortcut.vbs
echo sLinkFile ^= "%userprofile%\Desktop\!usernm!.lnk" >> CreateShortcut.vbs
echo Set oLink ^= oWS.CreateShortcut^(sLinkFile^) >> CreateShortcut.vbs
echo oLink.TargetPath ^= "C:\Progra~2\Google\Chrome\Application\chrome.exe" >> CreateShortcut.vbs
echo oLink.Arguments ^= "--user-data-dir=C:\Users\Administrator\AppData\Local\Google\Chrome\!userid!" >> CreateShortcut.vbs
echo oLink.WorkingDirectory ^= "C:\Progra~2\Google\Chrome\Application\" >> CreateShortcut.vbs
echo oLink.Description ^= "!usernm! Chrome" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
)
endlocal