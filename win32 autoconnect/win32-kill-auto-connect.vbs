REM Create a window to run the script in background
Set WShell = CreateObject("WScript.Shell")
WShell.Run "TASKKILL /F /IM cmd.exe /T", 0

REM Create a window to alert the user of the script running
Set MsgShell = CreateObject("WScript.Shell")
MsgShell.popup "Auto-Connect killed", , "Auto-Connect", 64

REM Unset all variables
set MsgShell = Nothing
Set WShell = Nothing