;START OF CONFIG SECTION

#SingleInstance force
#MaxHotkeysPerInterval 500

; Using the keyboard hook to implement the Numpad hotkeys prevents
; them from interfering with the generation of ANSI characters such
; as ?  This is because AutoHotkey generates such characters
; by holding down ALT and sending a series of Numpad keystrokes.
; Hook hotkeys are smart enough to ignore such keystrokes.
#UseHook

MouseSpeed = 8
MouseAccelerationSpeed = 2
MouseMaxSpeed = 20

;Mouse wheel speed is also set on Control Panel. As that
;will affect the normal mouse behavior, the real speed of
;these three below are times the normal mouse wheel speed.
MouseWheelSpeed = 1
MouseWheelAccelerationSpeed = 5
MouseWheelMaxSpeed = 36
magnifier = 0
MousePosX := A_ScreenWidth/2
MousePosY := A_ScreenHeight/2

FlagSlow = 0
TranslateOn = 0
NumLockComboVal = -1

;END OF CONFIG SECTION

;This is needed or key presses would faulty send their natural
;actions. Like NumpadDiv would send sometimes "/" to the
;screen.       
#InstallKeybdHook

Temp = 0
Temp2 = 0.66667
tarray_x := [0,0,0]
tarray_y := [0,0,0]
ttop = 0

movecheck = 0
cntButton = 0

MouseCurrentAccelerationSpeed = 0
MouseCurrentSpeed = %MouseSpeed%

MouseWheelCurrentAccelerationSpeed = 0
MouseWheelCurrentSpeed = %MouseSpeed%

SetKeyDelay, -1
SetMouseDelay, -1

Hotkey, *NumpadEnter, ButtonEnter
Hotkey, *NumpadEnter up, ButtonEnteru
Hotkey, *NumpadDiv, ButtonDiv
Hotkey, *NumpadMult, ButtonMult
	
Hotkey, *NumpadIns, ButtonLeftClick
Hotkey, *Numpad0, ButtonMiddleClick
Hotkey, *NumpadDel, ButtonRightClick
	
Hotkey, *Numpad8, ButtonArrowUp
Hotkey, *Numpad2, ButtonArrowDown
Hotkey, *Numpad4, ButtonArrowLeft
Hotkey, *Numpad6, ButtonArrowRight
Hotkey, *Numpad8 up, ButtonArrowUpu
Hotkey, *Numpad2 up, ButtonArrowDownu
Hotkey, *Numpad4 up, ButtonArrowLeftu
Hotkey, *Numpad6 up, ButtonArrowRightu
Hotkey, *^Numpad6, ButtonMediaNext
Hotkey, *^Numpad4, ButtonMediaPrev
Hotkey, *Numpad7, ButtonBrightnessUp
Hotkey, *Numpad1, ButtonBrightnessDown
Hotkey, *Numpad9, ButtonVolumeUp
Hotkey, *Numpad3, ButtonVolumeDown
Hotkey, *Numpad5, ButtonMediaPlayPause
Hotkey, *!Numpad5,ButtonMagnifierToggle
	
Hotkey, *NumpadUp, ButtonUp
Hotkey, *NumpadDown, ButtonDown
Hotkey, *NumpadRight, ButtonRight
Hotkey, *NumpadLeft, ButtonLeft
Hotkey, *NumpadClear, ButtonSlow
Hotkey, *NumpadHome, ButtonStep
Hotkey, *NumpadEnd, ButtonStepSlow
Hotkey, *+NumpadHome, ButtonHome
Hotkey, *+NumpadEnd, ButtonEnd
Hotkey, *^NumpadHome, ButtonPageUp
Hotkey, *^NumpadEnd, ButtonPageDown
Hotkey, *NumpadPgUp, ButtonWheelUp
Hotkey, *NumpadPgDn, ButtonWheelDown
	
Hotkey, *NumpadSub, ButtonShift
Hotkey, *NumpadAdd, ButtonCtrl
Hotkey, *NumpadDot, ButtonAlt
Hotkey, *NumpadSub up, ButtonShiftu
Hotkey, *NumpadAdd up, ButtonCtrlu
Hotkey, *NumpadDot up, ButtonAltu

Gosub, ~ScrollLock  ; Initialize based on current ScrollLock state.
return

;Key activation support

NumLock & NumpadEnter::
Send {ScrollLock}
Gosub, ~ScrollLock  ; Initialize based on current ScrollLock state.
return

~ScrollLock::
; Wait for it to be released because otherwise the hook state gets reset
; while the key is down, which causes the up-event to get suppressed,
; which in turn prevents toggling of the ScrollLock state/light:
KeyWait, ScrollLock
GetKeyState, ScrollLockState, ScrollLock, T
If ScrollLockState = D
{
	Hotkey, *NumpadEnter, Off
	Hotkey, *NumpadEnter up, Off
	Hotkey, *NumpadDiv, Off
	Hotkey, *NumpadMult, Off
		
	Hotkey, *NumpadIns, Off
	Hotkey, *Numpad0, Off
	Hotkey, *NumpadDel, Off
		
	Hotkey, *Numpad8, Off
	Hotkey, *Numpad2, Off
	Hotkey, *Numpad4, Off
	Hotkey, *Numpad6, Off
	Hotkey, *Numpad8 up, Off
	Hotkey, *Numpad2 up, Off
	Hotkey, *Numpad4 up, Off
	Hotkey, *Numpad6 up, Off
	Hotkey, *^Numpad6,Off
	Hotkey, *^Numpad4, Off
	Hotkey, *Numpad7, Off
	Hotkey, *Numpad1,  Off
	Hotkey, *Numpad9, Off
	Hotkey, *Numpad3, Off
	Hotkey, *Numpad5,Off
	Hotkey, *!Numpad5,Off
		
	Hotkey, *NumpadUp, Off
	Hotkey, *NumpadDown, Off
	Hotkey, *NumpadRight, Off
	Hotkey, *NumpadLeft, Off
	Hotkey, *NumpadClear, Off
	Hotkey, *NumpadHome, Off
	Hotkey, *NumpadEnd, Off
	Hotkey, *+NumpadHome, Off
	Hotkey, *+NumpadEnd, Off
	Hotkey, *^NumpadHome, Off
	Hotkey, *^NumpadEnd, Off
	Hotkey, *NumpadPgUp, Off
	Hotkey, *NumpadPgDn, Off
		
	Hotkey, *NumpadSub, Off
	Hotkey, *NumpadAdd, Off
	Hotkey, *NumpadDot, Off
	Hotkey, *NumpadSub up, Off
	Hotkey, *NumpadAdd up, Off
	Hotkey, *NumpadDot up, Off
}
else
{
	Hotkey, *NumpadEnter, On
	Hotkey, *NumpadEnter up, On
	Hotkey, *NumpadDiv, On
	Hotkey, *NumpadMult, On
		
	Hotkey, *NumpadIns, On
	Hotkey, *Numpad0, On
	Hotkey, *NumpadDel, On
		
	Hotkey, *Numpad8, On
	Hotkey, *Numpad2, On
	Hotkey, *Numpad4, On
	Hotkey, *Numpad6, On
	Hotkey, *Numpad8 up, On
	Hotkey, *Numpad2 up, On
	Hotkey, *Numpad4 up, On
	Hotkey, *Numpad6 up, On
	Hotkey, *^Numpad6,On
	Hotkey, *^Numpad4, On
	Hotkey, *Numpad7, On
	Hotkey, *Numpad1,  On
	Hotkey, *Numpad9, On
	Hotkey, *Numpad3, On
	Hotkey, *Numpad5,On
	Hotkey, *!Numpad5,On
		
	Hotkey, *NumpadUp, On
	Hotkey, *NumpadDown, On
	Hotkey, *NumpadRight, On
	Hotkey, *NumpadLeft, On
	Hotkey, *NumpadClear, On
	Hotkey, *NumpadHome, On
	Hotkey, *NumpadEnd, On
	Hotkey, *+NumpadHome, On
	Hotkey, *+NumpadEnd, On
	Hotkey, *^NumpadHome, On
	Hotkey, *^NumpadEnd, On
	Hotkey, *NumpadPgUp, On
	Hotkey, *NumpadPgDn, On
		
	Hotkey, *NumpadSub, On
	Hotkey, *NumpadAdd, On
	Hotkey, *NumpadDot, On
	Hotkey, *NumpadSub up, On
	Hotkey, *NumpadAdd up, On
	Hotkey, *NumpadDot up, On
}
CoordMode, Mouse, Screen
MouseGetPos, MousePosX, MousePosY
return

Hotkey, *NumpadSub, ButtonShift
Hotkey, *NumpadAdd, ButtonCtrl
Hotkey, *NumpadDot, ButtonAlt

*Backspace::
	sub := GetKeyState("NumpadSub", "P")
	add := GetKeyState("NumpadAdd", "P")
	dot := GetKeyState("NumpadDot", "P")
    if (sub && !add && !dot)
        Send +{Tab}            ; 仅按下 NumpadSub => Shift+Tab
    else if (add && !sub && !dot)
        Send ^{Tab}            ; 仅按下 NumpadAdd => Ctrl+Tab
    else if (sub && add && !dot)
        Send ^+{Tab}           ; 同时按下 NumpadSub 和 NumpadAdd => Ctrl+Shift+Tab
    else if (dot && !sub && !add)
        Send !{Tab}            ; 仅按下 NumpadDot => Alt+Tab
    else if (add && dot && !sub)
        Send ^!{Tab}           ; 同时按下 NumpadAdd 和 NumpadDot => Ctrl+Alt+Tab
    else if (sub && dot && !add)
        Send +!{Tab}           ; 同时按下 NumpadSub 和 NumpadDot => Shift+Alt+Tab
    else if (sub && add && dot)
		Send ^+!{Tab}          ; 三个同时按下 => Ctrl+Shift+Alt+Tab
	else
        Send {Backspace}       ; 默认行为，原样发送 Backspace
return

revertNumLock:
NumLockComboVal := 1
Sleep 10
NumLockState := GetKeyState("NumLock", "T")  ; 获取当前 Num Lock 键的状态
if (NumLockState) {
    SetNumLockState, Off  ; 如果 Num Lock 键是开启状态，则关闭它
} else {
    SetNumLockState, On   ; 如果 Num Lock 键是关闭状态，则打开它
}
return

NumLock & Tab::
NumLock & Backspace::
send #{Tab}
if( NumLockComboVal = -1 )
	Gosub revertNumLock
return

NumLock & NumpadMult::
;ButtonWinRight:
Send ^#{Right}
if( NumLockComboVal = -1 )
	Gosub revertNumLock
return

NumLock & NumpadDiv::
;ButtonWinLeft:
Send ^#{Left}
if( NumLockComboVal = -1 )
	Gosub revertNumLock
return

ButtonEnter:
If !GetKeyState("NumLock", "T")
	Goto ButtonSpace
else
	SetKeyDelay, -1
	Send {Blind}{Enter DownR}
	return
ButtonEnteru:
If !GetKeyState("NumLock", "T")
	Goto ButtonSpaceu
else
	SetKeyDelay, -1
	Send {Blind}{Enter up}
	return
ButtonDiv:
If !GetKeyState("NumLock", "T")
	If GetKeyState("NumpadAdd", "P")
		Goto CloseTab
	else
		Goto Translate
else
	Goto ScreenShot
ButtonMult:
If !GetKeyState("NumLock", "T")
	If GetKeyState("NumpadAdd", "P")
		If GetKeyState("NumpadSub", "P")
			Goto OpenPreviousTab
		else
			Goto NewTab
	else
		Goto TranslateRead
else
	Goto ScreenShotRec

ButtonCtrl:
SetKeyDelay, -1
Send {Blind}{Ctrl DownR}
return
ButtonCtrlu:
SetKeyDelay, -1
Send {Blind}{Ctrl up}
return
ButtonShift:
SetKeyDelay, -1
Send {Blind}{Shift DownR}
return
ButtonShiftu:
SetKeyDelay, -1
Send {Blind}{Shift up}
return
ButtonAlt:
SetKeyDelay, -1
Send {Blind}{Alt DownR}
return
ButtonAltu:
SetKeyDelay, -1
Send {Blind}{Alt up}
return
ButtonSpace:
SetKeyDelay, -1
Send {Blind}{Space DownR}
return
ButtonSpaceu:
SetKeyDelay, -1
Send {Blind}{Space up}
return

~NumLock::
tip := GetKeyState("NumLock", "T")

if (tip) {
    tooltipText := "ARROW"
} else {
    tooltipText := "MOVE"
}
Tooltip, NumLock = %tip% %tooltipText%

KeyWait, NumLock
NumLockComboVal := -1
Tooltip
FlagSlow = 0
SetTimer, ButtonAccelerationEnd, Off
return


;!a::
;WinGetClass, class, A
;WinGetTitle, Title, A
;MsgBox, The active window is "%Title%". `n The active window's class is "%class%".
;*!a::
;CoordMode, Mouse, Screen
;MouseGetPos, xpos, ypos
;msgbox %MousePosX% - %xpos%/%A_ScreenWidth% %MousePosY% - %ypos%/%A_ScreenHeight%
;return

; CUSTOM 1
Translate:
Send ^!8
SetKeyDelay, -1
Send {Blind}{Ctrl up}
Send {Blind}{Alt up}
TranslateOn := 1-TranslateOn
If TranslateOn = 0
	Tooltip, Translate OFF
else
	Tooltip, Translate ON
SetTimer, RemoveToolTip, 800
return
; CUSTOM 2
TranslateRead:
Send !v
SetKeyDelay, -1
Send {Blind}{Alt up}
Tooltip, Voice
SetTimer, RemoveToolTip, 800
return
CloseTab:
Send ^w
SetKeyDelay, -1
Send {Blind}{Ctrl up}
Tooltip, CloseTab
SetTimer, RemoveToolTip, 800
return
OpenPreviousTab:
Send ^+t
SetKeyDelay, -1
Send {Blind}{Shift up}
Send {Blind}{Ctrl up}
Tooltip, OpenPreviousTab
SetTimer, RemoveToolTip, 800
return
NewTab:
Send ^t
SetKeyDelay, -1
Send {Blind}{Ctrl up}
Tooltip, NewTab
SetTimer, RemoveToolTip, 800
return
; CUSTOM 3
ScreenShot:
Send {PrintScreen}
Tooltip, ScreenShot
SetTimer, RemoveToolTip, 800
return
; CUSTOM 4
ScreenShotRec:
Send #+s
SetKeyDelay, -1
Send {Blind}{Win up}
Send {Blind}{Shift up}
return

ButtonLeftClick:
	if GetKeyState("LButton", "P")
		return
	SendEvent, {Blind}{LButton down}
	KeyWait, NumpadIns   ; 等待 NumpadIns 键释放
	SendEvent, {Blind}{LButton up}
return
	
ButtonMiddleClick:
	if GetKeyState("MButton", "P")
		return
	SendEvent, {Blind}{MButton down}
	KeyWait, Numpad0    ; 等待 Numpad0 键释放
	SendEvent, {Blind}{MButton up}
return
	
ButtonRightClick:
	if GetKeyState("RButton", "P")
		return
	SendEvent, {Blind}{RButton down}
	KeyWait, NumpadDel   ; 等待 NumpadDel 键释放
	SendEvent, {Blind}{RButton up}
return

;Mouse movement support

ButtonUp:
ButtonDown:
ButtonLeft:
ButtonRight:
If cntButton = 0
{
	MouseCurrentAccelerationSpeed = 0
	MouseCurrentSpeed = %MouseSpeed%
	CoordMode, Mouse, Screen
	MouseGetPos, MousePosX, MousePosY
	movecnt = 0
	movecheck = 0
}
cntButton = 1
	
ButtonAccelerationStart:
movecnt += 1
if movecnt >= 20
{
	MouseGetPos, MousePosX, MousePosY
	movecnt = 0
	movecheck = 0
}
If MouseMaxSpeed > %MouseCurrentSpeed%
{
	Temp = 0.001
	Temp *= %MouseAccelerationSpeed%
	MouseCurrentAccelerationSpeed += %Temp%
	MouseCurrentSpeed += %MouseCurrentAccelerationSpeed%
}
	
MouseTrueSpeed := MouseCurrentSpeed
If FlagSlow = 1
	MouseTrueSpeed := (MouseCurrentSpeed-8)/2+2
MouseCurrentSpeedX = 0
MouseCurrentSpeedY = 0
If GetKeyState("NumpadUp", "P")
	MouseCurrentSpeedY -= MouseTrueSpeed
If GetKeyState("NumpadDown", "P")
	MouseCurrentSpeedY += MouseTrueSpeed
If GetKeyState("NumpadLeft", "P")
	MouseCurrentSpeedX -= MouseTrueSpeed
If GetKeyState("NumpadRight", "P")
	MouseCurrentSpeedX += MouseTrueSpeed
MouseMove, %MouseCurrentSpeedX%, %MouseCurrentSpeedY%, 0, R
SetTimer, ButtonAccelerationEnd, 10
return
	
ButtonAccelerationEnd:
If !GetKeyState("NumLock", "T")
{
	If GetKeyState("NumpadUp", "P")
		Goto ButtonAccelerationStart
	If GetKeyState("NumpadDown", "P")
		Goto ButtonAccelerationStart
	If GetKeyState("NumpadLeft", "P")
		Goto ButtonAccelerationStart
	If GetKeyState("NumpadRight", "P")
		Goto ButtonAccelerationStart
}
SetTimer, ButtonAccelerationEnd, Off
cntButton = 0
return

ButtonSlow:
gosub FlagSlowFalse
Loop
{
	sleep, 10
	state:=GetKeyState("NumpadClear","P")
	if(state=0)
	{
		break
	}
	if(A_TimeSinceThisHotkey>80)
	{
		break
	}
}
if(state=0) ;短按
{
	count:=1
	Loop
	{
		KeyWait, NumpadClear, D T0.15 ;等待下一次,0.4s超时
		if (ErrorLevel=1) ;没等到
		{
			if(count>=2)
			{
				gosub FlagSlowTrue
			}
			break
		}
		else ;等到了
		{
			KeyWait, NumpadClear
			count++
		}
	}
}
else ;长按
{
	gosub FlagSlowTrue
	KeyWait, NumpadClear ;这句不能删
	gosub FlagSlowFalse
}
return
FlagSlowTrue:
FlagSlow = 1
ToolTip,+
return
FlagSlowFalse:
FlagSlow = 0
Tooltip
return

ButtonStep:
Gosub CheckMove
MouseGetPos, xpos, ypos
ttop = 3
Loop, 3
{
	i := A_Index
	tarray_x[i] := xpos, tarray_y[i] := ypos
	Gosub StartStepCalc
	if (xpos = tarray_x[i] && ypos = tarray_y[i])
	{
		ttop := i-1
		break
	}
}
;Tooltip,  %xpos% %ypos% 
MouseMove, xpos, ypos, 12
return

ButtonStepSlow:
Gosub CheckMove
if ttop
{
	x := tarray_x[ttop], y := tarray_y[ttop]
	ttop -= 1
	MouseMove, x, y, 12
}
else
{
	MouseGetPos, xpos, ypos
	Gosub StartStepCalc
  ;Tooltip,  %xpos% %ypos% 
	MouseMove, xpos, ypos, 12
}
return

CheckMove:
If( movecheck = 0 )
{
	MouseGetPos, pointedposx, pointedposy
	movecheck = 1
	ttop = 0
}
return
	
StartStepCalc:

CoordMode, Mouse, Screen  ; 将鼠标坐标模式设置为屏幕模式，以便我们可以检测多显示器的边界

SysGet, MonitorCount, MonitorCount  ; 获取显示器数量

; 获取每个显示器的边界信息
Loop %MonitorCount%
{
    SysGet, Monitor, Monitor, %A_Index%
    MonitorX%A_Index% := MonitorLeft
    MonitorY%A_Index% := MonitorTop
    MonitorWidth%A_Index% := MonitorRight - MonitorLeft
    MonitorHeight%A_Index% := MonitorBottom - MonitorTop
}

; 获取当前鼠标的位置
;MouseGetPos, xpos, ypos

; 遍历每个显示器的边界进行检测
Loop %MonitorCount%
{
    MonitorLeft := MonitorX%A_Index%
    MonitorTop := MonitorY%A_Index%
    MonitorRight := MonitorX%A_Index% + MonitorWidth%A_Index%
    MonitorBottom := MonitorY%A_Index% + MonitorHeight%A_Index%

    MonitorHeight := MonitorHeight%A_Index%

    tmp_xpos = %xpos%
    tmp_ypos = %ypos%

    ; 检查鼠标是否在当前显示器内，并调整位置
    if (tmp_xpos > MonitorLeft && tmp_xpos < MonitorRight && tmp_ypos > MonitorTop && tmp_ypos < MonitorBottom)
    {
    
    If( pointedposx > MousePosX + 12 )
    	xpos := xpos + Temp2*MonitorHeight/4
    else If( pointedposx < MousePosX - 12 )
    	xpos := xpos - Temp2*MonitorHeight/4
    If( pointedposy > MousePosY + 12 )
    	ypos := ypos + Temp2*MonitorHeight/4
    else If( pointedposy < MousePosY - 12 )
    	ypos := ypos - Temp2*MonitorHeight/4

    ;flag := xpos > MonitorLeft && xpos < MonitorRight && ypos > MonitorTop && ypos < MonitorBottom

    Xmax := MonitorRight - 10
    Ymax := MonitorBottom - 10
    Xmin := MonitorLeft + 10
    Ymin := MonitorTop + 10

    ;Tooltip, %MonitorHeight% | %tmp1% %tmp2% { %MousePosX% %MousePosY% } | %xpos% %ypos% { %pointedposx% %pointedposy% } | %Xmin% %Xmax% %Ymin% %Ymax% | %MonitorLeft% %MonitorRight% %MonitorTop% %MonitorBottom% | %flag% %movecheck% | %flag1% %flag2% 

        Clamp(value, min, max) {
            if (value < min)
                return min
            else if (value > max)
                return max
            else
                return value
        }
        ;txpos := Clamp(xpos, Xmin, Xmax)
        ;typos := Clamp(ypos, Ymin, Ymax)
    ;Tooltip, %tmp_xpos% %tmp_ypos% %xpos% %ypos% | %Xmin% %Xmax% %Ymin% %Ymax% | %txpos% %typos%
        xpos := Clamp(xpos, Xmin, Xmax)
        ypos := Clamp(ypos, Ymin, Ymax)
        ;if xpos > Xmax
        ;    xpos := Xmax
        ;else if xpos < Xmin
        ;    xpos := Xmin

        ;if ypos > Ymax
        ;    ypos := Ymax
        ;else if ypos < Ymin
        ;    ypos := Ymin

        ; 一旦找到匹配的显示器并调整位置，跳出循环
		;MouseMove, 490, 10, 12
        break
    }
}
return

;Mouse wheel movement support

ButtonWheelUp:
ButtonWheelDown:
If Button != 0
{
	If Button != %A_ThisHotkey%
	{
		MouseWheelCurrentAccelerationSpeed = 0
		MouseWheelCurrentSpeed = %MouseWheelSpeed%
	}
}
StringReplace, Button, A_ThisHotkey, *
	
ButtonWheelAccelerationStart:
If MouseWheelMaxSpeed > %MouseWheelCurrentSpeed%
{
	Temp = 0.001
	Temp *= %MouseWheelAccelerationSpeed%
	MouseWheelCurrentAccelerationSpeed += %Temp%
	MouseWheelCurrentSpeed += %MouseWheelCurrentAccelerationSpeed%
}
If Button = NumpadPgUp
	MouseClick, WheelUp,,, %MouseWheelCurrentSpeed%, 0, D
else if Button = NumpadPgDn
	MouseClick, WheelDown,,, %MouseWheelCurrentSpeed%, 0, D
SetTimer, ButtonWheelAccelerationEnd, 100
return
	
ButtonWheelAccelerationEnd:
GetKeyState, kstate, %Button%, P
if kstate = D
	Goto ButtonWheelAccelerationStart
SetTimer, ButtonWheelAccelerationEnd, Off
MouseWheelCurrentAccelerationSpeed = 0
MouseWheelCurrentSpeed = %MouseWheelSpeed%
Button = 0
return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return

#NoEnv

SetWorkingDir %A_ScriptDir%
SendMode, Input

ButtonArrowUp:
SetKeyDelay, -1
Send {Blind}{NumpadUp DownR}
return
ButtonArrowUpu:
SetKeyDelay, -1
Send {Blind}{NumpadUp up}
return
ButtonArrowDown:
SetKeyDelay, -1
Send {Blind}{NumpadDown DownR}
return
ButtonArrowDownu:
SetKeyDelay, -1
Send {Blind}{NumpadDown up}
return
ButtonArrowLeft:
SetKeyDelay, -1
Send {Blind}{NumpadLeft DownR}
return
ButtonArrowLeftu:
SetKeyDelay, -1
Send {Blind}{NumpadLeft up}
return
ButtonArrowRight:
SetKeyDelay, -1
Send {Blind}{NumpadRight DownR}
return
ButtonArrowRightu:
SetKeyDelay, -1
Send {Blind}{NumpadRight up}
return
ButtonBrightnessUp:
MoveBrightness(2)
return
ButtonBrightnessDown:
MoveBrightness(-2)
return
ButtonVolumeUp:
Send {Blind}{Volume_Up}
return
ButtonVolumeDown:
Send {Blind}{Volume_Down}
return
ButtonMediaNext:
Send {Blind}{Media_Next}
Tooltip, Play Next
SetTimer, RemoveToolTip, 800
return
ButtonMediaPrev:
Send {Blind}{Media_Prev}
Tooltip, Play Previous
SetTimer, RemoveToolTip, 800
return
;ButtonMediaStop:
;Send {Blind}{Media_Stop}
;return
ButtonMediaPlayPause:
Send {Blind}{Media_Play_Pause}
Tooltip, Play/Pause
SetTimer, RemoveToolTip, 800
return
ButtonHome:
Send {NumpadHome}
Tooltip, Home
SetTimer, RemoveToolTip, 800
return
ButtonEnd:
Send {NumpadEnd}
Tooltip, End
SetTimer, RemoveToolTip, 800
return
ButtonPageUp:
Send {NumpadPgUp}
Tooltip, PageUp
SetTimer, RemoveToolTip, 800
return
ButtonPageDown:
Send {NumpadPgDn}
Tooltip, PageDown
SetTimer, RemoveToolTip, 800
return
ButtonMagnifierToggle:
magnifier := 1-magnifier
If magnifier = 1
{
	Send #=
	Tooltip, Magnifier ON
	SetTimer, RemoveToolTip, 800
}
else
{
	Tooltip, Magnifier OFF
	SetTimer, RemoveToolTip, 800
	Send #{Esc}
}
return

MoveBrightness(IndexMove) {
	VarSetCapacity(SupportedBrightness, 256, 0)
	VarSetCapacity(SupportedBrightnessSize, 4, 0)
	VarSetCapacity(BrightnessSize, 4, 0)
	VarSetCapacity(Brightness, 3, 0)
	
	hLCD := DllCall("CreateFile" , Str, "\\.\LCD"
	, UInt, 0x80000000 | 0x40000000 ;Read | Write
	, UInt, 0x1 | 0x2  ; File Read | File Write
	, UInt, 0 , UInt, 0x3  ; open any existing file
	, UInt, 0 , UInt, 0)
	
	if hLCD != -1
	{
		
		DevVideo := 0x00000023, BuffMethod := 0, Fileacces := 0
		  NumPut(0x03, Brightness, 0, "UChar")   ; 0x01 = Set AC, 0x02 = Set DC, 0x03 = Set both
		  NumPut(0x00, Brightness, 1, "UChar")      ; The AC brightness level
		  NumPut(0x00, Brightness, 2, "UChar")      ; The DC brightness level
		DllCall("DeviceIoControl" , UInt, hLCD
		  , UInt, (DevVideo<<16 | 0x126<<2 | BuffMethod<<14 | Fileacces)
		  , UInt, 0 , UInt, 0 , UInt, &Brightness
		  , UInt, 3 , UInt, &BrightnessSize , UInt, 0)
		
		DllCall("DeviceIoControl" , UInt, hLCD
		  , UInt, (DevVideo<<16 | 0x125<<2 | BuffMethod<<14 | Fileacces)
		  , UInt, 0 , UInt, 0 , UInt, &SupportedBrightness
		  , UInt, 256 , UInt, &SupportedBrightnessSize , UInt, 0)
		
		ACBrightness := NumGet(Brightness, 1, "UChar")
		ACIndex := 0
		DCBrightness := NumGet(Brightness, 2, "UChar")
		DCIndex := 0
		BufferSize := NumGet(SupportedBrightnessSize, 0, "UInt")
		MaxIndex := BufferSize-1
		Loop, %BufferSize%
		{
		ThisIndex := A_Index-1
		ThisBrightness := NumGet(SupportedBrightness, ThisIndex, "UChar")
		if ACBrightness = %ThisBrightness%
			ACIndex := ThisIndex
		if DCBrightness = %ThisBrightness%
			DCIndex := ThisIndex
		}
		if DCIndex >= %ACIndex%
		  BrightnessIndex := DCIndex
		else
		  BrightnessIndex := ACIndex
		BrightnessIndex += IndexMove
		if BrightnessIndex > %MaxIndex%
		   BrightnessIndex := MaxIndex
		if BrightnessIndex < 0
		   BrightnessIndex := 0
		NewBrightness := NumGet(SupportedBrightness, BrightnessIndex, "UChar")
		TempLight := Floor(BRightnessIndex / MaxIndex *100)	;以提示方式显示当前亮度 修改 by shinyship
		CoordMode, ToolTip
		ToolTip, ---------------------------------------------------------------------------------------------------------------  Brightness %TempLight%  --------------------------------------------------------------------------------------------------------------- ,0,
		SetTimer, RemoveToolTip, -3000
		NewBRightness := NumGet(SupportedBRightness, BRightnessIndex, "UChar")
		NumPut(0x03, Brightness, 0, "UChar")   ; 0x01 = Set AC, 0x02 = Set DC, 0x03 = Set both
        NumPut(NewBrightness, Brightness, 1, "UChar")      ; The AC brightness level
        NumPut(NewBrightness, Brightness, 2, "UChar")      ; The DC brightness level
		DllCall("DeviceIoControl" , UInt, hLCD
			, UInt, (DevVideo<<16 | 0x127<<2 | BuffMethod<<14 | Fileacces)
			, UInt, &Brightness
			, UInt, 3 , UInt, 0 , UInt, 0 , UInt, 0 , Uint, 0)
		DllCall("CloseHandle", UInt, hLCD)
	}
}
