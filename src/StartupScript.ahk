XButton2::LControl
RControl::LControl
XButton1::LShift
+Space::^+2

:*:\wkn::¯\_(ツ)_/¯
:*:\lambda::λ
:*:\plambda::⋋
:*:\up::↑
:*:\down::↓
:*:\left::←
:*:\right::→
:*:\neq::≠
:*:\func::ƒ
:*:\exists::∃
:*:\nexists::∄
:*:\forall::∀
:*:\empty::∅
:*:\elementof::∈
:*:\nelementof::∉
:*:\prod::∏
:*:\sum::∑
:*:\inf::∞
:*:\therefore::∴
:*:\because::∵
:*:\aeq::≈
:*:\ceq::≔
:*:\leq::≤
:*:\geq::≥
:*:\play::‣
:*:\imp::⁂important
:*:\eps::ℇ
:*:\ohm::Ω
:*:\fight::(ง'̀-'́)ง
:*:\gun::୧༼ಠ益ಠ༽︻╦╤─
:*:\icri::(╥﹏╥) i cri
:*:\fu1::╭∩╮(︶︿︶)╭∩╮
:*:\fu2::凸(¬‿¬)

#If WinActive("ahk_exe explorer.exe") 
#If

#If WinActive("ahk_exe Telegram.exe") 
:*:``````::
Send, ``````
Send, ^{Enter 2}
Send, ``````
Send, {Up}
;FormatTime, CurrentDateTime,, M/d/yyyy h:mm tt  ; It will look like 9/1/2005 3:53 PM
;SendInput /* Aryanium Codegram, started editing in %CurrentDateTime% */
;Send, ^{Enter 2}
return
#If

#MaxHotkeysPerInterval 500
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}
MButton::Send {Media_Play_Pause}
MButton & WheelUp::Send {Media_Next}
MButton & WheelDown::Send {Media_Prev}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
#If
