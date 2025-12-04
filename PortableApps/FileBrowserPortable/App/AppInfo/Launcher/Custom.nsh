${SegmentFile}
!include WinMessages.nsh

${SegmentPreExec}
	SetOutPath "$EXEDIR\Data"
	System::Call kernel32::GetCurrentProcess()i.s
	System::Call kernel32::IsWow64Process(is,*i.r0)
	${If} $0 == 0 ;32
		StrCpy $5 "$EXEDIR\App\FileBrowser\filebrowser.exe"
	${Else} ;64
		StrCpy $5 "$EXEDIR\App\FileBrowser64\filebrowser.exe"
	${EndIf}
	${IfNot} ${FileExists} "$EXEDIR\Data\filebrowser.db"
		nsExec::ExecToStack '$\"$5$\" config init'
		nsExec::ExecToStack '$\"$5$\" users add admin portableapps --perm.admin'
	${EndIf}
	ReadINIStr $6 "$EXEDIR\Data\settings\FileBrowserPortableSettings.ini" "FileBrowserPortableSettings" "FileBrowserRootDir"
	nsExec::ExecToStack '$\"$5$\" config set --root=$\"$6$\"'
	ReadINIStr $7 "$EXEDIR\Data\settings\FileBrowserPortableSettings.ini" "FileBrowserPortableSettings" "FileBrowserAddress"
	nsExec::ExecToStack '$\"$5$\" config set --address=$\"$7$\"'
	ReadINIStr $8 "$EXEDIR\Data\settings\FileBrowserPortableSettings.ini" "FileBrowserPortableSettings" "FileBrowserPort"
	nsExec::ExecToStack '$\"$5$\" config set --port=$\"$8$\"'
!macroend
