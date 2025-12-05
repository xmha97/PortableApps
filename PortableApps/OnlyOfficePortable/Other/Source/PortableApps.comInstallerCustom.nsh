!macro CustomCodePostInstall
	;See if the user selected 32-bit support
	SectionGetFlags ${OPTIONALSECTIONIDX} $0
	IntOp $0 $0 & ${SF_SELECTED}
	${If} $0 < ${SF_SELECTED} ; 64 bit only
		RMDir /r "$INSTDIR\App\DesktopEditors"
		Rename "$INSTDIR\App\DesktopEditors64" "$INSTDIR\App\DesktopEditors"
	${Else} ; 32 bit + 64 bit
		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Control" "BaseAppID64" "%BASELAUNCHERPATH%\App\DesktopEditors64\DesktopEditors.exe"
		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Dependencies" "Requires64bitOS" "no"
		WriteINIStr "$INSTDIR\App\AppInfo\Launcher\OnlyOfficePortable.ini" "Launch" "ProgramExecutable64" "DesktopEditors64\DesktopEditors.exe"
	${EndIf}

!macroend
