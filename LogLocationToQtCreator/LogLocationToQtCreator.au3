; description: au3-script opens UDP-port-listener, which reacts to packages containing file-path and line-number. Then aactivate the first found QtCreator-window (if multiple), then send CTRL+K as short-cut, then insert the message-text, then ENTER.
; And then the QtCreator-editor-window shall jump to the respective location, which was given by the LogViewer.
;
; author: Marcel Petrick (mail@marcelpetrick.it)
; date: 20190828
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

; brief: check for QtCreator
Func main()
   logCall("main()")

   ; activate the window

   ;WinWaitActive("[CLASS:Qt5QWindowIcon]","", 3) ; maybe check with a RegExp?
   Opt("WinTitleMatchMode",2)
   WinActivate("Qt Creator")

   logCall("found QtCreator :)")

   ; check this for further hints_ https://autoit.de/index.php?thread/32818-udp-tutorial/
   logCall("open UDP port")

;---------------
$g_IP = "127.0.0.1" ; eigene IP-Addresse


UDPStartup() ;startet den UDP-Service


$aSocket = UDPBind($g_IP, 65432) ; Öffnet einen Socket mit der IP $g_IP und dem Port 65432
; $aSocket ist genauso aufgebaut wie das Array von UDPOpen()
; $aSocket[1]: real socket
; $aSocket[2]: IP des Servers
; $aSocket[3]: Port des Servers
If @error Then Exit
While 1
$aData = UDPRecv($aSocket, 128, 2) ;empfängt Daten von einem Client
;durch das Flag 2 wird folgendes Array ausgegeben:
; $aData[0]: data
; $aData[1]: IP des Clients
; $aData[2]: Port des Clients


If $aData <> "" Then ; wenn Daten empfangen werden
MsgBox(0, "SERVER", "Daten vom Client erhalten:"&@CRLF&$aData[0]) ; Ausgabe der empfangenen Daten

Local $aClientArray[4] = [$aSocket[0], $aSocket[1], $aData[1], $aData[2]]


UDPSend($aClientarray, $aData[0]) ; Sendet die gleichen Daten zurück an den Client
EndIf
Sleep(100)
WEnd
;---------------





EndFunc
