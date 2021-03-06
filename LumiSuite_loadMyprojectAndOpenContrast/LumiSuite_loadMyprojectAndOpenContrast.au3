; description: todo
; author: Marcel Petrick (mail@marcelpetrick.it)
; date: 20181018
; version: 0.0
; license: GNU GENERAL PUBLIC LICENSE Version 3

;##########################################################################
;includes
#include <Date.au3>

; assign the hotkeys
HotKeySet("+y", "main") ; go go go
HotKeySet("+x", "togglePause") ; freeze!
HotKeySet("+c", "harvestMissions") ; just for testing the harvest missions functionality
HotKeySet("{F5}", "quitScript") ; stop, come back home!

; time-settings
Global Const $sleepingTime = 200;
Global Const $logFunctionCall = True ;False True; determines if the entry of a function is logged to StdErr

; body: scripts sleeps before triggering the real functionality
While 1
   Sleep($sleepingTime)
WEnd

; brief: interupts and exits script
Func quitScript()
   logCall("quitScript()")
   Exit
EndFunc

; brief: put the script to sleep if the static var is set
Func togglePause()
   logCall("togglePause()")
   Static Local $isPaused = False ; helper for the pause-functionality: exists only once - "static"
   $isPaused = Not $isPaused ; toggle
   While $isPaused
	  Sleep($sleepingTime)
   WEnd
EndFunc

; brief: write current string to StdErr if globally enabled
Func logCall(ByRef Const $string)
   If ($logFunctionCall) Then
	  ConsoleWrite($string & " @ " & _NowTime(5) & @CRLF)
	  ;ConsoleWrite($string & " " & _NowTime(5) & "; ")
   EndIf
EndFunc
;##########################################################################

#region --- Au3Recorder generated code Start (v3.3.9.5 KeyboardLayout=00000407)  ---

#region --- Internal functions Au3Recorder Start ---
Func _Au3RecordSetup()
   logCall("_Au3RecordSetup()")
   Opt('WinWaitDelay',100)
   Opt('WinDetectHiddenText',1)
   Opt('MouseCoordMode',0)
   Local $aResult = DllCall('User32.dll', 'int', 'GetKeyboardLayoutNameW', 'wstr', '')
   If $aResult[1] <> '00000407' Then
	  MsgBox(64, 'Warning', 'Recording has been done under a different Keyboard layout' & @CRLF & '(00000407->' & $aResult[1] & ')')
   EndIf
EndFunc

Func _WinWaitActivate($title,$text,$timeout=0)
   logCall("_WinWaitActivate(): title=" & $title & ": text=" & $text & ": timeout=" & $timeout)
   WinWait($title,$text,$timeout)
   If Not WinActive($title,$text) Then WinActivate($title,$text)
   WinWaitActive($title,$text,$timeout)
EndFunc

_AU3RecordSetup()
#endregion --- Internal functions Au3Recorder End ---

; brief: check for LS and load the project
Func main()
   logCall("main()")

   ; activate the window
   ; todo: how to move to coordinates from the second monitor?

   _WinWaitActivate("LumiSuite","", 10)
EndFunc

Func foo()
   ;MouseClick("left",24,41,1)
   MouseClick("left",46,85,1)
   _WinWaitActivate("Load file","", 10)
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
EndFunc
#endregion --- Au3Recorder generated code End ---
