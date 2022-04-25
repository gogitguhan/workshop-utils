@echo off
set /a cnt=-1
setlocal ENABLEDELAYEDEXPANSION
for /f "tokens=1-6 delims=," %%A in (User_Info.csv) do (
set /a cnt=cnt+1
@REM echo on
echo. >>automation.properties
echo ##Creating MDM User for !cnt! - %%C %%D >>automation.properties

echo MDM.new.user.firstname!cnt!=%%C>>automation.properties
echo MDM.new.user.middlename!cnt!=>>automation.properties
echo MDM.new.user.lastname!cnt!=%%D>>automation.properties
echo MDM.new.user.username!cnt!=%%B>>automation.properties
echo MDM.new.user.password!cnt!=%%B1>>automation.properties
echo MDM.new.user.email!cnt!=%%A>>automation.properties
echo MDM.new.user.isExternalAuthentication!cnt!=N>>automation.properties
echo MDM.new.user.isAdministrator!cnt!=Y>>automation.properties

echo MDM.user_ors_rel.username!cnt!=%%B>>automation.properties
echo MDM.user_ors_rel.databaseIds!cnt!=orcl-TCR_HUB_NEW>>automation.properties

echo MDM.user_roles_rel.username!cnt!=%%B>>automation.properties
echo MDM.user_roles_rel.roles!cnt!=%%E>>automation.properties
echo MDM.user_roles_rel.databaseId!cnt!=orcl-TCR_HUB_NEW>>automation.properties
echo MDM.delete.user.username!cnt!=%%B>>automation.properties
)
echo. >>automation.properties

set /a cnt=cnt+1
echo MDM.number.of.new.users=!cnt!>>automation.properties
echo MDM.number.of.user_ors_relationships=!cnt!>>automation.properties
echo MDM.number.of.user_roles_relationships=!cnt!>>automation.properties
echo MDM.number.of.delete.users=!cnt!>>automation.properties
echo. >>automation.properties
echo ##Done >>automation.properties

@REM call AcquireReleaseLock.cmd

@REM call CreateUsers.cmd
@REM call AssignUsersToDatabases.cmd
@REM call AssignRolesToUser.cmd
@REM call AcquireReleaseLock.cmd
@REM call DeleteUsers.cmd

endlocal