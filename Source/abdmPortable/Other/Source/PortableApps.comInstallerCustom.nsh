!macro CustomCodePostInstall
	FileOpen $9 "$INSTDIR\App\ABDownloadManager\.portable" w ;Opens a Empty File and fills it
	FileWrite $9 "../../Data"
	FileClose $9 ;Closes the filled file
!macroend
