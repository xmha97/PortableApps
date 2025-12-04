${SegmentFile}
!include WinMessages.nsh

${Segment.onInit}
	ReadRegStr $0 HKLM "Software\Microsoft\Windows NT\CurrentVersion" "CurrentBuild"	
	${If} $0 < 10240 ;Windows 10
		MessageBox MB_OK|MB_ICONSTOP "Psiphon only runs on Windows 10 or later!"
		Abort
	${EndIf}
	CreateDirectory "$INSTDIR\App\Psiphon\psiphon3.exe.orig"
!macroend
