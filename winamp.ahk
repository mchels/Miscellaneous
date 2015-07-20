; Global hotkeys for winamp
; http://www.autohotkey.com/docs/misc/Winamp.htm
; Full ref of winamp key codes:
; http://www.autohotkey.com/forum/topic126.html

; Hotkeys have the structure
;   <modifiers and keys>::
        ; SendMessage <something>
        ; ControlSend <something different>
        ; return
; The SendMessage line sends the key code (e.g., 40046  to winamp).
; The ControlSend line sends a literal keypress (e.g., c to winamp).
; I've included both here if one of them breaks at some point.

#WinActivateForce

SetTitleMatchMode 2

DetectHiddenText, On
DetectHiddenWindows, On

#IfWinExists ahk_class Winamp v1.x
    ; Play/Pause
    ^!z::
        ; Determine playback status by sending 104.
        SendMessage, 0x400,0,104,,ahk_class Winamp v1.x
        if (errorlevel = 1 or errorlevel = 3)
        {
            ; Winamp is playing or paused. Do 40046: Pause/unpause
            SendMessage, 0x111,40046,,,ahk_class Winamp v1.x
        }
        else if errorlevel = 0
        {
            ; Winamp is stopped. Do 40045: Play.
            SendMessage, 0x111,40045,,,ahk_class Winamp v1.x
        }
        return

    ; Stop
    ^!x::
        SendMessage, 0x111, 40047, , ,ahk_class Winamp v1.x
        ; ControlSend, ahk_parent, v
        return

    ; Previous track
    ^!a::
        SendMessage, 0x111, 40044, , ,ahk_class Winamp v1.x
        ; ControlSend, ahk_parent, z
        return

    ; Next track
    ^!s::
        SendMessage, 0x111, 40048, , ,ahk_class Winamp v1.x
        ; ControlSend, ahk_parent, b
        return

    ; Increase volume, ctrl-alt-up
    ^!Up::
        SendMessage, 0x111, 40058, , ,ahk_class Winamp v1.x
        SendMessage, 0x111, 40058, , ,ahk_class Winamp v1.x
        ; {up} doesn't seem to work below.
        ; ControlSend, ahk_parent, {up}
        return

    ; Decrease volume, ctrl-alt-down
    ^!Down::
        SendMessage, 0x111, 40059, , ,ahk_class Winamp v1.x
        SendMessage, 0x111, 40059, , ,ahk_class Winamp v1.x
        ; {down} doesn't seem to work below.
        ; ControlSend, ahk_parent, {down}
        return

    ; Fast-forward 5 seconds, ctrl-alt-right
    ^!Right::
        SendMessage, 0x111, 40148, , ,ahk_class Winamp v1.x
        ; ControlSend, ahk_parent, {right}
        return

    ; Fast-rewind 5 seconds, ctrl-alt-left
    ^!Left::
        SendMessage, 0x111, 40144, , ,ahk_class Winamp v1.x
        ; ControlSend, ahk_parent, {left}
        return

    ; ; Toggle main window visible, win-½
    ; #½::
        ; IfWinActive, Winamp
        ; {
            ; ; WinHide ahk_class BaseWindow_RootWnd
            ; ; WinMinimize
            ; ; WinMinimize Winamp
            ; ; WinHide Winamp
            ; ; PostMessage, 0x112, 0xF020,,, Winamp, ; 0x112 = WM_SYSCOMMAND, 0xF020 = SC_MINIMIZE
        ; }
        ; else
        ; {
            ; WinActivate Winamp
        ; }
        ; ; WinActivate, ahk_parent
        ; ; WinShow, ahk_parent
        ; ; SendMessage, 0x111, 40258, , ,ahk_class Winamp v1.x
        ; ; Doesn't exist as literal key.
        ; ; ControlSend, ahk_parent, v
        ; return
