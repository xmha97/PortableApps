${SegmentFile}
!include WinMessages.nsh

${Segment.onInit}
	CreateDirectory "$INSTDIR\App\Psiphon\psiphon3.exe.orig"
!macroend
