; description: see README.md
;
; author: Marcel Petrick (mail@marcelpetrick.it)
; date: 20200306
; version: 0.0
; license: GNU GENERAL PUBLIC LICENSE Version 3

;##########################################################################
;includes
#include <Date.au3>

; assign the hotkeys
HotKeySet("+y", "main") ; go go go: Shift+Y
HotKeySet("+x", "togglePause") ; freeze! : Shift+X
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

; brief: TODO
Func main()
   logCall("main()")

   ; activate the window
   logCall("reached the main - triggered by Shift & ypsilon")


   logCall("end of main()")
EndFunc
