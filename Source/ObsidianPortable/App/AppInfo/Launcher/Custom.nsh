${SegmentFile}
!include WinMessages.nsh

${Segment.onInit}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "onInit: $0"
	ReadRegStr $2 HKLM "Software\Microsoft\Windows NT\CurrentVersion" "CurrentBuild"	
	${If} $2 < 10240 ;Windows 10
		MessageBox MB_OK|MB_ICONSTOP "Obsidian only runs on Windows 10 or later!"
		Abort
	${EndIf}
!macroend

${SegmentInit}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "Init: $0"
!macroend

${SegmentPre}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "Pre: $0"
!macroend

${SegmentPrePrimary}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "PrePrimary: $0"
!macroend

${SegmentPreSecondary}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "PreSecondary: $0"
!macroend

${SegmentPreExec}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "PreExec: $0"
!macroend

${SegmentPreExecPrimary}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "PreExecPrimary: $0"
!macroend

${SegmentPreExecSecondary}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "PreExecSecondary: $0"
!macroend

${SegmentPost}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "Post: $0"
!macroend

${SegmentPostPrimary}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "PostPrimary: $0"
!macroend

${SegmentPostSecondary}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "PostSecondary: $0"
!macroend

${SegmentUnload}
	ReadINIStr $0 "$EXEDIR\Data\settings\ObsidianPortableSettings.ini" "ObsidianPortableSettings" "Language"
	MessageBox MB_OK "Unload: $0"
!macroend
