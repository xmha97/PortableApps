!macro CustomCodePostInstall
	FileOpen $0 "$INSTDIR\App\ABDownloadManager\.portable" w ;Opens a Empty File and fills it
	FileWrite $0 "../../Data/.abdm"
	FileClose $0 ;Closes the filled file

	;Follow PortableApps.com Installer language
	StrCpy $1 "NotDone"
	${If} $LANGUAGE == "1078" ;Afrikaans - South Africa
		StrCpy $1 "af_ZA"
	${EndIf}
	${If} $LANGUAGE == "1118" ;Amharic - Ethiopia
		StrCpy $1 "am_ET"
	${EndIf}
	${If} $LANGUAGE == "14337" ;Arabic - U.A.E.
		StrCpy $1 "ar_AE"
	${EndIf}
	${If} $LANGUAGE == "15361" ;Arabic - Bahrain
		StrCpy $1 "ar_BH"
	${EndIf}
	${If} $LANGUAGE == "5121" ;Arabic - Algeria
		StrCpy $1 "ar_DZ"
	${EndIf}
	${If} $LANGUAGE == "3073" ;Arabic - Egypt
		StrCpy $1 "ar_EG"
	${EndIf}
	${If} $LANGUAGE == "2049" ;Arabic - Iraq
		StrCpy $1 "ar_IQ"
	${EndIf}
	${If} $LANGUAGE == "11265" ;Arabic - Jordan
		StrCpy $1 "ar_JO"
	${EndIf}
	${If} $LANGUAGE == "13313" ;Arabic - Kuwait
		StrCpy $1 "ar_KW"
	${EndIf}
	${If} $LANGUAGE == "12289" ;Arabic - Lebanon
		StrCpy $1 "ar_LB"
	${EndIf}
	${If} $LANGUAGE == "4097" ;Arabic - Libya
		StrCpy $1 "ar_LY"
	${EndIf}
	${If} $LANGUAGE == "6145" ;Arabic - Morocco
		StrCpy $1 "ar_MO"
	${EndIf}
	${If} $LANGUAGE == "8193" ;Arabic - Oman
		StrCpy $1 "ar_OM"
	${EndIf}
	${If} $LANGUAGE == "16385" ;Arabic - Qatar
		StrCpy $1 "ar_QA"
	${EndIf}
	${If} $LANGUAGE == "1025" ;Arabic - Saudi Arabia
		StrCpy $1 "ar_SA"
	${EndIf}
	${If} $LANGUAGE == "10241" ;Arabic - Syria
		StrCpy $1 "ar_SY"
	${EndIf}
	${If} $LANGUAGE == "7169" ;Arabic - Tunisia
		StrCpy $1 "ar_TN"
	${EndIf}
	${If} $LANGUAGE == "9217" ;Arabic - Yemen
		StrCpy $1 "ar_YE"
	${EndIf}
	${If} $LANGUAGE == "1101" ;Assamese
		StrCpy $1 "as_IN"
	${EndIf}
	${If} $LANGUAGE == "1068" ;Azeri (Latin)
		StrCpy $1 "az_AZ"
	${EndIf}
	${If} $LANGUAGE == "2092" ;Azeri (Cyrillic)
		StrCpy $1 "az_AZ"
	${EndIf}
	${If} $LANGUAGE == "1059" ;Belarusian
		StrCpy $1 "be_BY"
	${EndIf}
	${If} $LANGUAGE == "1026" ;Bulgarian
		StrCpy $1 "bg_BG"
	${EndIf}
	${If} $LANGUAGE == "2117" ;Bengali (Bangladesh)
		StrCpy $1 "bn_BD"
	${EndIf}
	${If} $LANGUAGE == "1093" ;Bengali (India)
		StrCpy $1 "bn_IN"
	${EndIf}
	${If} $LANGUAGE == "2129" ;Tibetan - Bhutan
		StrCpy $1 "bo_BT"
	${EndIf}
	${If} $LANGUAGE == "1105" ;Tibetan - People's Republic of China
		StrCpy $1 "bo_CN"
	${EndIf}
	${If} $LANGUAGE == "5146" ;Bosnian (Bosnia/Herzegovina)
		StrCpy $1 "bs_BA"
	${EndIf}
	${If} $LANGUAGE == "1027" ;Catalan
		StrCpy $1 "ca_ES"
	${EndIf}
	${If} $LANGUAGE == "1029" ;Czech
		StrCpy $1 "cs_CZ"
	${EndIf}
	${If} $LANGUAGE == "1106" ;Welsh
		StrCpy $1 "cy_GB"
	${EndIf}
	${If} $LANGUAGE == "1030" ;Danish
		StrCpy $1 "da_DK"
	${EndIf}
	${If} $LANGUAGE == "3079" ;German - Austria
		StrCpy $1 "de_AT"
	${EndIf}
	${If} $LANGUAGE == "2055" ;German - Switzerland
		StrCpy $1 "de_CH"
	${EndIf}
	${If} $LANGUAGE == "1031" ;German - Germany
		StrCpy $1 "de_DE"
	${EndIf}
	${If} $LANGUAGE == "5127" ;German - Liechtenstein
		StrCpy $1 "de_LI"
	${EndIf}
	${If} $LANGUAGE == "4103" ;German - Luxembourg
		StrCpy $1 "de_LU"
	${EndIf}
	${If} $LANGUAGE == "1125" ;Divehi
		StrCpy $1 "dv_MV"
	${EndIf}
	${If} $LANGUAGE == "1032" ;Greek
		StrCpy $1 "el_GR"
	${EndIf}
	${If} $LANGUAGE == "3081" ;English - Australia
		StrCpy $1 "en_AU"
	${EndIf}
	${If} $LANGUAGE == "10249" ;English - Belize
		StrCpy $1 "en_BZ"
	${EndIf}
	${If} $LANGUAGE == "4105" ;English - Canada
		StrCpy $1 "en_CA"
	${EndIf}
	${If} $LANGUAGE == "2057" ;English - United Kingdom
		StrCpy $1 "en_GB"
	${EndIf}
	${If} $LANGUAGE == "15369" ;English - Hong Kong SAR
		StrCpy $1 "en_HK"
	${EndIf}
	${If} $LANGUAGE == "14345" ;English - Indonesia
		StrCpy $1 "en_ID"
	${EndIf}
	${If} $LANGUAGE == "6153" ;English - Ireland
		StrCpy $1 "en_IE"
	${EndIf}
	${If} $LANGUAGE == "16393" ;English - India
		StrCpy $1 "en_IN"
	${EndIf}
	${If} $LANGUAGE == "8201" ;English - Jamaica
		StrCpy $1 "en_JM"
	${EndIf}
	${If} $LANGUAGE == "17417" ;English - Malaysia
		StrCpy $1 "en_MY"
	${EndIf}
	${If} $LANGUAGE == "5129" ;English - New Zealand
		StrCpy $1 "en_NZ"
	${EndIf}
	${If} $LANGUAGE == "13321" ;English - Philippines
		StrCpy $1 "en_PH"
	${EndIf}
	${If} $LANGUAGE == "18441" ;English - Singapore
		StrCpy $1 "en_SG"
	${EndIf}
	${If} $LANGUAGE == "11273" ;English - Trinidad
		StrCpy $1 "en_TT"
	${EndIf}
	${If} $LANGUAGE == "1033" ;English - United States
		StrCpy $1 "en_US"
	${EndIf}
	${If} $LANGUAGE == "7177" ;English - South Africa
		StrCpy $1 "en_ZA"
	${EndIf}
	${If} $LANGUAGE == "12297" ;English - Zimbabwe
		StrCpy $1 "en_ZW"
	${EndIf}
	${If} $LANGUAGE == "11274" ;Spanish - Argentina
		StrCpy $1 "es_AR"
	${EndIf}
	${If} $LANGUAGE == "16394" ;Spanish - Bolivia
		StrCpy $1 "es_BO"
	${EndIf}
	${If} $LANGUAGE == "13322" ;Spanish - Chile
		StrCpy $1 "es_CL"
	${EndIf}
	${If} $LANGUAGE == "9226" ;Spanish - Colombia
		StrCpy $1 "es_CO"
	${EndIf}
	${If} $LANGUAGE == "5130" ;Spanish - Costa Rica
		StrCpy $1 "es_CR"
	${EndIf}
	${If} $LANGUAGE == "7178" ;Spanish - Dominican Republic
		StrCpy $1 "es_DO"
	${EndIf}
	${If} $LANGUAGE == "12298" ;Spanish - Ecuador
		StrCpy $1 "es_EC"
	${EndIf}
	${If} $LANGUAGE == "1034" ;Spanish - Spain (Traditional Sort)
		StrCpy $1 "es_ES"
	${EndIf}
	${If} $LANGUAGE == "3082" ;Spanish - Spain (Modern Sort)
		StrCpy $1 "es_ES"
	${EndIf}
	${If} $LANGUAGE == "4106" ;Spanish - Guatemala
		StrCpy $1 "es_GT"
	${EndIf}
	${If} $LANGUAGE == "18442" ;Spanish - Honduras
		StrCpy $1 "es_HN"
	${EndIf}
	${If} $LANGUAGE == "2058" ;Spanish - Mexico
		StrCpy $1 "es_MX"
	${EndIf}
	${If} $LANGUAGE == "19466" ;Spanish - Nicaragua
		StrCpy $1 "es_NI"
	${EndIf}
	${If} $LANGUAGE == "6154" ;Spanish - Panama
		StrCpy $1 "es_PA"
	${EndIf}
	${If} $LANGUAGE == "10250" ;Spanish - Peru
		StrCpy $1 "es_PE"
	${EndIf}
	${If} $LANGUAGE == "20490" ;Spanish - Puerto Rico
		StrCpy $1 "es_PR"
	${EndIf}
	${If} $LANGUAGE == "15370" ;Spanish - Paraguay
		StrCpy $1 "es_PY"
	${EndIf}
	${If} $LANGUAGE == "17418" ;Spanish - El Salvador
		StrCpy $1 "es_SV"
	${EndIf}
	${If} $LANGUAGE == "21514" ;Spanish - United States
		StrCpy $1 "es_US"
	${EndIf}
	${If} $LANGUAGE == "14346" ;Spanish - Uruguay
		StrCpy $1 "es_UY"
	${EndIf}
	${If} $LANGUAGE == "8202" ;Spanish - Venezuela
		StrCpy $1 "es_VE"
	${EndIf}
	${If} $LANGUAGE == "1061" ;Estonian
		StrCpy $1 "et_EE"
	${EndIf}
	${If} $LANGUAGE == "1069" ;Basque
		StrCpy $1 "eu_ES"
	${EndIf}
	${If} $LANGUAGE == "1065" ;Persian
		StrCpy $1 "fa_IR"
	${EndIf}
	${If} $LANGUAGE == "1035" ;Finnish
		StrCpy $1 "fi_FI"
	${EndIf}
	${If} $LANGUAGE == "1080" ;Faroese
		StrCpy $1 "fo_FO"
	${EndIf}
	${If} $LANGUAGE == "2060" ;French - Belgium
		StrCpy $1 "fr_BE"
	${EndIf}
	${If} $LANGUAGE == "3084" ;French - Canada
		StrCpy $1 "fr_CA"
	${EndIf}
	${If} $LANGUAGE == "9228" ;French - Democratic Rep. of Congo
		StrCpy $1 "fr_CG"
	${EndIf}
	${If} $LANGUAGE == "4108" ;French - Switzerland
		StrCpy $1 "fr_CH"
	${EndIf}
	${If} $LANGUAGE == "12300" ;French - Cote d'Ivoire
		StrCpy $1 "fr_CI"
	${EndIf}
	${If} $LANGUAGE == "11276" ;French - Cameroon
		StrCpy $1 "fr_CM"
	${EndIf}
	${If} $LANGUAGE == "1036" ;French - France
		StrCpy $1 "fr_FR"
	${EndIf}
	${If} $LANGUAGE == "15372" ;French - Haiti
		StrCpy $1 "fr_HT"
	${EndIf}
	${If} $LANGUAGE == "5132" ;French - Luxembourg
		StrCpy $1 "fr_LU"
	${EndIf}
	${If} $LANGUAGE == "14348" ;French - Morocco
		StrCpy $1 "fr_MA"
	${EndIf}
	${If} $LANGUAGE == "6156" ;French - Monaco
		StrCpy $1 "fr_MC"
	${EndIf}
	${If} $LANGUAGE == "13324" ;French - Mali
		StrCpy $1 "fr_ML"
	${EndIf}
	${If} $LANGUAGE == "8204" ;French - Reunion
		StrCpy $1 "fr_RE"
	${EndIf}
	${If} $LANGUAGE == "10252" ;French - Senegal
		StrCpy $1 "fr_SN"
	${EndIf}
	${If} $LANGUAGE == "1122" ;Frisian - Netherlands
		StrCpy $1 "fy_NL"
	${EndIf}
	${If} $LANGUAGE == "2108" ;Gaelic (Ireland)
		StrCpy $1 "ga_IE"
	${EndIf}
	${If} $LANGUAGE == "1084" ;Gaelic (Scotland)
		StrCpy $1 "gd_GB"
	${EndIf}
	${If} $LANGUAGE == "1110" ;Galician
		StrCpy $1 "gl_ES"
	${EndIf}
	${If} $LANGUAGE == "1140" ;Guarani - Paraguay
		StrCpy $1 "gn_PY"
	${EndIf}
	${If} $LANGUAGE == "1095" ;Gujarati
		StrCpy $1 "gu_IN"
	${EndIf}
	${If} $LANGUAGE == "1128" ;Hausa - Nigeria
		StrCpy $1 "ha_NG"
	${EndIf}
	${If} $LANGUAGE == "1037" ;Hebrew
		StrCpy $1 "he_IL"
	${EndIf}
	${If} $LANGUAGE == "1081" ;Hindi
		StrCpy $1 "hi_IN"
	${EndIf}
	${If} $LANGUAGE == "4122" ;Croatian (Bosnia/Herzegovina)
		StrCpy $1 "hr_BA"
	${EndIf}
	${If} $LANGUAGE == "1050" ;Croatian
		StrCpy $1 "hr_HR"
	${EndIf}
	${If} $LANGUAGE == "1038" ;Hungarian
		StrCpy $1 "hu_HU"
	${EndIf}
	${If} $LANGUAGE == "1067" ;Armenian - Armenia
		StrCpy $1 "hy_AM"
	${EndIf}
	${If} $LANGUAGE == "1057" ;Indonesian
		StrCpy $1 "id_ID"
	${EndIf}
	${If} $LANGUAGE == "1136" ;Igbo - Nigeria
		StrCpy $1 "ig_NG"
	${EndIf}
	${If} $LANGUAGE == "1144" ;Yi
		StrCpy $1 "ii_CN"
	${EndIf}
	${If} $LANGUAGE == "1039" ;Icelandic
		StrCpy $1 "is_IS"
	${EndIf}
	${If} $LANGUAGE == "2064" ;Italian - Switzerland
		StrCpy $1 "it_CH"
	${EndIf}
	${If} $LANGUAGE == "1040" ;Italian - Italy
		StrCpy $1 "it_IT"
	${EndIf}
	${If} $LANGUAGE == "1117" ;Inuktitut
		StrCpy $1 "iu_CA"
	${EndIf}
	${If} $LANGUAGE == "1041" ;Japanese
		StrCpy $1 "ja_JP"
	${EndIf}
	${If} $LANGUAGE == "1079" ;Georgian
		StrCpy $1 "ka_GE"
	${EndIf}
	${If} $LANGUAGE == "1087" ;Kazakh
		StrCpy $1 "kk_KZ"
	${EndIf}
	${If} $LANGUAGE == "1107" ;Khmer
		StrCpy $1 "km_KH"
	${EndIf}
	${If} $LANGUAGE == "1099" ;Kannada
		StrCpy $1 "kn_IN"
	${EndIf}
	${If} $LANGUAGE == "1042" ;Korean
		StrCpy $1 "ko_KR"
	${EndIf}
	${If} $LANGUAGE == "1137" ;Kanuri - Nigeria
		StrCpy $1 "kr_NG"
	${EndIf}
	${If} $LANGUAGE == "1120" ;Kashmiri (Arabic)
		StrCpy $1 "ks_IN"
	${EndIf}
	${If} $LANGUAGE == "2144" ;Kashmiri (Devanagari)
		StrCpy $1 "ks_IN"
	${EndIf}
	${If} $LANGUAGE == "1088" ;Kyrgyz (Cyrillic)
		StrCpy $1 "ky_KG"
	${EndIf}
	${If} $LANGUAGE == "1108" ;Lao
		StrCpy $1 "lo_LA"
	${EndIf}
	${If} $LANGUAGE == "1063" ;Lithuanian
		StrCpy $1 "lt_LT"
	${EndIf}
	${If} $LANGUAGE == "1062" ;Latvian
		StrCpy $1 "lv_LV"
	${EndIf}
	${If} $LANGUAGE == "1153" ;Maori - New Zealand
		StrCpy $1 "mi_NZ"
	${EndIf}
	${If} $LANGUAGE == "1071" ;F.Y.R.O. Macedonian
		StrCpy $1 "mk_MK"
	${EndIf}
	${If} $LANGUAGE == "1100" ;Malayalam
		StrCpy $1 "ml_IN"
	${EndIf}
	${If} $LANGUAGE == "2128" ;Mongolian (Mongolian)
		StrCpy $1 "mn_CN"
	${EndIf}
	${If} $LANGUAGE == "1104" ;Mongolian (Cyrillic)
		StrCpy $1 "mn_MN"
	${EndIf}
	${If} $LANGUAGE == "1102" ;Marathi
		StrCpy $1 "mr_IN"
	${EndIf}
	${If} $LANGUAGE == "2110" ;Malay - Brunei Darussalam
		StrCpy $1 "ms_BN"
	${EndIf}
	${If} $LANGUAGE == "1086" ;Malay - Malaysia
		StrCpy $1 "ms_MY"
	${EndIf}
	${If} $LANGUAGE == "1082" ;Maltese
		StrCpy $1 "mt_MT"
	${EndIf}
	${If} $LANGUAGE == "1109" ;Burmese
		StrCpy $1 "my_MM"
	${EndIf}
	${If} $LANGUAGE == "1044" ;Norwegian (Bokmål)
		StrCpy $1 "nb_NO"
	${EndIf}
	${If} $LANGUAGE == "2145" ;Nepali - India
		StrCpy $1 "ne_IN"
	${EndIf}
	${If} $LANGUAGE == "1121" ;Nepali
		StrCpy $1 "ne_NP"
	${EndIf}
	${If} $LANGUAGE == "2067" ;Dutch - Belgium
		StrCpy $1 "nl_BE"
	${EndIf}
	${If} $LANGUAGE == "1043" ;Dutch - Netherlands
		StrCpy $1 "nl_NL"
	${EndIf}
	${If} $LANGUAGE == "2068" ;Norwegian (Nynorsk)
		StrCpy $1 "nn_NO"
	${EndIf}
	${If} $LANGUAGE == "1096" ;Oriya
		StrCpy $1 "or_IN"
	${EndIf}
	${If} $LANGUAGE == "1094" ;Punjabi
		StrCpy $1 "pa_IN"
	${EndIf}
	${If} $LANGUAGE == "2118" ;Punjabi (Pakistan)
		StrCpy $1 "pa_PK"
	${EndIf}
	${If} $LANGUAGE == "1045" ;Polish
		StrCpy $1 "pl_PL"
	${EndIf}
	${If} $LANGUAGE == "1123" ;Pashto
		StrCpy $1 "ps_AF"
	${EndIf}
	${If} $LANGUAGE == "1046" ;Portuguese - Brazil
		StrCpy $1 "pt_BR"
	${EndIf}
	${If} $LANGUAGE == "2070" ;Portuguese - Portugal
		StrCpy $1 "pt_PT"
	${EndIf}
	${If} $LANGUAGE == "1047" ;Rhaeto_Romanic
		StrCpy $1 "rm_CH"
	${EndIf}
	${If} $LANGUAGE == "2072" ;Romanian - Moldava
		StrCpy $1 "ro_MD"
	${EndIf}
	${If} $LANGUAGE == "1048" ;Romanian
		StrCpy $1 "ro_RO"
	${EndIf}
	${If} $LANGUAGE == "2073" ;Russian - Moldava
		StrCpy $1 "ru_MD"
	${EndIf}
	${If} $LANGUAGE == "1049" ;Russian
		StrCpy $1 "ru_RU"
	${EndIf}
	${If} $LANGUAGE == "1103" ;Sanskrit
		StrCpy $1 "sa_IN"
	${EndIf}
	${If} $LANGUAGE == "1113" ;Sindhi - India
		StrCpy $1 "sd_IN"
	${EndIf}
	${If} $LANGUAGE == "2137" ;Sindhi - Pakistan
		StrCpy $1 "sd_PK"
	${EndIf}
	${If} $LANGUAGE == "1083" ;Sami
		StrCpy $1 "se_NO"
	${EndIf}
	${If} $LANGUAGE == "1115" ;Sinhalese - Sri Lanka
		StrCpy $1 "si_LK"
	${EndIf}
	${If} $LANGUAGE == "1051" ;Slovak
		StrCpy $1 "sk_SK"
	${EndIf}
	${If} $LANGUAGE == "1060" ;Slovenian
		StrCpy $1 "sl_SI"
	${EndIf}
	${If} $LANGUAGE == "1143" ;Somali
		StrCpy $1 "so_SO"
	${EndIf}
	${If} $LANGUAGE == "1052" ;Albanian - Albania
		StrCpy $1 "sq_AL"
	${EndIf}
	${If} $LANGUAGE == "2074" ;Serbian (Latin)
		StrCpy $1 "sr_CS"
	${EndIf}
	${If} $LANGUAGE == "3098" ;Serbian (Cyrillic)
		StrCpy $1 "sr_CS"
	${EndIf}
	${If} $LANGUAGE == "1072" ;Sutu
		StrCpy $1 "st_ZA"
	${EndIf}
	${If} $LANGUAGE == "2077" ;Swedish - Finland
		StrCpy $1 "sv_FI"
	${EndIf}
	${If} $LANGUAGE == "1053" ;Swedish
		StrCpy $1 "sv_SE"
	${EndIf}
	${If} $LANGUAGE == "1089" ;Swahili
		StrCpy $1 "sw_KE"
	${EndIf}
	${If} $LANGUAGE == "1097" ;Tamil
		StrCpy $1 "ta_IN"
	${EndIf}
	${If} $LANGUAGE == "1098" ;Telugu
		StrCpy $1 "te_IN"
	${EndIf}
	${If} $LANGUAGE == "1064" ;Tajik
		StrCpy $1 "tg_TJ"
	${EndIf}
	${If} $LANGUAGE == "1054" ;Thai
		StrCpy $1 "th_TH"
	${EndIf}
	${If} $LANGUAGE == "1139" ;Tigrigna - Ethiopia
		StrCpy $1 "ti_ER"
	${EndIf}
	${If} $LANGUAGE == "2163" ;Tigrigna - Eritrea
		StrCpy $1 "ti_ET"
	${EndIf}
	${If} $LANGUAGE == "1090" ;Turkmen
		StrCpy $1 "tk_TM"
	${EndIf}
	${If} $LANGUAGE == "1074" ;Tswana
		StrCpy $1 "tn_ZA"
	${EndIf}
	${If} $LANGUAGE == "1055" ;Turkish
		StrCpy $1 "tr_TR"
	${EndIf}
	${If} $LANGUAGE == "1073" ;Tsonga
		StrCpy $1 "ts_ZA"
	${EndIf}
	${If} $LANGUAGE == "1092" ;Tatar
		StrCpy $1 "tt_RU"
	${EndIf}
	${If} $LANGUAGE == "1152" ;Uighur - China
		StrCpy $1 "ug_CN"
	${EndIf}
	${If} $LANGUAGE == "1058" ;Ukrainian
		StrCpy $1 "uk_UA"
	${EndIf}
	${If} $LANGUAGE == "2080" ;Urdu - India
		StrCpy $1 "ur_IN"
	${EndIf}
	${If} $LANGUAGE == "1056" ;Urdu - Pakistan
		StrCpy $1 "ur_PK"
	${EndIf}
	${If} $LANGUAGE == "1091" ;Uzbek (Latin)
		StrCpy $1 "uz_UZ"
	${EndIf}
	${If} $LANGUAGE == "2115" ;Uzbek (Cyrillic)
		StrCpy $1 "uz_UZ"
	${EndIf}
	${If} $LANGUAGE == "1066" ;Vietnamese
		StrCpy $1 "vi_VN"
	${EndIf}
	${If} $LANGUAGE == "1076" ;Xhosa
		StrCpy $1 "xh_ZA"
	${EndIf}
	${If} $LANGUAGE == "1130" ;Yoruba
		StrCpy $1 "yo_NG"
	${EndIf}
	${If} $LANGUAGE == "2052" ;Chinese - People's Republic of China
		StrCpy $1 "zh_CN"
	${EndIf}
	${If} $LANGUAGE == "3076" ;Chinese - Hong Kong SAR
		StrCpy $1 "zh_HK"
	${EndIf}
	${If} $LANGUAGE == "5124" ;Chinese - Macao SAR
		StrCpy $1 "zh_MO"
	${EndIf}
	${If} $LANGUAGE == "4100" ;Chinese - Singapore
		StrCpy $1 "zh_SG"
	${EndIf}
	${If} $LANGUAGE == "1028" ;Chinese - Taiwan
		StrCpy $1 "zh_TW"
	${EndIf}
	${If} $LANGUAGE == "1077" ;Zulu
		StrCpy $1 "zu_ZA"
	${EndIf}
	${If} $1 == "NotDone" ;Fallback to English
		StrCpy $1 "en_US"
	${EndIf}
	CreateDirectory "$INSTDIR\Data\.abdm\config"
	FileOpen $2 "$INSTDIR\Data\.abdm\config\appSettings.json" w ;Opens a Empty File and fills it
	FileWrite $2 "{$\n"
	FileWrite $2 "    $\"language$\": $\"$1$\",$\n"
	FileWrite $2 "    $\"defaultDownloadFolder$\": $\"./Data/Downloads$\"$\n"
	FileWrite $2 "}"
	FileClose $2 ;Closes the filled file
!macroend
