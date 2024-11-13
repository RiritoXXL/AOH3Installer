Unicode True
!define BASS_DLL "bass.dll"
!define BASSLOC "$PLUGINSDIR\${BASS_DLL}"
!define MP3NAME "ODDNUMBER.mp3"
!define MP3LOC "$PLUGINSDIR\${MP3NAME}"
!define BASS_LOOP 4
SetCompressor /SOLID lzma
OutFile "AOH3Setup.exe"
!include "MUI.nsh"
!include "LogicLib.nsh"
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "MITLicense.txt"
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"
ShowInstDetails show

Function .onInit
    InitPluginsDir
    File /oname=${MP3LOC} '${MP3NAME}'
    File /oname=${BASSLOC} '${BASS_DLL}'

    FindWindow $0 '#32770' $HWNDPARENT

    System::Call '${BASSLOC}::BASS_Init(i -1, i 44100, i 0, i r0, i n) b.r0'
    System::Call '${BASSLOC}::BASS_Start()'
    System::Call '${BASSLOC}::BASS_StreamCreateFile(b 0, t "$PLUGINSDIR/ODDNUMBER.mp3", i 0, i 0, i ${BASS_LOOP}) i.r1'
    System::Call '${BASSLOC}::BASS_ChannelPlay(i r1, b 0)'
FunctionEnd

Section 01
    InitPluginsDir
    File /r "F:\SteamLibrary\steamapps\common\Age of History 3\*.*"
SectionEnd