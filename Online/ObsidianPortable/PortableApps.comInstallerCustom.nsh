!macro CustomCodePostInstall
	${If} ${FileExists} "$INSTDIR\App\Temp\$$PLUGINSDIR\app-64.7z"
		CreateDirectory "$INSTDIR\App\Obsidian-amd64"
		nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\App\Temp\$$PLUGINSDIR\app-64.7z" -o"$INSTDIR\App\Obsidian-amd64" -aoa`
	${EndIf}
	${If} ${FileExists} "$INSTDIR\App\Temp\$$PLUGINSDIR\app-32.7z"
		CreateDirectory "$INSTDIR\App\Obsidian-amd32"
		nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\App\Temp\$$PLUGINSDIR\app-32.7z" -o"$INSTDIR\App\Obsidian-amd32" -aoa`
	${EndIf}
	${If} ${FileExists} "$INSTDIR\App\Temp\$$PLUGINSDIR\app-arm64.7z"
		CreateDirectory "$INSTDIR\App\Obsidian-arm64"
		nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\App\Temp\$$PLUGINSDIR\app-arm64.7z" -o"$INSTDIR\App\Obsidian-arm64" -aoa`
	${EndIf}
	${If} ${FileExists} "$INSTDIR\App\Temp"
		RMDir /r "$INSTDIR\App\Temp"
	${EndIf}
!macroend
