; locations
;------------------------

_VRAM	EQU		$8000
_SCRN0	EQU		$9800
_HRAM	EQU		$ff80
_OAMRAM		EQU	$fe00


; Hardware registers
;------------------------

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
rIE		EQU		$ffff

; Masks

mBgPalette	EQU		%11100100
