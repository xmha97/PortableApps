!macro CustomCodePostInstall
	Rename "$INSTDIR\App\syncthing-windows-386-v2.0.11" "$INSTDIR\App\Syncthing"
	Rename "$INSTDIR\App\syncthing-windows-amd64-v2.0.11" "$INSTDIR\App\Syncthing64"
!macroend
