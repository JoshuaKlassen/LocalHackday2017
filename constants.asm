; locations
lVRAM			EQU		$8000
lSCRN0	EQU		$9800

; Hardware registers



OAMRAM		EQU	$fe00
rUSER_IO	EQU	$ff00

rLCDC 	EQU 	$ff40
rSTAT	EQU		$ff41
rSCY 	EQU		$ff42
rSCX	EQU		$ff43
rLY		EQU		$ff44
rLYC	EQU		$ff45
rDMA	EQU		$ff46
rBGP	EQU		$ff47

rWY		EQU		$ff4a

_HRAM	EQU		$ff80

rIE		EQU		$ffff

; Masks

mSetLowBit	EQU		%00000001
mBgPalette	EQU		%11100100
