Numpad0::
Click, Down
Loop
{
    Sleep, 10 ;
    GetKeyState, state, Numpad0, P ;
    if state = U
        break
} 
Click, Up
return
Numpad1::
Click, Down
Loop
{
    Sleep, 10 ;
    GetKeyState, state, Numpad1, P ;
    if state = U
        break
}
Click, Up
return
Numpad2::
Click, Down
Loop
{
    Sleep, 10 ;
    GetKeyState, state, Numpad2, P ;
    if state = U
        break
} 
Click, Up
return
Numpad3::
Click, Down Right
Loop
{
    Sleep, 10 ;
    GetKeyState, state, Numpad3, P ;
    if state = U
        break
}
Click, Up Right
return
NumpadDot::
Click, Down Right
Loop
{
    Sleep, 10 ;
    GetKeyState, state, NumpadDot, P ;
    if state = U
        break
}
Click, Up Right
return
Numpad8::
MouseClick, Middle, , , 1
return
Numpad4::
Loop
{
    MouseClick, WheelDown, , , 3 ;
    Sleep, 10 ;
    GetKeyState, state, Numpad4, P ;
    if state = U
        break
}
return
Numpad7::
Loop
{
    MouseClick, WheelUp, , , 3 ;
    Sleep, 10 ;
    GetKeyState, state, Numpad7, P ;
    if state = U
        break
}
return
Numpad6::
Loop
{
    MouseClick, WheelDown, , , 3 ;
    Sleep, 10 ;
    GetKeyState, state, Numpad6, P ;
    if state = U
        break
}
return
Numpad9::
Loop
{
    MouseClick, WheelUp, , , 3 ;
    Sleep, 10 ;
    GetKeyState, state, Numpad9, P ;
    if state = U
        break
}
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
