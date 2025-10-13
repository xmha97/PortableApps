!macro CustomCodePostInstall
	;See if the user selected 32-bit support
	SectionGetFlags ${OPTIONALSECTIONIDX} $0
	IntOp $0 $0 & ${SF_SELECTED}
	${If} $0 < ${SF_SELECTED}
		${If} ${FileExists} "$INSTDIR\apptemp\$$PLUGINSDIR\app-64.7z"
			nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\apptemp\$$PLUGINSDIR\app-64.7z" -o"$INSTDIR\App\Obsidian" -aoa`
		${EndIf}
	${Else}
		${If} ${FileExists} "$INSTDIR\apptemp\$$PLUGINSDIR\app-64.7z"
			CreateDirectory "$INSTDIR\App\Obsidian64"
			nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\apptemp\$$PLUGINSDIR\app-64.7z" -o"$INSTDIR\App\Obsidian64" -aoa`
		${EndIf}
		${If} ${FileExists} "$INSTDIR\apptemp\$$PLUGINSDIR\app-32.7z"
			nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\apptemp\$$PLUGINSDIR\app-32.7z" -o"$INSTDIR\App\Obsidian" -aoa`
		${EndIf}
		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Control" "BaseAppID64" "%BASELAUNCHERPATH%\App\Obsidian64\Obsidian.exe"
		WriteINIStr "$INSTDIR\App\AppInfo\Launcher\ObsidianPortable.ini" "Launch" "ProgramExecutable64" "Obsidian64\Obsidian.exe"
	${EndIf}
	${If} ${FileExists} "$INSTDIR\apptemp"
		RMDir /r "$INSTDIR\apptemp"
	${EndIf}
!macroend
