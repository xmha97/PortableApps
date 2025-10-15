${SegmentFile}
!include WinMessages.nsh

${SegmentPreExec}
	;Determine if run from the PortableApps.com Platform
	ReadEnvStr $0 "PortableApps.comLanguageCode_INTERNAL"
	${IfNot} $0 == ""
		${If} ${FileExists} "$EXEDIR\Data\ObsidianAppData\Local Storage\leveldb\*.*"
			nsExec::Exec `"$EXEDIR\App\Bin\leveldb.exe" --dbpath="$EXEDIR\Data\ObsidianAppData\Local Storage\leveldb" init`
		${EndIf}
		nsExec::Exec `"$EXEDIR\App\Bin\leveldb.exe" --dbpath="$EXEDIR\Data\ObsidianAppData\Local Storage\leveldb" put "_app://obsidian.md\0\x01language" "\x01$0"`
	${EndIf}
!macroend
