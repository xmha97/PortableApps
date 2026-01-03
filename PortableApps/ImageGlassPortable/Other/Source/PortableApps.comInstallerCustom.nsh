!macro CustomCodePostInstall

	${If} ${FileExists} "$INSTDIR\App\AppInfo\FileTypeIcons\*.*"
		RMDir /r "$INSTDIR\App\AppInfo\FileTypeIcons"
	${EndIf}

	${If} ${FileExists} "$INSTDIR\App\ImageGlass_x64\Ext-Icons\*.*"
		Rename "$INSTDIR\App\ImageGlass_x64\Ext-Icons" "$INSTDIR\App\AppInfo\FileTypeIcons"
	${EndIf}

	${If} ${FileExists} "$INSTDIR\App\ImageGlass_arm64\Ext-Icons\*.*"
		RMDir /r "$INSTDIR\App\ImageGlass_arm64\Ext-Icons"
	${EndIf}
	
	${If} ${FileExists} "$INSTDIR\App\ImageGlass_x64\createdump.exe"
		Delete "$INSTDIR\App\ImageGlass_x64\createdump.exe"
	${EndIf}
	
	${If} ${FileExists} "$INSTDIR\App\ImageGlass_arm64\createdump.exe"
		Delete "$INSTDIR\App\ImageGlass_arm64\createdump.exe"
	${EndIf}
	
	${If} ${FileExists} "$INSTDIR\App\ImageGlass_x64\igcmd.exe"
		Delete "$INSTDIR\App\ImageGlass_x64\igcmd.exe"
	${EndIf}
	
	${If} ${FileExists} "$INSTDIR\App\ImageGlass_arm64\igcmd.exe"
		Delete "$INSTDIR\App\ImageGlass_arm64\igcmd.exe"
	${EndIf}

	Delete "$INSTDIR\App\ImageGlass_x64\*.pdb"
	Delete "$INSTDIR\App\ImageGlass_arm64\*.pdb"
	
	Delete "$INSTDIR\App\ImageGlass_x64\*.json"
	Delete "$INSTDIR\App\ImageGlass_arm64\*.json"
	
	Delete "$INSTDIR\App\ImageGlass_x64\*.config"
	Delete "$INSTDIR\App\ImageGlass_arm64\*.config"
	
	${If} ${FileExists} "$INSTDIR\App\ImageGlass_x64\igcmd.dll"
		Delete "$INSTDIR\App\ImageGlass_x64\igcmd.dll"
	${EndIf}
	
	${If} ${FileExists} "$INSTDIR\App\ImageGlass_arm64\igcmd.dll"
		Delete "$INSTDIR\App\ImageGlass_arm64\igcmd.dll"
	${EndIf}
	
	${If} ${FileExists} "$INSTDIR\App\DefaultData\Themes\*.*"
		RMDir /r "$INSTDIR\App\DefaultData\Themes"
	${EndIf}

	${If} ${FileExists} "$INSTDIR\App\ImageGlass_x64\Themes\*.*"
		Rename "$INSTDIR\App\ImageGlass_x64\Themes" "$INSTDIR\App\DefaultData\Themes"
	${EndIf}

	${If} ${FileExists} "$INSTDIR\App\ImageGlass_x64\Themes\*.*"
		RMDir /r "$INSTDIR\App\ImageGlass_x64\Themes"
	${EndIf}

	${If} ${FileExists} "$INSTDIR\App\ImageGlass_arm64\Themes\*.*"
		RMDir /r "$INSTDIR\App\ImageGlass_arm64\Themes"
	${EndIf}

	;See if the user selected ARM support
	SectionGetFlags ${OPTIONALSECTIONIDX} $0
	IntOp $0 $0 & ${SF_SELECTED}
	${If} $0 < ${SF_SELECTED}

		${If} ${FileExists} "$INSTDIR\App\ImageGlass_arm64\*.*"
			RMDir /r "$INSTDIR\App\ImageGlass_arm64"
		${EndIf}

	${Else}

		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Control" "BaseAppIDARM64" "%BASELAUNCHERPATH%\App\ImageGlass_arm64\ImageGlass.exe"
		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Dependencies" "Requires64bitOS" "no"
		WriteINIStr "$INSTDIR\App\AppInfo\Launcher\ImageGlassPortable.ini" "Launch" "ProgramExecutableARM64" "ImageGlass_arm64\ImageGlass.exe"

	${EndIf}

!macroend
