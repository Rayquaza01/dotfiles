SendMode Input
#NoEnv
#InstallKeybdHook
#InstallMouseHook
SetNumLockState, AlwaysOn
;SetCapsLockState, AlwaysOff
^!SPACE::
WinGet, ExStyle, ExStyle, A
if (ExStyle & 0x8)
{
  WinSet,AlwaysOnTop,off,A
  ToolTip,Disabled
}
else
{
  WinSet,AlwaysOnTop,on,A
  ToolTip,Enabled
}
Sleep,2000
ToolTip
F9:: send {Media_Prev}
F10:: send {Media_Play_Pause}
F11:: send {Media_Next}
F7:: send {Volume_Down}
F8:: send {Volume_Up}
F6:: send {Volume_Mute}
^0:: send {Home}
^+4:: send {End}
^+h:: send {Home}
^+l:: send {End}
;^+0:: MouseMove,0,0
^+w:: send !{F4}
!RCtrl::AppsKey
^RAlt::AppsKey
^+0::AppsKey
