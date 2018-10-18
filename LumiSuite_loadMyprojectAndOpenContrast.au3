#region --- Au3Recorder generated code Start (v3.3.9.5 KeyboardLayout=00000407)  ---

#region --- Internal functions Au3Recorder Start ---
Func _Au3RecordSetup()
Opt('WinWaitDelay',100)
Opt('WinDetectHiddenText',1)
Opt('MouseCoordMode',0)
Local $aResult = DllCall('User32.dll', 'int', 'GetKeyboardLayoutNameW', 'wstr', '')
If $aResult[1] <> '00000407' Then
  MsgBox(64, 'Warning', 'Recording has been done under a different Keyboard layout' & @CRLF & '(00000407->' & $aResult[1] & ')')
EndIf

EndFunc

Func _WinWaitActivate($title,$text,$timeout=0)
	WinWait($title,$text,$timeout)
	If Not WinActive($title,$text) Then WinActivate($title,$text)
	WinWaitActive($title,$text,$timeout)
EndFunc

_AU3RecordSetup()
#endregion --- Internal functions Au3Recorder End ---

_WinWaitActivate("LumiSuite","")
MouseClick("left",24,41,1)
MouseClick("left",46,85,1)
_WinWaitActivate("Load file","")
MouseClick("left",128,392,1)
Send("mypro")
MouseClick("left",156,405,1)
MouseClick("left",615,385,1)
_WinWaitActivate("LumiSuite - [myproject]","")
MouseClick("left",942,143,1)
_WinWaitActivate("Program Manager","")
_WinWaitActivate("classname=Shell_TrayWnd","")
MouseClick("left",1716,18,1)
_WinWaitActivate("classname=NotifyIconOverflowWindow","")
MouseClick("left",724,102,1)
_WinWaitActivate("Program Manager","")
MouseClick("left",2381,1183,1)
_WinWaitActivate("LumiSuite - [myproject]","")
MouseClick("left",1829,12,1)
#endregion --- Au3Recorder generated code End ---
