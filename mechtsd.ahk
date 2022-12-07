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
    PixelGetColor, color, 954, 219
    if (color="0xC03ACE") {
        if (squarect=0) {
            Rotate()
            Send {Left down}200{Left up}
            Send {Down down}200{Down up}
            Rotate()
            Send {Space down}200{Space up}
        }  else {
            Send {c down}200{c up}
        }
    }
    if (color="0x9EE329") {
        Rotate()
        Loop, 4 {
            Send, {Right down}200{Right up}
        }
        Send {Space down}200{Space up}
    }
    if (color="0x2970E3") {
        Loop, 3 {
            Rotate()
        }
        Loop, 4 {
            Send, {Right down}200{Right up}
        }
        Send {Space down}200{Space up}
    }
    if (color="0xCE3A53") {
        Rotate()
        Loop, 4 {
            Send {Left down}200{Left up}
        }
        Send {Space down}200{Space up}
    }
    if (color="0x29BEE3") {
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
    if (color="0x29E39E") {
        if (squarect>0) {
            squarect--
            Send {Right down}200{Right up}
            Send {Space down}200{Space up}
        } else {
            Send {c down}200{c up}
        }
    }
    if (color="0x352BE3") {
        Rotate()
        Loop, 2 {
            Send {Left down}200{Left up}
        }
        Send {Down down}200{Down up}
        Send {Left down}200{Left up}
        Send {Space down}200{Space up}
    }
    Sleep, 200
}
return

`::
Loop, {
    if GetKeyState("Delete", "P")
        break
    newPiece()
}
return


;0xCE3A53 (blue) (maybe), 954, 219
;0x29E39E (Green)
;0x9EE329 (light blue)
;0x352BE3 (red)
;0x29BEE3 (yellow)
;0xC03ACE (tpiece)
;0x2970E3 (orange)