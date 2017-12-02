; locations
lVRAM			EQU		$8000
lSCRN0	EQU		$9800

; Hardware registers

rLCDC 	EQU 	$ff40
rSTAT	EQU		$ff41
rSCY 	EQU		$ff42
rSCX	EQU		$ff43
rLY		EQU		$ff44
rLYC	EQU		$ff45
rBGP	EQU		$ff47

rWY		EQU		$ff4a

rIE		EQU		$ffff

; Masks

mSetLowBit	EQU		%00000001
mBgPalette	EQU		%11100100
