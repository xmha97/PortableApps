!macro CustomCodePostInstall

    Rename "$INSTDIR\App\Mp3tag\data" "$INSTDIR\App\DefaultData\data"
    Rename "$INSTDIR\App\Mp3tag\export" "$INSTDIR\App\DefaultData\export"

    RMDir /r "$INSTDIR\App\Mp3tag64\data"
    RMDir /r "$INSTDIR\App\Mp3tag64\export"

    RMDir /r "$INSTDIR\App\Mp3tag\$$PLUGINSDIR"
    RMDir /r "$INSTDIR\App\Mp3tag\[LICENSE]"
    Delete "$INSTDIR\App\Mp3tag\$$1"
    Delete "$INSTDIR\App\Mp3tag\$$R0"
    Delete "$INSTDIR\App\Mp3tag\[NSIS].nsi"
    Delete "$INSTDIR\App\Mp3tag\Mp3tagReadme.txt"
    Delete "$INSTDIR\App\Mp3tag\Mp3tagShell32.dll"
    Delete "$INSTDIR\App\Mp3tag\Mp3tagShell64.dll"
    Delete "$INSTDIR\App\Mp3tag\Mp3tagUninstall.exe.nsis"
    Delete "$INSTDIR\App\Mp3tag\Mp3tagVersion.txt"

!macroend
