${SegmentFile}
!include WinMessages.nsh

${Segment.OnInit}
	System::Call kernel32::GetCurrentProcess()i.s
	System::Call kernel32::IsWow64Process(is,*i.r0)
	ReadRegStr $2 HKLM "Software\Microsoft\Windows NT\CurrentVersion" "CurrentBuild"
	
	${If} $2 < 9200 ;Windows 8.0+
	${OrIf} $0 == 0 ;or 32-bit
		StrCpy $AppName "Obsidian"
		${If} ${IsWin2000}
			StrCpy $1 2000
		${ElseIf} ${IsWinXP}
			StrCpy $1 XP
		${ElseIf} ${IsWin2003}
			StrCpy $1 2003
		${ElseIf} ${IsWinVista}
			StrCpy $1 Vista
		${ElseIf} ${IsWin2008}
			StrCpy $1 2008
		${ElseIf} ${IsWin7}
			StrCpy $1 "7 32-bit"
		${ElseIf} ${IsWin2008R2}
			StrCpy $1 "2008 R2"
		${ElseIf} ${IsWin8}
			${If} $2 < 10000 ;Windows 7/8
				StrCpy $1 "8 32-bit"
			${Else}
				StrCpy $1 "10 32-bit"
			${EndIf}
		${ElseIf} ${IsWin2012}
			StrCpy $1 2012
		${Else}
			StrCpy $1 "Pre-Win10"
		${EndIf}	
		StrCpy $0 "8.0 64-bit"
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