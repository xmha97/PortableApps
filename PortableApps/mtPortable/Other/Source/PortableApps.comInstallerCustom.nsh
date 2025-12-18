!macro CustomCodePostInstall

    Rename "$INSTDIR\App\Mp3tag\data" "$INSTDIR\App\DefaultData\data"
    Rename "$INSTDIR\App\Mp3tag\export" "$INSTDIR\App\DefaultData\export"

    RMDir /r "$INSTDIR\App\Mp3tag64\data"
    RMDir /r "$INSTDIR\App\Mp3tag64\export"

    RMDir /r "$INSTDIR\App\Mp3tag\$$PLUGINSDIR"
    RMDir /r "$INSTDIR\App\Mp3tag\$$R2"
    Delete "$INSTDIR\App\Mp3tag\$$1"
    Delete "$INSTDIR\App\Mp3tag\$$R0"
    Delete "$INSTDIR\App\Mp3tag\Mp3tagReadme.txt"
    Delete "$INSTDIR\App\Mp3tag\Mp3tagShell.dll"
    Delete "$INSTDIR\App\Mp3tag\Mp3tagShell.msix"
    Delete "$INSTDIR\App\Mp3tag\Mp3tagShell32.dll"
    Delete "$INSTDIR\App\Mp3tag\Mp3tagShell64.dll"
    Delete "$INSTDIR\App\Mp3tag\Mp3tagVersion.txt"

    RMDir /r "$INSTDIR\App\Mp3tag64\$$PLUGINSDIR"
    RMDir /r "$INSTDIR\App\Mp3tag64\$$R2"
    Delete "$INSTDIR\App\Mp3tag64\$$1"
    Delete "$INSTDIR\App\Mp3tag64\$$R0"
    Delete "$INSTDIR\App\Mp3tag64\Mp3tagReadme.txt"
    Delete "$INSTDIR\App\Mp3tag64\Mp3tagShell.dll"
    Delete "$INSTDIR\App\Mp3tag64\Mp3tagShell.msix"
    Delete "$INSTDIR\App\Mp3tag64\Mp3tagShell32.dll"
    Delete "$INSTDIR\App\Mp3tag64\Mp3tagShell64.dll"
    Delete "$INSTDIR\App\Mp3tag64\Mp3tagVersion.txt"

	;See if the user selected 32-bit support
	SectionGetFlags ${OPTIONALSECTIONIDX} $0
	IntOp $0 $0 & ${SF_SELECTED}
	${If} $0 < ${SF_SELECTED} ; 64 bit only
		RMDir /r "$INSTDIR\App\Mp3tag"
		Rename "$INSTDIR\App\Mp3tag64" "$INSTDIR\App\Mp3tag"
	${Else} ; 32 bit + 64 bit
		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Control" "BaseAppID64" "%BASELAUNCHERPATH%\App\Mp3tag64\Mp3tag.exe"
		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Dependencies" "Requires64bitOS" "no"
		WriteINIStr "$INSTDIR\App\AppInfo\Launcher\mtPortable.ini" "Launch" "ProgramExecutable64" "Mp3tag64\Mp3tag.exe"
	${EndIf}

!macroend
