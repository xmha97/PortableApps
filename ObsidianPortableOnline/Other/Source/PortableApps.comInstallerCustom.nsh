Var customUpgradeFromRegistryVersion

!macro CustomCodePostInstall
	${If} ${FileExists} "$INSTDIR\Data\settings\config\*.*"
	${AndIfNot} ${FileExists} "$INSTDIR\Data\library\*.*"
		CreateDirectory "$INSTDIR\Data\library"
	${EndIf}
!macroend