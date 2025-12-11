${SegmentFile}

${Segment.OnInit}
	System::Call kernel32::GetCurrentProcess()i.s
	System::Call kernel32::IsWow64Process(is,*i.r0)
	ReadRegStr $2 HKLM "Software\Microsoft\Windows NT\CurrentVersion" "CurrentBuild"
	
	${If} $2 < 10000 ;Windows 7/8
	${OrIf} $0 == 0 ;or 32-bit 10
		StrCpy $AppName "qBittorrent"
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
			StrCpy $1 7
		${ElseIf} ${IsWin2008R2}
			StrCpy $1 "2008 R2"
		${ElseIf} ${IsWin8}
			${If} $2 < 10000 ;Windows 7/8
				StrCpy $1 8
			${Else}
				StrCpy $1 "10 32-bit"
			${EndIf}
		${ElseIf} ${IsWin2012}
			StrCpy $1 2012
		${Else}
			StrCpy $1 "Pre-Win10"
		${EndIf}	
		StrCpy $0 "10 64-bit"
		MessageBox MB_OK|MB_ICONSTOP "$(LauncherIncompatibleMinOS)"
		Abort
	${EndIf}
!macroend

${SegmentPre}
	;Get the system's main TEMP and use that to ensure a second instance of qBittorrent doesn't occur
	ExpandEnvStrings $0 "%PortableApps.comTEMP%"
	${If} $0 != ""
		System::Call 'Kernel32::SetEnvironmentVariable(t, t) i("TEMP", "$0").r0'
		System::Call 'Kernel32::SetEnvironmentVariable(t, t) i("TMP", "$0").r0'
	${EndIf}

	${Registry::StrToHex} ":" $9 ;$9 now contains the ASCII code for :
	ExpandEnvStrings $0 "%PAL:Drive%"
	${Registry::StrToHex} $0 $1 ;$1 now contains the ASCII code for current drive
	${WordReplace} $1 $9 "" "+" $2
		
	ExpandEnvStrings $3 "%PAL:LastDrive%"
	${Registry::StrToHex} $3 $4 ;$4 now contains the ASCII code for last drive
	${WordReplace} $4 $9 "" "+" $5
	
	System::Call 'Kernel32::SetEnvironmentVariable(t, t) i("PAL:DriveHex", "$2").r0'
	System::Call 'Kernel32::SetEnvironmentVariable(t, t) i("PAL:LastDriveHex", "$5").r0'
!macroend
