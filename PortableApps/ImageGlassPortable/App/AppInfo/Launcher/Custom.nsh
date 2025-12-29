${SegmentFile}

${SegmentInit}
	ReadRegStr $0 HKLM "Software\Microsoft\Windows NT\CurrentVersion" "CurrentBuild"	
	${If} $0 < 10240 ;Windows 10
		MessageBox MB_OK|MB_ICONSTOP "ImageGlass only runs on Windows 10 or later!"
		Abort
	${EndIf}

	${If} $Bits = 32
		MessageBox MB_OK|MB_ICONSTOP "ImageGlass only runs on 64-bit and ARM devices!"
		Abort
	${EndIf}

	ReadRegStr $0 HKLM "HARDWARE\DESCRIPTION\System" "Identifier"
	StrCpy $1 $0 3 0

	${If} $1 == "ARM"
		${SetEnvironmentVariablesPath} FullAppDir "$EXEDIR\App\ImageGlassARM64"
	${Else}
		${SetEnvironmentVariablesPath} FullAppDir "$EXEDIR\App\ImageGlass"
	${EndIf}

!macroend
