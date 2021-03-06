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

_WinWaitActivate("Au3Record","")
Send("{LWINDOWN}{LWINUP}")
_WinWaitActivate("Device Discovery","")
MouseClick("left",258,78,1)
MouseClick("left",277,166,1)
_WinWaitActivate("SVCapture","")
MouseClick("left",248,85,1)
_WinWaitActivate("Force IP address","")
MouseMove(68,322)
MouseDown("left")
MouseMove(69,321)
MouseUp("left")
_WinWaitActivate("SVCapture 1.5.3.340 for GigE kit 1.5.8 / FilterDriver - [exo304CGE-E00149 1.7.1  SN-76382]","")
MouseClick("left",1907,21,1)
#endregion --- Au3Recorder generated code End ---
