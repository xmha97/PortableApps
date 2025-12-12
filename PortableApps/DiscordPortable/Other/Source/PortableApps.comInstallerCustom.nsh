!macro CustomCodePostInstall
	${If} ${FileExists} "$INSTDIR\apptemp\Discord-1.0.9218-full.nupkg"
		CreateDirectory "$INSTDIR\apptemp\nupkg"
		nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\apptemp\Discord-1.0.9218-full.nupkg" -o"$INSTDIR\apptemp\nupkg" -aoa`
		CreateDirectory "$INSTDIR\App\Discord"
		Rename "$INSTDIR\apptemp\nupkg\lib\net45" "$INSTDIR\App\Discord\app-1.0.9218"
		Rename "$INSTDIR\apptemp\Update.exe" "$INSTDIR\App\Discord\Update.exe"
		CreateDirectory "$INSTDIR\App\Discord\packages"
		Rename "$INSTDIR\apptemp\Discord-1.0.9218-full.nupkg" "$INSTDIR\App\Discord\packages\Discord-1.0.9218-full.nupkg"
		Rename "$INSTDIR\apptemp\RELEASES" "$INSTDIR\App\Discord\packages\RELEASES"
	${EndIf}
	${If} ${FileExists} "$INSTDIR\apptemp"
		RMDir /r "$INSTDIR\apptemp"
	${EndIf}
!macroend
