#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global squarect:=0
Return

Rotate() {
    Send, {up Down}100{up Up}
}
return

newPiece() {
    PixelSearch, Px, Py, 953, 215, 955, 570, 0xBD36CF, 1, Fast
    if (ErrorLevel=0) {
        if (squarect=0) {
            Rotate()
            Send {Left down}100{Left up}
            Sleep, 100
            Send {Down down}100{Down up}
            Rotate()
            Send {Space down}100{Space up}
        }  else {
            Send {c down}100{c up}
        }
    }
    PixelSearch, Px, Py, 953, 215, 955, 570, 0xA0E42B, 1, Fast
    if (ErrorLevel=0) {
        PixelGetColor, color, 1107, 280
        if (color="0x83B233") {
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
    PixelSearch, Px, Py, 953, 215, 955, 570, 0x3476E0, 1, Fast
    if (ErrorLevel=0) {
        Loop, 3 {
            Rotate()
        }
        Loop, 4 {
            Send, {Right down}100{Right up}
        }
        Send {Space down}100{Space up}
    }
    PixelSearch, Px, Py, 953, 215, 955, 570, 0xCB2B5F, 1, Fast
    if (ErrorLevel=0) {
        Rotate()
        Loop, 4 {
            Send {Left down}100{Left up}
        }
        Send {Space down}100{Space up}
    }
    PixelSearch, Px, Py, 953, 215, 955, 570, 0x3AC0DE, 1, Fast
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
    PixelSearch, Px, Py, 953, 215, 955, 570, 0x3CE599, 1, Fast
    if (ErrorLevel=0) {
        if (squarect>0) {
            squarect--
            Send {Right down}100{Right up}
            Send {Space down}100{Space up}
        } else {
            Send {c down}100{c up}
        }
    }
    PixelSearch, Px, Py, 953, 215, 955, 570, 0x3B39E0, 1, Fast
    if (ErrorLevel=0) {
        Rotate()
        Loop, 2 {
            Send {Left down}1{Left up}
        }
        Send {Down down}50{Down up}
        Sleep, 250
        Send {Left down}100{Left up}
        Send {Space down}100{Space up}
    }
    Sleep, 1
}
return

`::
Loop, {
    if GetKeyState("Delete", "P")
        break
    newPiece()
}
return

!^z::
squarect:=0
return


;0xCB2B5F (blue) (maybe), 954, 219
;0x3CE599 (Green)
;0xA0E42B (light blue)
;0x3B39E0 (red)
;0x3AC0DE (yellow)
;0xBD36CF (tpiece)
;0x3476E0 (orange)
;1107, 280 stick lasts