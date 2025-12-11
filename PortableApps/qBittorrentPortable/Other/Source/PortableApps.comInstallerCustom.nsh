!macro CustomCodePreInstall
	${If} ${FileExists} "$INSTDIR\App\AppInfo\appinfo.ini"
		ReadINIStr $0 "$INSTDIR\App\AppInfo\appinfo.ini" "Version" "PackageVersion"
		${VersionCompare} $0 "4.5.5.2" $R0
		${If} $R0 == "2"
		${AndIf} ${FileExists} "$INSTDIR\Data\settings\*.*"
			CreateDirectory "$INSTDIR\Data\Downloads"
			CreateDirectory "$INSTDIR\Data\Logs"
			${If} ${FileExists} "$INSTDIR\Data\settings\AppData_qBittorrent\qBittorrent.ini"
				WriteINIStr "$INSTDIR\Data\settings\AppData_qBittorrent\qBittorrent.ini" "Application" "FileLogger\Path" "@PLACEHOLDER_PALDATADIR@\\logs"
				WriteINIStr "$INSTDIR\Data\settings\AppData_qBittorrent\qBittorrent.ini" "BitTorrent" "Session\DefaultSavePath" "@PLACEHOLDER_PALDATADIR@\\Downloads"
			${EndIf}
		${EndIf}
	${EndIf}
	
	ReadRegStr $1 HKLM "Software\Microsoft\Windows NT\CurrentVersion" "CurrentBuild"
	
	${If} $1 < 10000 ;Windows 7/8
		${If} ${FileExists} "$INSTDIR\Data\settings\AppData_qBittorrent\*.*"
			${VersionCompare} $0 "4.6.0.0" $R0
			${If} $R0 = 2
				${GetParent} $INSTDIR $1
				${IfNot} ${FileExists} "$1\qBittorrentPortableLegacyWin7\*.*"
					${GetParent} $INSTDIR $1
					CreateDirectory "$1\qBittorrentPortableLegacyWin7"
					CopyFiles /SILENT "$INSTDIR\*.*" "$1\qBittorrentPortableLegacyWin7"
					WriteINIStr "$1\qBittorrentPortableLegacyWin7\App\AppInfo\AppInfo.ini" "Details" "AppID" "qBittorrentPortableLegacyWin7"
					WriteINIStr "$1\qBittorrentPortableLegacyWin7\App\AppInfo\AppInfo.ini" "Details" "Name" "qBittorrent Portable (Legacy Win7)"
					ReadINIStr $0 "$1\qBittorrentPortableLegacyWin7\App\AppInfo\AppInfo.ini" "Version" "DisplayVersion"
					${If} $0 == "4.5.5 Rev 2"
						WriteINIStr "$1\qBittorrentPortableLegacyWin7\App\AppInfo\AppInfo.ini" "Version" "DisplayVersion" "4.5.5"
					${EndIf}
					Delete "$1\qBittorrentPortableLegacyWin7\Other\Source\PortableApps.comInstallerCustom.nsh"
					WriteINIStr "$1\qBittorrentPortableLegacyWin7\App\DefaultData\settings\AppData_qBittorrent\qBittorrent.ini" "Preferences" "Advanced\updateCheck" "false"
				${EndIf}	
			${EndIf}
		${EndIf}
	${EndIf}
	
	${If} ${FileExists} "$INSTDIR\App\AppInfo\appinfo.ini"
		ReadINIStr $0 "$INSTDIR\App\AppInfo\appinfo.ini" "Version" "PackageVersion"
		${VersionCompare} $0 "4.6.7.0" $R0
		${If} $R0 == "2"
		${AndIf} ${FileExists} "$INSTDIR\Data\settings\AppData_qBittorrent\*.*"
			CreateDirectory "$INSTDIR\Data\qBittorrent"
			Rename "$INSTDIR\Data\settings\LocalAppData_qBittorrent" "$INSTDIR\Data\qBittorrent\data"
			Rename "$INSTDIR\Data\qBittorrent\data\cache" "$INSTDIR\Data\qBittorrent\cache"
			Rename "$INSTDIR\Data\settings\AppData_qBittorrent" "$INSTDIR\Data\qBittorrent\config"
		${EndIf}
	${EndIf}
!macroend