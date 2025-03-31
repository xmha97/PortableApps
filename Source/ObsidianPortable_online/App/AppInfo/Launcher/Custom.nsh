${SegmentFile}
!include WinMessages.nsh

${Segment.OnInit}
	ReadRegStr $2 HKLM "Software\Microsoft\Windows NT\CurrentVersion" "CurrentBuild"	
	${If} $2 < 9200 ;Windows 8.0+
		MessageBox MB_OK|MB_ICONSTOP "$(LauncherIncompatibleMinOS)"
		Abort
	${EndIf}
!macroend

${SegmentPre}
	ReadRegStr $0 HKLM "HARDWARE\DESCRIPTION\System" "Identifier"
	StrCpy $1 $0 3 0
		
	${If} $1 == "ARM"
		${ReadLauncherConfig} $ProgramExecutable Launch ProgramExecutableARM64
	${EndIf}
!macroend