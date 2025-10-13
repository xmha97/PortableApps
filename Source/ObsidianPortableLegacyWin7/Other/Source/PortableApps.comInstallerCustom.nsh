!macro CustomCodePostInstall
	;See if the user selected 32-bit support
	SectionGetFlags ${OPTIONALSECTIONIDX} $0
	IntOp $0 $0 & ${SF_SELECTED}
	${If} $0 < ${SF_SELECTED}
		RMDir /r "$INSTDIR\App\Obsidian"
		Rename "$INSTDIR\App\Obsidian64" "$INSTDIR\App\Obsidian"
	${Else}
		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Control" "BaseAppID64" "%BASELAUNCHERPATH%\App\Obsidian64\Obsidian.exe"
		WriteINIStr "$INSTDIR\App\AppInfo\Launcher\ObsidianPortableLegacyWin7.ini" "Launch" "ProgramExecutable64" "Obsidian64\Obsidian.exe"
	${EndIf}
!macroend
