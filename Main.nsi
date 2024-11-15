Unicode true
SetCompressor /SOLID lzma
OutFile 'AOH3Setup.exe'
!include "MUI.nsh"
!include "LogicLib.nsh"
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "MITLicense.txt"
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"
!define SND_NAME "ODDNUMBER.mp3"
ShowInstDetails show
ReserveFile "${SND_NAME}"
Name "AoH3Setup"
BrandingText "AoH3Setup by RiritoXXL"
Function .onInit
InitPluginsDir
File "/oname=${NSISDIR}\ODDNUMBER.mp3" 'ODDNUMBER.mp3'
; this is very beginning of the code, so we may skip Push and Pop for $0 - it is not in use yet
  System::Call 'winmm::mciSendStringW("play ${SND_NAME} repeat", i 0, i 0, i 0) i .r0'

FunctionEnd

Function .onGUIEnd
;free BASS

FunctionEnd

Section 01
    InitPluginsDir
    SetOutPath "C:\ProgramFiles\AoH3"
    File /nonfatal /r "F:\SteamLibrary\steamapps\common\Age of History 3\*.*"
SectionEnd
