!macro CustomCodePostInstall
	${If} ${FileExists} "$INSTDIR\apptemp\$$PLUGINSDIR\app-64.7z"
		CreateDirectory "$INSTDIR\App\Obsidian-amd64"
		nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\apptemp\$$PLUGINSDIR\app-64.7z" -o"$INSTDIR\App\Obsidian-amd64" -aoa`
	${EndIf}
	${If} ${FileExists} "$INSTDIR\apptemp"
		RMDir /r "$INSTDIR\apptemp"
	${EndIf}
!macroend
