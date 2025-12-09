${SegmentFile}
Var CustomFirstRunDone

${SegmentPrePrimary}
	${If} ${FileExists} "$SMPROGRAMS\Eitaa.lnk"
		Rename "$SMPROGRAMS\Eitaa.lnk" "$SMPROGRAMS\Eitaa-BackupByEitaaPortable.lnk"
	${EndIf}
	ReadINIStr $0 "$EXEDIR\Data\settings\EitaaPortableSettings.ini" "FirstRun" "Done"
	${If} $0 != true
		ClearErrors
		MessageBox MB_ICONINFORMATION|MB_OK "IMPORTANT ACCOUNT PORTABILITY NOTE!$\r$\n$\r$\nBy default, Eitaa will store your local account media on the local machine and leave it behind on exit.  To ensure it is not left behind, after you create/login to your account, click Menu, Settings, Advanced, click Default Folder and select 'Temp Folder, cleared on logout...' and then click Save. This will ensure your synced data is not left behind as you move PCs."		
		StrCpy $CustomFirstRunDone true
	${EndIf}
	Delete "$EXEDIR\App\Eitaa\log_*.txt"
!macroend
${SegmentPostPrimary}
	Delete "$SMPROGRAMS\Eitaa.lnk"
	${If} ${FileExists} "$SMPROGRAMS\Eitaa-BackupByEitaaPortable.lnk"
		Rename "$SMPROGRAMS\Eitaa-BackupByEitaaPortable.lnk" "$SMPROGRAMS\Eitaa.lnk"
	${EndIf}
	${If} $CustomFirstRunDone == true
		WriteINIStr "$EXEDIR\Data\settings\EitaaPortableSettings.ini" "FirstRun" "Done" "true"
	${EndIf}
!macroend
