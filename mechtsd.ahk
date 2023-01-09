#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SysGet, Monitor, Monitor, %A_Index%
global squarect:=0, redct:=0, x1:=Round(MonitorRight/2.01469045), y1:=Round(MonitorBottom/5.02325581), x2:=x1+2, y2:=y1+355
Return

Rotate() {
    Send, {up Down}1{up Up}
}
return

newPiece() {
    PixelSearch, Px, Py, x1, y1, x2, y2, 0xC03ACE, 1, Fast
    if (ErrorLevel=0) {
        if (squarect=0 && redct>=0) {
            Rotate()
            Send {Left down}100{Left up}
            Send {Down down}100{Down up}
            Rotate()
            Send {Space down}100{Space up}
        }  else {
            Send {c down}100{c up}
        }
    }
    PixelSearch, Px, Py, x1, y1, x2, y2, 0x9EE329, 1, Fast
    if (ErrorLevel=0) {
        PixelGetColor, color, 1107, 280
        if (color="0x82B231") {
            Rotate()
            Loop, 2 {
                Send, {Left down}100{Left up}
            }
            Send {Down down}100{Down up}
            Loop, 2 {
                Send {Right down}100{Right up}
            }
            Send {Space down}100{Space up}
        } else {
            Rotate()
            Loop, 4 {
                Send, {Right down}200{Right up}
            }
            Send {Space down}100{Space up}
        }
    }
    PixelSearch, Px, Py, x1, y1, x2, y2, 0x2970E3, 1, Fast
    if (ErrorLevel=0) {
        Loop, 3 {
            Rotate()
        }
        Loop, 4 {
            Send, {Right down}100{Right up}
        }
        Send {Space down}100{Space up}
    }
    PixelSearch, Px, Py, x1, y1, x2, y2, 0xCE3A53, 1, Fast
    if (ErrorLevel=0) {
        Rotate()
        Loop, 4 {
            Send {Left down}100{Left up}
        }
        Send {Space down}100{Space up}
    }
    PixelSearch, Px, Py, x1, y1, x2, y2, 0x29BEE3, 1, Fast
    if (ErrorLevel=0) {
        if (squarect=0) {
            squarect++
            Send {Right down}1{Right up}
            Send {Down down}100{Down up}
            Sleep, 100
            Send {Right down}100{Right up}
            Send {Space down}100{Space up}
        } else {
            Send {c down}100{c up}
        }
    }
    PixelSearch, Px, Py, x1, y1, x2, y2, 0x29E39E, 1, Fast
    if (ErrorLevel=0) {
        if (squarect>0) {
            redct--
            squarect--
            Send {Right down}100{Right up}
            Send {Space down}100{Space up}
        } else {
            Send {c down}100{c up}
        }
    }
    PixelSearch, Px, Py, x1, y1, x2, y2, 0x352BE3, 1, Fast
    if (ErrorLevel=0) {
        redct++
        Rotate()
        Loop, 2 {
            Send {Left down}1{Left up}
        }
        Sleep, 200
        Send {Down down}100{Down up}
        Send {Left down}100{Left up}
        Send {Space down}100{Space up}
    }
    Sleep, 1
}
return

`::
Loop, {
    if GetKeyState("Delete", "P") {
        squarect:=0
        redct:=0
        break
    }
    newPiece()
}
return

Tab::
MouseGetPos, x, y
PixelGetColor, color, x, y
MsgBox, %color%
Return


;0xCE3A53 (blue) (maybe), 954, 219
;0x29E39E (Green)
;0x9EE329 (light blue)
;0x352BE3 (red)
;0x29BEE3 (yellow)
;0xC03ACE (tpiece)
;0x2970E3 (orange)
;1107, 280 stick lasts