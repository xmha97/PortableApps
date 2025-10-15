${SegmentFile}
!include WinMessages.nsh
!include StrFunc.nsh
${StrRep}

Function Chr
  Exch $R0
  IntFmt $R0 "%c" $R0
  Exch $R0
FunctionEnd

${Segment.onInit} ;Start 1 - Run EXE - onInit
	ReadRegStr $2 HKLM "Software\Microsoft\Windows NT\CurrentVersion" "CurrentBuild"	
	${If} $2 < 10240 ;Windows 10
		MessageBox MB_OK|MB_ICONSTOP "Obsidian only runs on Windows 10 or later!"
		Abort
	${EndIf}
!macroend

${SegmentInit} ;Start 2 - Show SplashScreen - Init
!macroend

${SegmentPre} ;Start 3 - Pre
!macroend

${SegmentPrePrimary} ;Start 4 - PrePrimary: $0
!macroend

${SegmentPreExec} ;Start 5 - Get Language - PreExec
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"

	${IfNot} ${FileExists} "$EXEDIR\Data\ObsidianAppData\Local Storage\leveldb\*.*"
		nsExec::Exec `"$EXEDIR\App\Bin\leveldb.exe" --dbpath="$EXEDIR\Data\ObsidianAppData\Local Storage\leveldb" init`
	${EndIf}
	
	nsExec::Exec `"$EXEDIR\App\Bin\leveldb.exe" --dbpath="$EXEDIR\Data\ObsidianAppData\Local Storage\leveldb" put "_app://obsidian.md\0\x01language" "\x01$0"`
!macroend

${SegmentPreExecPrimary} ;Start 6 - StartApp - PreExecPrimary
!macroend

${SegmentPostPrimary} ;Exit 1 - PostPrimary: $0
	${If} ${FileExists} "$EXEDIR\Data\ObsidianAppData\Local Storage\leveldb\*.*"
		Push 1
		Call Chr
		Pop $0

		nsExec::ExecToStack '"$EXEDIR\App\Bin\leveldb.exe" --dbpath="$EXEDIR\Data\ObsidianAppData\Local Storage\leveldb" get "_app://obsidian.md\0\x01language"'
		Pop $1
		${If} $1 = 0
			Pop $1
			${StrRep} $1 $1 $0 ""
			WriteINIStr "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language" "$1"
		${EndIf}
	${EndIf}
!macroend

${SegmentPost} ;Exit 2 - Post
!macroend

${SegmentUnload} ;Exit 3 - Unload
!macroend
