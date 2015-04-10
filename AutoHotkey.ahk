; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

#z::Run www.autohotkey.com

^!n::
IfWinExist Untitled - Notepad
	WinActivate
else
	Run Notepad
return


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.

; # : WinKey
; ! : Alt
; ^ : Control
; + : Shift

#i::
Run "C:\Program Files (x86)\Internet Explorer\iexplore.exe"
return

#c::
Run calc
return

#p::
IfWinExist PuTTY Configuration
	WinActivate
else
	Run %A_Desktop%\putty.exe
	sleep 250
	sleep 10
	Send !t
	sleep 10
	Send !n
	Clipboard = 172.16.7 
	Send ^v
return

#/::
Run %A_Desktop%\Lingoes.lnk
return

#'::
;InputBox, OutputVar [, Title, Prompt, HIDE, Width, Height, X, Y, Font, Timeout, Default]
InputBox, UserInput, VIVOTEK Telnet Unlocker, Please enter IP of target camera., , 240, 120, , , , ,172.16.7
if ErrorLevel
    MsgBox, CANCEL was pressed.
else
    Run http://%UserInput%/cgi-bin/admin/mod_inetd.cgi?telnet=on
return

#t::
Gui, Add, CheckBox, x42 y20 w120 h20 vVar1, LOG_INFO
Gui, Add, CheckBox, x42 y40 w120 h20 vVar2, LOG_IMAGE_LINK
Gui, Add, CheckBox, x42 y60 w120 h20 vVar3, LOG_SENSOR_LIB
Gui, Add, CheckBox, x42 y80 w120 h20 vVar4, LOG_ISP_LIB
Gui, Add, CheckBox, x42 y100 w120 h20 vVar5, LOG_LENS
Gui, Add, CheckBox, x42 y120 w120 h20 vVar6, LOG_ICP
Gui, Add, CheckBox, x42 y140 w120 h20 vVar7, LOG_AE
Gui, Add, CheckBox, x42 y160 w120 h20 vVar8, LOG_AWB
Gui, Add, CheckBox, x42 y180 w120 h20 vVar9, LOG_ZF
Gui, Add, CheckBox, x42 y200 w120 h20 vVar10, LOG_CALIBRATION
Gui, Add, CheckBox, x42 y220 w120 h20 vVar11, LOG_VE
Gui, Add, CheckBox, x192 y20 w120 h20 vVar12, LOG_IQM
Gui, Add, CheckBox, x192 y40 w120 h20 vVar13, LOG_DNS
Gui, Add, CheckBox, x192 y60 w120 h20 vVar14, LOG_EG_SET
Gui, Add, CheckBox, x192 y80 w120 h20 vVar15, LOG_AE_PCURVE
Gui, Add, CheckBox, x192 y100 w120 h20 vVar16, LOG_HIST
Gui, Add, CheckBox, x192 y120 w120 h20 vVar17, LOG_STATISTIC
Gui, Add, CheckBox, x192 y140 w120 h20 vVar18, LOG_PIC
Gui, Add, CheckBox, x192 y160 w120 h20 vVar19, LOG_PTCP
Gui, Add, CheckBox, x192 y180 w120 h20 vVar20, LOG_HWTEST
Gui, Add, CheckBox, x192 y200 w120 h20 vVar21, LOG_AFT
Gui, Add, CheckBox, x192 y220 w120 h20 vVar22, LOG_FDS
Gui, Add, Button, x122 y260 w110 h30 gConfirm, Calculate
Gui, Add, Text, x112 y300 w150 h30 vResultText, Result=0x
; Generated using SmartGUI Creator 4.0
Gui, Show, x104 y87 h349 w360, New GUI Window

; Set checkbox default setting
GuiControl,, INFO,1
; Disable checkbox
; GuiControl,disable, INFO, 
; Checkbox default enable
; GuiControl,, INFO, 1
; Checkbox default disable
; GuiControl,, INFO, 0
; Hide checkbox
; GuiControl,hide, INFO,

GuiControl,, AE, 1
GuiControl,, AWB, 1
Return

Confirm:
    
    Gui, Submit
    if (Var1 = 1)
        Value = 7
; Start from LOG_IMAGE_LINK = 0x80 = 128
  Value += Var2 ?   128          : 0
  Value += Var3 ?   256          : 0
  Value += Var4 ?   512          : 0
  Value += Var5 ?   1024         : 0
  Value += Var6 ?   2048         : 0
  Value += Var7 ?   4096         : 0
  Value += Var8 ?   8192         : 0
  Value += Var9 ?   16384        : 0
  Value += Var10 ?   32768        : 0
  Value += Var11 ?  65536        : 0
  Value += Var12 ?  131072       : 0
  Value += Var13 ?  262144       : 0
  Value += Var14 ?  524288       : 0
  Value += Var15 ?  1048576      : 0
  Value += Var16 ?  2097152      : 0
  Value += Var17 ?  4194304      : 0
  Value += Var18 ?  8388608      : 0
  Value += Var19 ?  16777216     : 0
  Value += Var20 ?  33554432     : 0
  Value += Var21 ?  67108864     : 0
  Value += Var22 ?  134217728    : 0

  ControlSetText vResultText, 0x%Value%
MsgBox, Value = %Value%
Return

GuiClose:
ExitApp

::^mnt::mount 172.16.5.31:/home /home -t nfs -o tcp,nolock {Enter} 
::^mnt3::mount 172.16.5.32:/home /home -t nfs -o tcp,nolock {Enter} 
::^mntw::mount 172.16.5.31:/workspace /home -t nfs -o tcp,nolock {Enter} 
::^remnt::umount /etc/; mount / -o rw,remount {Enter}
::^rts::/etc/init.d/rtsps restart; /etc/init.d/svrpush restart{Enter}
::^mf::cd /mnt/flash2{Enter}
::^goo::www.google.com {Enter}
::^img::http://rd1-1/subversion/Sandbox/ChrisChen/Integration/NewArchitecture
::^ctag::
Clipboard = ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
Send {Shift down}{Insert}{Enter}
Send {Shift up}
return