; Detect NumLock
#if (GetKeyState("NumLock", "T"))
#n::
MsgBox, 0, NumLock, NumPad is ON, 0.5
return
#if !(GetKeyState("NumLock", "T"))
#n::
MsgBox, 0, NumLock, NumPad is OFF, 0.5
return
#if
; Others
Numpad0::
Click, left, D
Loop{
    Sleep, 10
}Until !GetKeyState("Numpad0", "P")
Click, left, U
return
Numpad1::
Click, left, D
Loop{
    Sleep, 10
}Until !GetKeyState("Numpad1", "P")
Click, left, U
return
Numpad2::
Click, left, D
Loop{
    Sleep, 10
}Until !GetKeyState("Numpad2", "P")
Click, left, U
return
Numpad3::
Click, right, D
Loop{
    Sleep, 10
}Until !GetKeyState("Numpad3", "P")
Click, right, U
return
NumpadDot::
Click, right, D
Loop{
    Sleep, 10
}Until !GetKeyState("NumpadDot", "P")
Click, right, U
return
Numpad5::
Click, middle, D
Loop{
    Sleep, 10
}Until !GetKeyState("Numpad5", "P")
Click, middle, U
return
Numpad8::
Send, ^{Click Left}
return
Numpad4::
Loop{
    Click, WheelDown, 1
        Sleep, 10
}Until !GetKeyState("Numpad4", "P")
return
Numpad7::
Loop{
    Click, WheelUp, 1
        Sleep, 10
}Until !GetKeyState("Numpad7", "P")
return
Numpad6::
Loop{
    Click, WheelDown, 1
        Sleep, 10
}Until !GetKeyState("Numpad6", "P")
return
Numpad9::
Loop{
    Click, WheelUp, 1
        Sleep, 10
}Until !GetKeyState("Numpad9", "P")
return
![::
Loop{
    Send, {Volume_Down}
    Sleep, 10
}Until !GetKeyState("![", "P")
return
<^>![::
Loop{
    Send, {Volume_Down}
    Sleep, 10
}Until !GetKeyState("<^>![", "P")
return
!]::
Loop{
    Send, {Volume_Up}
    Sleep, 10
}Until !GetKeyState("!]", "P")
return
<^>!]::
Loop{
    Send, {Volume_Up}
    Sleep, 10
}Until !GetKeyState("<^>!]", "P")
return
!m::
Send, {Volume_Mute}
return
<^>!m::
Send, {Volume_Mute}
return
!p::
Send, {Media_Play_Pause}
return
<^>!p::
Send, {Media_Play_Pause}
return
!,::
Send, {Media_Prev}
return
<^>!,::
Send, {Media_Prev}
return
!.::
Send, {Media_Next}
return
<^>!.::
Send, {Media_Next}
return
#b::
Run, "<path_to_bat_file>"
return
!i::
Send, {Esc}
return
<^>!i::
Send, {Esc}
return
!c::
Send, {Delete}
return
<^>!c::
Send, {Delete}
return
#h::Suspend
return
#q::ExitApp
return
*F10::ExitApp
