!macro CustomCodePostInstall

	${If} ${FileExists} "$INSTDIR\App\ImageGlass\*.*"
		RMDir /r "$INSTDIR\App\ImageGlass"
	${EndIf}

	${If} ${FileExists} "$INSTDIR\App\ImageGlassARM64\*.*"
		RMDir /r "$INSTDIR\App\ImageGlassARM64"
	${EndIf}

	${If} ${FileExists} "$INSTDIR\App\ImageGlass_9.4.0.1120_x64\*.*"
		Rename "$INSTDIR\App\ImageGlass_9.4.0.1120_x64" "$INSTDIR\App\ImageGlass"
	${EndIf}

	${If} ${FileExists} "$INSTDIR\App\ImageGlass_9.4.0.1120_arm64\*.*"
			Rename "$INSTDIR\App\ImageGlass_9.4.0.1120_arm64" "$INSTDIR\App\ImageGlassARM64"
	${EndIf}

	${If} ${FileExists} "$INSTDIR\App\AppInfo\FileTypeIcons\*.*"
		RMDir /r "$INSTDIR\App\AppInfo\FileTypeIcons"
	${EndIf}

	${If} ${FileExists} "$INSTDIR\App\ImageGlass\Ext-Icons\*.*"
		Rename "$INSTDIR\App\ImageGlass\Ext-Icons" "$INSTDIR\App\AppInfo\FileTypeIcons"
	${EndIf}

	${If} ${FileExists} "$INSTDIR\App\ImageGlassARM64\Ext-Icons\*.*"
		RMDir /r "$INSTDIR\App\ImageGlassARM64\Ext-Icons"
	${EndIf}

	;See if the user selected ARM support
	SectionGetFlags ${OPTIONALSECTIONIDX} $0
	IntOp $0 $0 & ${SF_SELECTED}
	${If} $0 < ${SF_SELECTED}

		${If} ${FileExists} "$INSTDIR\App\ImageGlassARM64\*.*"
			RMDir /r "$INSTDIR\App\ImageGlassARM64"
		${EndIf}

	${Else}

		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Control" "BaseAppIDARM64" "%BASELAUNCHERPATH%\App\ImageGlassARM64\ImageGlass.exe"
		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Dependencies" "Requires64bitOS" "no"
		WriteINIStr "$INSTDIR\App\AppInfo\Launcher\ImageGlassPortable.ini" "Launch" "ProgramExecutableARM64" "ImageGlassARM64\ImageGlass.exe"

	${EndIf}

!macroend
