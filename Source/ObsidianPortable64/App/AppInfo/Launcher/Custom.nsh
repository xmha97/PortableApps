${SegmentFile}
!include WinMessages.nsh

${Segment.OnInit}
	ReadRegStr $2 HKLM "Software\Microsoft\Windows NT\CurrentVersion" "CurrentBuild"	
	${If} $2 < 10240 ;Windows 10
		MessageBox MB_OK|MB_ICONSTOP "Obsidian only runs on Windows 10 or later!"
		Abort
	${EndIf}
!macroend