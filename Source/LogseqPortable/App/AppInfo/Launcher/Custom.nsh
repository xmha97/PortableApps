${SegmentFile}
!include "LogicLib.nsh"
!include WinMessages.nsh
!include StrFunc.nsh
${StrRep}

${Segment.onInit}
	ReadRegStr $0 HKLM "Software\Microsoft\Windows NT\CurrentVersion" "CurrentBuild"	
	${If} $0 < 10240 ;Windows 10
		MessageBox MB_OK|MB_ICONSTOP "Logseq only runs on Windows 10 or later!"
		Abort
	${EndIf}
	
	${StrRep} $0 $EXEDIR "\" "++"
	${StrRep} $0 $0 ":" "+3A+"
	StrCpy $1 "$EXEDIR\Data\LogseqData\graphs"
	StrCpy $2 "$1\logseq_local_$0++Data++Logseq Graph.transit"
	${IfNot} ${FileExists} "$2"
		FindFirst $3 $4 "$1\*.transit"
		${If} $3 == ""
			RMDir /r "$EXEDIR\Data\LogseqData\graphs"
			CreateDirectory "$EXEDIR\Data\LogseqData\graphs"
			CopyFiles "$EXEDIR\App\logseq_local.transit" "$2"
		${Else}
			StrCpy $5 "$1\$4"
			CopyFiles "$5" "$EXEDIR\Data\tmp.transit"
			RMDir /r "$EXEDIR\Data\LogseqData\graphs"
			CreateDirectory "$EXEDIR\Data\LogseqData\graphs"
			Rename "$EXEDIR\Data\tmp.transit" "$2"
			FindClose $3
		${EndIf}
	${EndIf}

	${StrRep} $0 $EXEDIR "\" "/"
	StrCpy $1 "logseq_local_$0/Data/Logseq Graph"
	${IfNot} ${FileExists} "$EXEDIR\Data\LogseqAppData\Local Storage\leveldb\*.*"
		CreateDirectory "$EXEDIR\Data\LogseqAppData\Local Storage\leveldb"
		nsExec::Exec `"$EXEDIR\App\Bin\leveldb.exe" --dbpath="$EXEDIR\Data\LogseqAppData\Local Storage\leveldb" init`
	${EndIf}
	nsExec::Exec `"$EXEDIR\App\Bin\leveldb.exe" --dbpath="$EXEDIR\Data\LogseqAppData\Local Storage\leveldb" put "_file://\0\x01current-repo" "\x01\"$1\""`

	;Determine if run from the PortableApps.com Platform
	ReadEnvStr $0 "PortableApps.comLanguageCode_INTERNAL"
	${IfNot} $0 == ""
		;Follow PortableApps.com Platform language
		StrCpy $1 "NotDone"
		${If} $LANGUAGE == "1078" ;Afrikaans - South Africa
			StrCpy $1 "af-ZA"
		${EndIf}
		${If} $LANGUAGE == "1118" ;Amharic - Ethiopia
			StrCpy $1 "am-ET"
		${EndIf}
		${If} $LANGUAGE == "14337" ;Arabic - U.A.E.
			StrCpy $1 "ar-AE"
		${EndIf}
		${If} $LANGUAGE == "15361" ;Arabic - Bahrain
			StrCpy $1 "ar-BH"
		${EndIf}
		${If} $LANGUAGE == "5121" ;Arabic - Algeria
			StrCpy $1 "ar-DZ"
		${EndIf}
		${If} $LANGUAGE == "3073" ;Arabic - Egypt
			StrCpy $1 "ar-EG"
		${EndIf}
		${If} $LANGUAGE == "2049" ;Arabic - Iraq
			StrCpy $1 "ar-IQ"
		${EndIf}
		${If} $LANGUAGE == "11265" ;Arabic - Jordan
			StrCpy $1 "ar-JO"
		${EndIf}
		${If} $LANGUAGE == "13313" ;Arabic - Kuwait
			StrCpy $1 "ar-KW"
		${EndIf}
		${If} $LANGUAGE == "12289" ;Arabic - Lebanon
			StrCpy $1 "ar-LB"
		${EndIf}
		${If} $LANGUAGE == "4097" ;Arabic - Libya
			StrCpy $1 "ar-LY"
		${EndIf}
		${If} $LANGUAGE == "6145" ;Arabic - Morocco
			StrCpy $1 "ar-MO"
		${EndIf}
		${If} $LANGUAGE == "8193" ;Arabic - Oman
			StrCpy $1 "ar-OM"
		${EndIf}
		${If} $LANGUAGE == "16385" ;Arabic - Qatar
			StrCpy $1 "ar-QA"
		${EndIf}
		${If} $LANGUAGE == "1025" ;Arabic - Saudi Arabia
			StrCpy $1 "ar-SA"
		${EndIf}
		${If} $LANGUAGE == "10241" ;Arabic - Syria
			StrCpy $1 "ar-SY"
		${EndIf}
		${If} $LANGUAGE == "7169" ;Arabic - Tunisia
			StrCpy $1 "ar-TN"
		${EndIf}
		${If} $LANGUAGE == "9217" ;Arabic - Yemen
			StrCpy $1 "ar-YE"
		${EndIf}
		${If} $LANGUAGE == "1101" ;Assamese
			StrCpy $1 "as-IN"
		${EndIf}
		${If} $LANGUAGE == "1068" ;Azeri (Latin)
			StrCpy $1 "az-AZ"
		${EndIf}
		${If} $LANGUAGE == "2092" ;Azeri (Cyrillic)
			StrCpy $1 "az-AZ"
		${EndIf}
		${If} $LANGUAGE == "1059" ;Belarusian
			StrCpy $1 "be-BY"
		${EndIf}
		${If} $LANGUAGE == "1026" ;Bulgarian
			StrCpy $1 "bg-BG"
		${EndIf}
		${If} $LANGUAGE == "2117" ;Bengali (Bangladesh)
			StrCpy $1 "bn-BD"
		${EndIf}
		${If} $LANGUAGE == "1093" ;Bengali (India)
			StrCpy $1 "bn-IN"
		${EndIf}
		${If} $LANGUAGE == "2129" ;Tibetan - Bhutan
			StrCpy $1 "bo-BT"
		${EndIf}
		${If} $LANGUAGE == "1105" ;Tibetan - People's Republic of China
			StrCpy $1 "bo-CN"
		${EndIf}
		${If} $LANGUAGE == "5146" ;Bosnian (Bosnia/Herzegovina)
			StrCpy $1 "bs-BA"
		${EndIf}
		${If} $LANGUAGE == "1027" ;Catalan
			StrCpy $1 "ca-ES"
		${EndIf}
		${If} $LANGUAGE == "1029" ;Czech
			StrCpy $1 "cs-CZ"
		${EndIf}
		${If} $LANGUAGE == "1106" ;Welsh
			StrCpy $1 "cy-GB"
		${EndIf}
		${If} $LANGUAGE == "1030" ;Danish
			StrCpy $1 "da-DK"
		${EndIf}
		${If} $LANGUAGE == "3079" ;German - Austria
			StrCpy $1 "de-AT"
		${EndIf}
		${If} $LANGUAGE == "2055" ;German - Switzerland
			StrCpy $1 "de-CH"
		${EndIf}
		${If} $LANGUAGE == "1031" ;German - Germany
			StrCpy $1 "de-DE"
		${EndIf}
		${If} $LANGUAGE == "5127" ;German - Liechtenstein
			StrCpy $1 "de-LI"
		${EndIf}
		${If} $LANGUAGE == "4103" ;German - Luxembourg
			StrCpy $1 "de-LU"
		${EndIf}
		${If} $LANGUAGE == "1125" ;Divehi
			StrCpy $1 "dv-MV"
		${EndIf}
		${If} $LANGUAGE == "1032" ;Greek
			StrCpy $1 "el-GR"
		${EndIf}
		${If} $LANGUAGE == "3081" ;English - Australia
			StrCpy $1 "en-AU"
		${EndIf}
		${If} $LANGUAGE == "10249" ;English - Belize
			StrCpy $1 "en-BZ"
		${EndIf}
		${If} $LANGUAGE == "4105" ;English - Canada
			StrCpy $1 "en-CA"
		${EndIf}
		${If} $LANGUAGE == "2057" ;English - United Kingdom
			StrCpy $1 "en-GB"
		${EndIf}
		${If} $LANGUAGE == "15369" ;English - Hong Kong SAR
			StrCpy $1 "en-HK"
		${EndIf}
		${If} $LANGUAGE == "14345" ;English - Indonesia
			StrCpy $1 "en-ID"
		${EndIf}
		${If} $LANGUAGE == "6153" ;English - Ireland
			StrCpy $1 "en-IE"
		${EndIf}
		${If} $LANGUAGE == "16393" ;English - India
			StrCpy $1 "en-IN"
		${EndIf}
		${If} $LANGUAGE == "8201" ;English - Jamaica
			StrCpy $1 "en-JM"
		${EndIf}
		${If} $LANGUAGE == "17417" ;English - Malaysia
			StrCpy $1 "en-MY"
		${EndIf}
		${If} $LANGUAGE == "5129" ;English - New Zealand
			StrCpy $1 "en-NZ"
		${EndIf}
		${If} $LANGUAGE == "13321" ;English - Philippines
			StrCpy $1 "en-PH"
		${EndIf}
		${If} $LANGUAGE == "18441" ;English - Singapore
			StrCpy $1 "en-SG"
		${EndIf}
		${If} $LANGUAGE == "11273" ;English - Trinidad
			StrCpy $1 "en-TT"
		${EndIf}
		${If} $LANGUAGE == "1033" ;English - United States
			StrCpy $1 "en-US"
		${EndIf}
		${If} $LANGUAGE == "7177" ;English - South Africa
			StrCpy $1 "en-ZA"
		${EndIf}
		${If} $LANGUAGE == "12297" ;English - Zimbabwe
			StrCpy $1 "en-ZW"
		${EndIf}
		${If} $LANGUAGE == "11274" ;Spanish - Argentina
			StrCpy $1 "es-AR"
		${EndIf}
		${If} $LANGUAGE == "16394" ;Spanish - Bolivia
			StrCpy $1 "es-BO"
		${EndIf}
		${If} $LANGUAGE == "13322" ;Spanish - Chile
			StrCpy $1 "es-CL"
		${EndIf}
		${If} $LANGUAGE == "9226" ;Spanish - Colombia
			StrCpy $1 "es-CO"
		${EndIf}
		${If} $LANGUAGE == "5130" ;Spanish - Costa Rica
			StrCpy $1 "es-CR"
		${EndIf}
		${If} $LANGUAGE == "7178" ;Spanish - Dominican Republic
			StrCpy $1 "es-DO"
		${EndIf}
		${If} $LANGUAGE == "12298" ;Spanish - Ecuador
			StrCpy $1 "es-EC"
		${EndIf}
		${If} $LANGUAGE == "1034" ;Spanish - Spain (Traditional Sort)
			StrCpy $1 "es-ES"
		${EndIf}
		${If} $LANGUAGE == "3082" ;Spanish - Spain (Modern Sort)
			StrCpy $1 "es-ES"
		${EndIf}
		${If} $LANGUAGE == "4106" ;Spanish - Guatemala
			StrCpy $1 "es-GT"
		${EndIf}
		${If} $LANGUAGE == "18442" ;Spanish - Honduras
			StrCpy $1 "es-HN"
		${EndIf}
		${If} $LANGUAGE == "2058" ;Spanish - Mexico
			StrCpy $1 "es-MX"
		${EndIf}
		${If} $LANGUAGE == "19466" ;Spanish - Nicaragua
			StrCpy $1 "es-NI"
		${EndIf}
		${If} $LANGUAGE == "6154" ;Spanish - Panama
			StrCpy $1 "es-PA"
		${EndIf}
		${If} $LANGUAGE == "10250" ;Spanish - Peru
			StrCpy $1 "es-PE"
		${EndIf}
		${If} $LANGUAGE == "20490" ;Spanish - Puerto Rico
			StrCpy $1 "es-PR"
		${EndIf}
		${If} $LANGUAGE == "15370" ;Spanish - Paraguay
			StrCpy $1 "es-PY"
		${EndIf}
		${If} $LANGUAGE == "17418" ;Spanish - El Salvador
			StrCpy $1 "es-SV"
		${EndIf}
		${If} $LANGUAGE == "21514" ;Spanish - United States
			StrCpy $1 "es-US"
		${EndIf}
		${If} $LANGUAGE == "14346" ;Spanish - Uruguay
			StrCpy $1 "es-UY"
		${EndIf}
		${If} $LANGUAGE == "8202" ;Spanish - Venezuela
			StrCpy $1 "es-VE"
		${EndIf}
		${If} $LANGUAGE == "1061" ;Estonian
			StrCpy $1 "et-EE"
		${EndIf}
		${If} $LANGUAGE == "1069" ;Basque
			StrCpy $1 "eu-ES"
		${EndIf}
		${If} $LANGUAGE == "1065" ;Persian
			StrCpy $1 "fa-IR"
		${EndIf}
		${If} $LANGUAGE == "1035" ;Finnish
			StrCpy $1 "fi-FI"
		${EndIf}
		${If} $LANGUAGE == "1080" ;Faroese
			StrCpy $1 "fo-FO"
		${EndIf}
		${If} $LANGUAGE == "2060" ;French - Belgium
			StrCpy $1 "fr-BE"
		${EndIf}
		${If} $LANGUAGE == "3084" ;French - Canada
			StrCpy $1 "fr-CA"
		${EndIf}
		${If} $LANGUAGE == "9228" ;French - Democratic Rep. of Congo
			StrCpy $1 "fr-CG"
		${EndIf}
		${If} $LANGUAGE == "4108" ;French - Switzerland
			StrCpy $1 "fr-CH"
		${EndIf}
		${If} $LANGUAGE == "12300" ;French - Cote d'Ivoire
			StrCpy $1 "fr-CI"
		${EndIf}
		${If} $LANGUAGE == "11276" ;French - Cameroon
			StrCpy $1 "fr-CM"
		${EndIf}
		${If} $LANGUAGE == "1036" ;French - France
			StrCpy $1 "fr-FR"
		${EndIf}
		${If} $LANGUAGE == "15372" ;French - Haiti
			StrCpy $1 "fr-HT"
		${EndIf}
		${If} $LANGUAGE == "5132" ;French - Luxembourg
			StrCpy $1 "fr-LU"
		${EndIf}
		${If} $LANGUAGE == "14348" ;French - Morocco
			StrCpy $1 "fr-MA"
		${EndIf}
		${If} $LANGUAGE == "6156" ;French - Monaco
			StrCpy $1 "fr-MC"
		${EndIf}
		${If} $LANGUAGE == "13324" ;French - Mali
			StrCpy $1 "fr-ML"
		${EndIf}
		${If} $LANGUAGE == "8204" ;French - Reunion
			StrCpy $1 "fr-RE"
		${EndIf}
		${If} $LANGUAGE == "10252" ;French - Senegal
			StrCpy $1 "fr-SN"
		${EndIf}
		${If} $LANGUAGE == "1122" ;Frisian - Netherlands
			StrCpy $1 "fy-NL"
		${EndIf}
		${If} $LANGUAGE == "2108" ;Gaelic (Ireland)
			StrCpy $1 "ga-IE"
		${EndIf}
		${If} $LANGUAGE == "1084" ;Gaelic (Scotland)
			StrCpy $1 "gd-GB"
		${EndIf}
		${If} $LANGUAGE == "1110" ;Galician
			StrCpy $1 "gl-ES"
		${EndIf}
		${If} $LANGUAGE == "1140" ;Guarani - Paraguay
			StrCpy $1 "gn-PY"
		${EndIf}
		${If} $LANGUAGE == "1095" ;Gujarati
			StrCpy $1 "gu-IN"
		${EndIf}
		${If} $LANGUAGE == "1128" ;Hausa - Nigeria
			StrCpy $1 "ha-NG"
		${EndIf}
		${If} $LANGUAGE == "1037" ;Hebrew
			StrCpy $1 "he-IL"
		${EndIf}
		${If} $LANGUAGE == "1081" ;Hindi
			StrCpy $1 "hi-IN"
		${EndIf}
		${If} $LANGUAGE == "4122" ;Croatian (Bosnia/Herzegovina)
			StrCpy $1 "hr-BA"
		${EndIf}
		${If} $LANGUAGE == "1050" ;Croatian
			StrCpy $1 "hr-HR"
		${EndIf}
		${If} $LANGUAGE == "1038" ;Hungarian
			StrCpy $1 "hu-HU"
		${EndIf}
		${If} $LANGUAGE == "1067" ;Armenian - Armenia
			StrCpy $1 "hy-AM"
		${EndIf}
		${If} $LANGUAGE == "1057" ;Indonesian
			StrCpy $1 "id-ID"
		${EndIf}
		${If} $LANGUAGE == "1136" ;Igbo - Nigeria
			StrCpy $1 "ig-NG"
		${EndIf}
		${If} $LANGUAGE == "1144" ;Yi
			StrCpy $1 "ii-CN"
		${EndIf}
		${If} $LANGUAGE == "1039" ;Icelandic
			StrCpy $1 "is-IS"
		${EndIf}
		${If} $LANGUAGE == "2064" ;Italian - Switzerland
			StrCpy $1 "it-CH"
		${EndIf}
		${If} $LANGUAGE == "1040" ;Italian - Italy
			StrCpy $1 "it-IT"
		${EndIf}
		${If} $LANGUAGE == "1117" ;Inuktitut
			StrCpy $1 "iu-CA"
		${EndIf}
		${If} $LANGUAGE == "1041" ;Japanese
			StrCpy $1 "ja-JP"
		${EndIf}
		${If} $LANGUAGE == "1079" ;Georgian
			StrCpy $1 "ka-GE"
		${EndIf}
		${If} $LANGUAGE == "1087" ;Kazakh
			StrCpy $1 "kk-KZ"
		${EndIf}
		${If} $LANGUAGE == "1107" ;Khmer
			StrCpy $1 "km-KH"
		${EndIf}
		${If} $LANGUAGE == "1099" ;Kannada
			StrCpy $1 "kn-IN"
		${EndIf}
		${If} $LANGUAGE == "1042" ;Korean
			StrCpy $1 "ko-KR"
		${EndIf}
		${If} $LANGUAGE == "1137" ;Kanuri - Nigeria
			StrCpy $1 "kr-NG"
		${EndIf}
		${If} $LANGUAGE == "1120" ;Kashmiri (Arabic)
			StrCpy $1 "ks-IN"
		${EndIf}
		${If} $LANGUAGE == "2144" ;Kashmiri (Devanagari)
			StrCpy $1 "ks-IN"
		${EndIf}
		${If} $LANGUAGE == "1088" ;Kyrgyz (Cyrillic)
			StrCpy $1 "ky-KG"
		${EndIf}
		${If} $LANGUAGE == "1108" ;Lao
			StrCpy $1 "lo-LA"
		${EndIf}
		${If} $LANGUAGE == "1063" ;Lithuanian
			StrCpy $1 "lt-LT"
		${EndIf}
		${If} $LANGUAGE == "1062" ;Latvian
			StrCpy $1 "lv-LV"
		${EndIf}
		${If} $LANGUAGE == "1153" ;Maori - New Zealand
			StrCpy $1 "mi-NZ"
		${EndIf}
		${If} $LANGUAGE == "1071" ;F.Y.R.O. Macedonian
			StrCpy $1 "mk-MK"
		${EndIf}
		${If} $LANGUAGE == "1100" ;Malayalam
			StrCpy $1 "ml-IN"
		${EndIf}
		${If} $LANGUAGE == "2128" ;Mongolian (Mongolian)
			StrCpy $1 "mn-CN"
		${EndIf}
		${If} $LANGUAGE == "1104" ;Mongolian (Cyrillic)
			StrCpy $1 "mn-MN"
		${EndIf}
		${If} $LANGUAGE == "1102" ;Marathi
			StrCpy $1 "mr-IN"
		${EndIf}
		${If} $LANGUAGE == "2110" ;Malay - Brunei Darussalam
			StrCpy $1 "ms-BN"
		${EndIf}
		${If} $LANGUAGE == "1086" ;Malay - Malaysia
			StrCpy $1 "ms-MY"
		${EndIf}
		${If} $LANGUAGE == "1082" ;Maltese
			StrCpy $1 "mt-MT"
		${EndIf}
		${If} $LANGUAGE == "1109" ;Burmese
			StrCpy $1 "my-MM"
		${EndIf}
		${If} $LANGUAGE == "1044" ;Norwegian (Bokmål)
			StrCpy $1 "nb-NO"
		${EndIf}
		${If} $LANGUAGE == "2145" ;Nepali - India
			StrCpy $1 "ne-IN"
		${EndIf}
		${If} $LANGUAGE == "1121" ;Nepali
			StrCpy $1 "ne-NP"
		${EndIf}
		${If} $LANGUAGE == "2067" ;Dutch - Belgium
			StrCpy $1 "nl-BE"
		${EndIf}
		${If} $LANGUAGE == "1043" ;Dutch - Netherlands
			StrCpy $1 "nl-NL"
		${EndIf}
		${If} $LANGUAGE == "2068" ;Norwegian (Nynorsk)
			StrCpy $1 "nn-NO"
		${EndIf}
		${If} $LANGUAGE == "1096" ;Oriya
			StrCpy $1 "or-IN"
		${EndIf}
		${If} $LANGUAGE == "1094" ;Punjabi
			StrCpy $1 "pa-IN"
		${EndIf}
		${If} $LANGUAGE == "2118" ;Punjabi (Pakistan)
			StrCpy $1 "pa-PK"
		${EndIf}
		${If} $LANGUAGE == "1045" ;Polish
			StrCpy $1 "pl-PL"
		${EndIf}
		${If} $LANGUAGE == "1123" ;Pashto
			StrCpy $1 "ps-AF"
		${EndIf}
		${If} $LANGUAGE == "1046" ;Portuguese - Brazil
			StrCpy $1 "pt-BR"
		${EndIf}
		${If} $LANGUAGE == "2070" ;Portuguese - Portugal
			StrCpy $1 "pt-PT"
		${EndIf}
		${If} $LANGUAGE == "1047" ;Rhaeto-Romanic
			StrCpy $1 "rm-CH"
		${EndIf}
		${If} $LANGUAGE == "2072" ;Romanian - Moldava
			StrCpy $1 "ro-MD"
		${EndIf}
		${If} $LANGUAGE == "1048" ;Romanian
			StrCpy $1 "ro-RO"
		${EndIf}
		${If} $LANGUAGE == "2073" ;Russian - Moldava
			StrCpy $1 "ru-MD"
		${EndIf}
		${If} $LANGUAGE == "1049" ;Russian
			StrCpy $1 "ru-RU"
		${EndIf}
		${If} $LANGUAGE == "1103" ;Sanskrit
			StrCpy $1 "sa-IN"
		${EndIf}
		${If} $LANGUAGE == "1113" ;Sindhi - India
			StrCpy $1 "sd-IN"
		${EndIf}
		${If} $LANGUAGE == "2137" ;Sindhi - Pakistan
			StrCpy $1 "sd-PK"
		${EndIf}
		${If} $LANGUAGE == "1083" ;Sami
			StrCpy $1 "se-NO"
		${EndIf}
		${If} $LANGUAGE == "1115" ;Sinhalese - Sri Lanka
			StrCpy $1 "si-LK"
		${EndIf}
		${If} $LANGUAGE == "1051" ;Slovak
			StrCpy $1 "sk-SK"
		${EndIf}
		${If} $LANGUAGE == "1060" ;Slovenian
			StrCpy $1 "sl-SI"
		${EndIf}
		${If} $LANGUAGE == "1143" ;Somali
			StrCpy $1 "so-SO"
		${EndIf}
		${If} $LANGUAGE == "1052" ;Albanian - Albania
			StrCpy $1 "sq-AL"
		${EndIf}
		${If} $LANGUAGE == "2074" ;Serbian (Latin)
			StrCpy $1 "sr-CS"
		${EndIf}
		${If} $LANGUAGE == "3098" ;Serbian (Cyrillic)
			StrCpy $1 "sr-CS"
		${EndIf}
		${If} $LANGUAGE == "1072" ;Sutu
			StrCpy $1 "st-ZA"
		${EndIf}
		${If} $LANGUAGE == "2077" ;Swedish - Finland
			StrCpy $1 "sv-FI"
		${EndIf}
		${If} $LANGUAGE == "1053" ;Swedish
			StrCpy $1 "sv-SE"
		${EndIf}
		${If} $LANGUAGE == "1089" ;Swahili
			StrCpy $1 "sw-KE"
		${EndIf}
		${If} $LANGUAGE == "1097" ;Tamil
			StrCpy $1 "ta-IN"
		${EndIf}
		${If} $LANGUAGE == "1098" ;Telugu
			StrCpy $1 "te-IN"
		${EndIf}
		${If} $LANGUAGE == "1064" ;Tajik
			StrCpy $1 "tg-TJ"
		${EndIf}
		${If} $LANGUAGE == "1054" ;Thai
			StrCpy $1 "th-TH"
		${EndIf}
		${If} $LANGUAGE == "1139" ;Tigrigna - Ethiopia
			StrCpy $1 "ti-ER"
		${EndIf}
		${If} $LANGUAGE == "2163" ;Tigrigna - Eritrea
			StrCpy $1 "ti-ET"
		${EndIf}
		${If} $LANGUAGE == "1090" ;Turkmen
			StrCpy $1 "tk-TM"
		${EndIf}
		${If} $LANGUAGE == "1074" ;Tswana
			StrCpy $1 "tn-ZA"
		${EndIf}
		${If} $LANGUAGE == "1055" ;Turkish
			StrCpy $1 "tr-TR"
		${EndIf}
		${If} $LANGUAGE == "1073" ;Tsonga
			StrCpy $1 "ts-ZA"
		${EndIf}
		${If} $LANGUAGE == "1092" ;Tatar
			StrCpy $1 "tt-RU"
		${EndIf}
		${If} $LANGUAGE == "1152" ;Uighur - China
			StrCpy $1 "ug-CN"
		${EndIf}
		${If} $LANGUAGE == "1058" ;Ukrainian
			StrCpy $1 "uk-UA"
		${EndIf}
		${If} $LANGUAGE == "2080" ;Urdu - India
			StrCpy $1 "ur-IN"
		${EndIf}
		${If} $LANGUAGE == "1056" ;Urdu - Pakistan
			StrCpy $1 "ur-PK"
		${EndIf}
		${If} $LANGUAGE == "1091" ;Uzbek (Latin)
			StrCpy $1 "uz-UZ"
		${EndIf}
		${If} $LANGUAGE == "2115" ;Uzbek (Cyrillic)
			StrCpy $1 "uz-UZ"
		${EndIf}
		${If} $LANGUAGE == "1066" ;Vietnamese
			StrCpy $1 "vi-VN"
		${EndIf}
		${If} $LANGUAGE == "1076" ;Xhosa
			StrCpy $1 "xh-ZA"
		${EndIf}
		${If} $LANGUAGE == "1130" ;Yoruba
			StrCpy $1 "yo-NG"
		${EndIf}
		${If} $LANGUAGE == "2052" ;Chinese - People's Republic of China
			StrCpy $1 "zh-CN"
		${EndIf}
		${If} $LANGUAGE == "3076" ;Chinese - Hong Kong SAR
			StrCpy $1 "zh-HK"
		${EndIf}
		${If} $LANGUAGE == "5124" ;Chinese - Macao SAR
			StrCpy $1 "zh-MO"
		${EndIf}
		${If} $LANGUAGE == "4100" ;Chinese - Singapore
			StrCpy $1 "zh-SG"
		${EndIf}
		${If} $LANGUAGE == "1028" ;Chinese - Taiwan
			StrCpy $1 "zh-TW"
		${EndIf}
		${If} $LANGUAGE == "1077" ;Zulu
			StrCpy $1 "zu-ZA"
		${EndIf}
		${If} $1 == "NotDone" ;Fallback to English
			StrCpy $1 "en-US"
		${EndIf}
		nsExec::Exec `"$EXEDIR\App\Bin\leveldb.exe" --dbpath="$EXEDIR\Data\LogseqAppData\Local Storage\leveldb" put "_file://\0\x01preferred-language" "\x01\"$1\""`
	${EndIf}
!macroend
