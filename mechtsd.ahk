#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

global squarect:=0
Return

Rotate() {
    Send, {up Down}200{up Up}
}
return

newPiece() {
    PixelSearch, Px, Py, 953, 215, 955, 570, 0xC03ACE, 1, Fast
    if (ErrorLevel=0) {
        if (squarect=0) {
            Rotate()
            Send {Left down}200{Left up}
            Sleep, 100
            Send {Down down}200{Down up}
            Rotate()
            Send {Space down}200{Space up}
        }  else {
            Send {c down}200{c up}
        }
    }
    PixelSearch, Px, Py, 953, 215, 955, 570, 0x9EE329, 1, Fast
    if (ErrorLevel=0) {
        PixelGetColor, corcolor, 1107, 280
        if (corcolor="0x82B231") {
            Rotate()
            Loop, 2 {
                Send, {Left down}200{Left up}
            }
            Send {Down down}200{Down up}
            Loop, 2 {
                Send {Right down}200{Right up}
            }
            Send {Space down}200{Space up}
        } else {
            Rotate()
            Loop, 4 {
                Send, {Right down}200{Right up}
            }
            Send {Space down}200{Space up}
        }
    }
    PixelSearch, Px, Py, 953, 215, 955, 570, 0x2970E3, 1, Fast
    if (ErrorLevel=0) {
        Loop, 3 {
            Rotate()
        }
        Loop, 4 {
            Send, {Right down}200{Right up}
        }
        Send {Space down}200{Space up}
    }
    PixelSearch, Px, Py, 953, 215, 955, 570, 0xCE3A53, 1, Fast
    if (ErrorLevel=0) {
        Rotate()
        Loop, 4 {
            Send {Left down}200{Left up}
        }
        Send {Space down}200{Space up}
    }
    PixelSearch, Px, Py, 953, 215, 955, 570, 0x29BEE3, 1, Fast
    if (ErrorLevel=0) {
        if (squarect=0) {
            squarect++
            Send {Right down}200{Right up}
            Send {Down down}200{Down up}
            Send {Right down}200{Right up}
            Send {Space down}200{Space up}
        } else {
            Send {c down}200{c up}
        }
    }
    PixelSearch, Px, Py, 953, 215, 955, 570, 0x29E39E, 1, Fast
    if (ErrorLevel=0) {
        if (squarect>0) {
            squarect--
            Send {Right down}200{Right up}
            Send {Space down}200{Space up}
        } else {
            Send {c down}200{c up}
        }
    }
    PixelSearch, Px, Py, 953, 215, 955, 570, 0x352BE3, 1, Fast
    if (ErrorLevel=0) {
        Rotate()
        Loop, 2 {
            Send {Left down}200{Left up}
        }
        Send {Down down}200{Down up}
        Send {Left down}200{Left up}
        Send {Space down}200{Space up}
    }
    Sleep, 100
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


;0xCE3A53 (blue) (maybe), 954, 219
;0x29E39E (Green)
;0x9EE329 (light blue)
;0x352BE3 (red)
;0x29BEE3 (yellow)
;0xC03ACE (tpiece)
;0x2970E3 (orange)
;1107, 280 stick lasts