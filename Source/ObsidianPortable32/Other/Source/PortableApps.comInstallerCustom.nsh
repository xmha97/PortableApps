!macro CustomCodePostInstall
	${If} ${FileExists} "$INSTDIR\apptemp\$$PLUGINSDIR\app-32.7z"
		CreateDirectory "$INSTDIR\App\Obsidian"
		nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\apptemp\$$PLUGINSDIR\app-32.7z" -o"$INSTDIR\App\Obsidian" -aoa`
	${EndIf}
	${If} ${FileExists} "$INSTDIR\apptemp"
		RMDir /r "$INSTDIR\apptemp"
	${EndIf}
!macroend
