!macro CustomCodePostInstall
	;See if the user selected 32-bit support
	SectionGetFlags ${OPTIONALSECTIONIDX} $0
	IntOp $0 $0 & ${SF_SELECTED}
	${If} $0 < ${SF_SELECTED}
		${If} ${FileExists} "$INSTDIR\apptemp\$$PLUGINSDIR\app-64.7z"
			nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\apptemp\$$PLUGINSDIR\app-64.7z" -o"$INSTDIR\App\Obsidian" -aoa`
		${EndIf}
	${Else}
		${If} ${FileExists} "$INSTDIR\apptemp\$$PLUGINSDIR\app-64.7z"
			CreateDirectory "$INSTDIR\App\Obsidian64"
			nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\apptemp\$$PLUGINSDIR\app-64.7z" -o"$INSTDIR\App\Obsidian64" -aoa`
		${EndIf}
		${If} ${FileExists} "$INSTDIR\apptemp\$$PLUGINSDIR\app-32.7z"
			nsExec::Exec `"$INSTDIR\7ztemp\7z.exe" x "$INSTDIR\apptemp\$$PLUGINSDIR\app-32.7z" -o"$INSTDIR\App\Obsidian" -aoa`
		${EndIf}
		WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Control" "BaseAppID64" "%BASELAUNCHERPATH%\App\Obsidian64\Obsidian.exe"
		WriteINIStr "$INSTDIR\App\AppInfo\Launcher\ObsidianPortable.ini" "Launch" "ProgramExecutable64" "Obsidian64\Obsidian.exe"
	${EndIf}
	${If} ${FileExists} "$INSTDIR\apptemp"
		RMDir /r "$INSTDIR\apptemp"
	${EndIf}

	;Change installer languages into Obsidian language code
	StrCpy $1 "NotDone"
	${If} $LANGUAGE == "1078" ;Afrikaans
		StrCpy $1 "af"
	${EndIf}
	${If} $LANGUAGE == "1025" ;Arabic
		StrCpy $1 "ar"
	${EndIf}
	${If} $LANGUAGE == "1093" ;Bengali
		StrCpy $1 "bn"
	${EndIf}
	${If} $LANGUAGE == "1059" ;Belarussian
		StrCpy $1 "be"
	${EndIf}
	${If} $LANGUAGE == "1026" ;Bulgarian
		StrCpy $1 "bg"
	${EndIf}
	${If} $LANGUAGE == "1027" ;Catalan
		StrCpy $1 "ca"
	${EndIf}
	${If} $LANGUAGE == "1029" ;Czech
		StrCpy $1 "cs"
	${EndIf}
	${If} $LANGUAGE == "1030" ;Danish
		StrCpy $1 "da"
	${EndIf}
	${If} $LANGUAGE == "1031" ;German
		StrCpy $1 "de"
	${EndIf}
	${If} $LANGUAGE == "1032" ;Greek
		StrCpy $1 "el"
	${EndIf}
	${If} $LANGUAGE == "1034" ;Spanish
		StrCpy $1 "es"
	${EndIf}
	${If} $LANGUAGE == "3082" ;SpanishInternational (same as Spanish)
		StrCpy $1 "es"
	${EndIf}
	${If} $LANGUAGE == "1061" ;Estonian
		StrCpy $1 "et"
	${EndIf}
	${If} $LANGUAGE == "1035" ;Finnish
		StrCpy $1 "fi"
	${EndIf}
	${If} $LANGUAGE == "1036" ;French
		StrCpy $1 "fr"
	${EndIf}
	${If} $LANGUAGE == "1084" ;Gaelic
		StrCpy $1 "gd"
	${EndIf}
	${If} $LANGUAGE == "1110" ;Galician
		StrCpy $1 "gl"
	${EndIf}
	${If} $LANGUAGE == "1095" ;Gujarati
		StrCpy $1 "gu"
	${EndIf}
	${If} $LANGUAGE == "1037" ;Hebrew
		StrCpy $1 "he"
	${EndIf}
	${If} $LANGUAGE == "1050" ;Croatian
		StrCpy $1 "hr"
	${EndIf}
	${If} $LANGUAGE == "1081" ;Hindi
		StrCpy $1 "hi"
	${EndIf}
	${If} $LANGUAGE == "1038" ;Hungarian
		StrCpy $1 "hu"
	${EndIf}
	${If} $LANGUAGE == "1040" ;Italian
		StrCpy $1 "it"
	${EndIf}
	${If} $LANGUAGE == "1041" ;Japanese
		StrCpy $1 "ja"
	${EndIf}
	${If} $LANGUAGE == "1035" ;Finnish
		StrCpy $1 "fi"
	${EndIf}
	${If} $LANGUAGE == "1042" ;Korean
		StrCpy $1 "ko"
	${EndIf}
	${If} $LANGUAGE == "1063" ;Lithuanian
		StrCpy $1 "lt"
	${EndIf}
	${If} $LANGUAGE == "1062" ;Latvian
		StrCpy $1 "lv"
	${EndIf}
	${If} $LANGUAGE == "1121" ;Nepali
		StrCpy $1 "ne"
	${EndIf}
	${If} $LANGUAGE == "1043" ;Dutch
		StrCpy $1 "nl"
	${EndIf}
	${If} $LANGUAGE == "1044" ;Norwegian
	${OrIf} $LANGUAGE == "2068" ;Norwegian
		StrCpy $1 "no"
	${EndIf}
	${If} $LANGUAGE == "1045" ;Polish
		StrCpy $1 "pl"
	${EndIf}
	${If} $LANGUAGE == "2070" ;Portuguese
		StrCpy $1 "pt"
	${EndIf}
	${If} $LANGUAGE == "1046" ;PortugueseBR
		StrCpy $1 "pt"
	${EndIf}
	${If} $LANGUAGE == "1048" ;Romanian
		StrCpy $1 "ro"
	${EndIf}
	${If} $LANGUAGE == "1049" ;Russian
		StrCpy $1 "ru"
	${EndIf}
	${If} $LANGUAGE == "1051" ;Slovak
		StrCpy $1 "sk"
	${EndIf}
	${If} $LANGUAGE == "1060" ;Slovenian
		StrCpy $1 "sl"
	${EndIf}
	${If} $LANGUAGE == "3098" ;Serbian
		StrCpy $1 "sr"
	${EndIf}
	${If} $LANGUAGE == "2074" ;SerbianLatin
		StrCpy $1 "sh"
	${EndIf}
	${If} $LANGUAGE == "1115" ;Sinhalese
		StrCpy $1 "si"
	${EndIf}
	${If} $LANGUAGE == "1053" ;Swedish
		StrCpy $1 "sv"
	${EndIf}
	${If} $LANGUAGE == "1098" ;Teluga
		StrCpy $1 "te"
	${EndIf}
	${If} $LANGUAGE == "1054" ;Thai
		StrCpy $1 "th"
	${EndIf}
	${If} $LANGUAGE == "1055" ;Turkish
		StrCpy $1 "tr"
	${EndIf}
	${If} $LANGUAGE == "1058" ;Ukrainian
		StrCpy $1 "uk"
	${EndIf}
	${If} $LANGUAGE == "1066" ;Vietnamese
		StrCpy $1 "vi"
	${EndIf}
	${If} $LANGUAGE == "2052" ;SimpChinese
		StrCpy $1 "zh"
	${EndIf}
	${If} $LANGUAGE == "1028" ;TradChinese
			StrCpy $1 "zh"
	${EndIf}
	${If} $LANGUAGE == "1077" ;Zulu
			StrCpy $1 "zu"
	${EndIf}
	${If} $LANGUAGE == "2057" ;EnglishGB
			StrCpy $1 "en"
	${EndIf}
	${If} $1 == "NotDone" ;Fallback to English
		StrCpy $1 "en"
	${EndIf}
	nsExec::Exec `"$INSTDIR\App\Bin\leveldb.exe" --dbpath="$INSTDIR\Data\ObsidianAppData\Local Storage\leveldb" init`
	nsExec::Exec `"$INSTDIR\App\Bin\leveldb.exe" --dbpath="$INSTDIR\Data\ObsidianAppData\Local Storage\leveldb" put "_app://obsidian.md\0\x01language" "\x01$1"`
!macroend
