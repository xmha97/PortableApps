!macro CustomCodePostInstall
	;See if the user selected 32-bit support
	SectionGetFlags ${OPTIONALSECTIONIDX} $0
	IntOp $0 $0 & ${SF_SELECTED}
	${If} $0 < ${SF_SELECTED}
		RMDir /r "$INSTDIR\App\NightPDF-arm64"
	${Else}
		Rename "$INSTDIR\App\NightPDF" "$INSTDIR\App\NightPDF-amd64"
		Rename "$INSTDIR\App\NightPDF-arm64" "$INSTDIR\App\NightPDF"
		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Dependencies" "Requires64bitOS" "no"

		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Control" "BaseAppIDARM64" "%BASELAUNCHERPATH%\App\NightPDF\NightPDF.exe"
		WriteINIStr "$INSTDIR\App\AppInfo\Launcher\NightPDFPortable.ini" "Launch" "ProgramExecutableARM64" "NightPDF\NightPDF.exe"

		WriteINIStr "$INSTDIR\App\AppInfo\Launcher\NightPDFPortable.ini" "Launch" "ProgramExecutable" "NightPDF-amd64\NightPDF.exe"
		WriteINIStr "$INSTDIR\App\AppInfo\Launcher\NightPDFPortable.ini" "Launch" "ProgramExecutable64" "NightPDF-amd64\NightPDF.exe"

		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Control" "BaseAppID" "%BASELAUNCHERPATH%\App\NightPDF-amd64\NightPDF.exe"
		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Control" "BaseAppID64" "%BASELAUNCHERPATH%\App\NightPDF-amd64\NightPDF.exe"
	${EndIf}
!macroend
