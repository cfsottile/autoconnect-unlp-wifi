REM Create a window to run the script in background
Set WShell = CreateObject("WScript.Shell")
WShell.Run "win32-auto-connect.bat", 0

REM Create a window to alert the user of the script running
Set MsgShell = CreateObject("WScript.Shell")
MsgShell.popup "Runing...", , "Auto-Connect", 64

REM Unset all variables
set MsgShell = Nothing
Set WShell = Nothing