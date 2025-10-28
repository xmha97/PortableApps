!macro CustomCodePreInstall
	IfFileExists "$INSTDIR\Data\settings\nanazip_portable.reg" "" CustomCodePreInstallEnd
		ReadINIStr $0 "$INSTDIR\Data\settings\nanazip_portable.reg" "HKEY_CURRENT_USER\Software\NanaZip\FM" '"FolderShortcuts"'
		StrCmp $0 "" "" CustomCodePreInstallEnd
		RMDir /r "$INSTDIR\Data"
	CustomCodePreInstallEnd:
!macroend

!macro CustomCodePostInstall
	${If} ${FileExists} "$INSTDIR\apptemp\NanaZipPackage_5.0.1263.0_x64.msix"
		Rename "$INSTDIR\apptemp\NanaZipPackage_5.0.1263.0_x64.msix" "$INSTDIR\apptemp\AMD64.zip"
		CreateDirectory "$INSTDIR\App\NanaZip"
		nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\apptemp\AMD64.zip" -o"$INSTDIR\App\NanaZip" -aoa`
		RMDir /r "$INSTDIR\App\NanaZip\AppxMetadata"
		RMDir /r "$INSTDIR\App\NanaZip\Assets"
		Delete "$INSTDIR\App\NanaZip\[Content_Types].xml"
		Delete "$INSTDIR\App\NanaZip\AppxBlockMap.xml"
		Delete "$INSTDIR\App\NanaZip\AppxManifest.xml"
		Delete "$INSTDIR\App\NanaZip\AppxSignature.p7x"
	${EndIf}

	;See if the user selected ARM support
	SectionGetFlags ${OPTIONALSECTIONIDX} $0
	IntOp $0 $0 & ${SF_SELECTED}
	${If} $0 < ${SF_SELECTED}
		RMDir /r "$INSTDIR\App\NanaZipARM64"
	${Else}
		${If} ${FileExists} "$INSTDIR\apptemp\NanaZipPackage_5.0.1263.0_arm64.msix"
			Rename "$INSTDIR\apptemp\NanaZipPackage_5.0.1263.0_arm64.msix" "$INSTDIR\apptemp\ARM64.zip"
			CreateDirectory "$INSTDIR\App\NanaZipARM64"
			nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\apptemp\ARM64.zip" -o"$INSTDIR\App\NanaZipARM64" -aoa`
			RMDir /r "$INSTDIR\App\NanaZipARM64\AppxMetadata"
			RMDir /r "$INSTDIR\App\NanaZipARM64\Assets"
			Delete "$INSTDIR\App\NanaZipARM64\[Content_Types].xml"
			Delete "$INSTDIR\App\NanaZipARM64\AppxBlockMap.xml"
			Delete "$INSTDIR\App\NanaZipARM64\AppxManifest.xml"
			Delete "$INSTDIR\App\NanaZipARM64\AppxSignature.p7x"
		${EndIf}
		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Control" "BaseAppIDARM64" "%BASELAUNCHERPATH%\App\NanaZipARM64\NanaZip.Modern.exe"
		WriteINIStr "$INSTDIR\App\AppInfo\Launcher\NanaZipPortable.ini" "Launch" "ProgramExecutableARM64" "%BASELAUNCHERPATH%\App\NanaZipARM64\NanaZip.Modern.exe"
	${EndIf}
	${If} ${FileExists} "$INSTDIR\apptemp"
		RMDir /r "$INSTDIR\apptemp"
	${EndIf}
!macroend
