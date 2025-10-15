${SegmentFile}
!include WinMessages.nsh

${Segment.onInit}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "Start 1 - onInit: $0"
	ReadRegStr $2 HKLM "Software\Microsoft\Windows NT\CurrentVersion" "CurrentBuild"	
	${If} $2 < 10240 ;Windows 10
		MessageBox MB_OK|MB_ICONSTOP "Obsidian only runs on Windows 10 or later!"
		Abort
	${EndIf}
!macroend

${SegmentInit}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "Start 2 - Show SplashScreen - Init: $0"
!macroend

${SegmentPre}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "Start 3 - Pre: $0"
!macroend

${SegmentPrePrimary}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "Start 4 - PrePrimary: $0"
!macroend

${SegmentPreExec}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "Start 5 - Get Language - PreExec: $0"
!macroend

${SegmentPreExecPrimary}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "Start 6 - StartApp - PreExecPrimary: $0"
!macroend

${SegmentPostPrimary}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "Exit 1 - PostPrimary: $0"
!macroend

${SegmentPost}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "Exit 2 - Post: $0"
!macroend

${SegmentUnload}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "Exit 3 - Unload: $0"
!macroend
