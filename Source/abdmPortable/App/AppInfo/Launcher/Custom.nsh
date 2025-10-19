${SegmentFile}
!include WinMessages.nsh

${Segment.onInit}
	ReadRegStr $0 HKLM "Software\Microsoft\Windows NT\CurrentVersion" "CurrentBuild"	
	${If} $0 < 10240 ;Windows 10
		MessageBox MB_OK|MB_ICONSTOP "Obsidian only runs on Windows 10 or later!"
		Abort
	${EndIf}
!macroend

${SegmentPreExec}
	FileOpen $9 "$EXEDIR\App\ABDownloadManager\.portable" w ;Opens a Empty File and fills it
	FileWrite $9 "../../Data"
	FileClose $9 ;Closes the filled file
!macroend
