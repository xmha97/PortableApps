${SegmentFile}

${SegmentInit}
	ReadRegStr $0 HKLM "Software\Microsoft\Windows NT\CurrentVersion" "CurrentBuild"	
	${If} $0 < 10240 ;Windows 10
		MessageBox MB_OK|MB_ICONSTOP "Logseq only runs on Windows 10 or later!"
		Abort
	${EndIf}

	${If} $Bits = 32
		MessageBox MB_OK|MB_ICONSTOP "Logseq only runs on 64-bit and ARM devices!"
		Abort
	${EndIf}
!macroend

${SegmentPre}
	ReadRegStr $0 HKLM "HARDWARE\DESCRIPTION\System" "Identifier"
	StrCpy $1 $0 3 0

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