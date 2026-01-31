!macro CustomCodePostInstall
	FindFirst $0 $1 "$INSTDIR\apptemp\ntfy_*_windows_amd64"
	StrCmp $1 "" done

	RMDir /r "$INSTDIR\App\ntfy"
	CreateDirectory "$INSTDIR\App\ntfy"
	Rename "$INSTDIR\apptemp\$1\ntfy.exe" "$INSTDIR\App\ntfy\ntfy.exe"
	
	RMDir /r "$INSTDIR\App\DefaultData"
	CreateDirectory "$INSTDIR\App\DefaultData"
	Rename "$INSTDIR\apptemp\$1\client" "$INSTDIR\App\DefaultData\client"

done:
	FindClose $0
	RMDir /r "$INSTDIR\apptemp"

!macroend
