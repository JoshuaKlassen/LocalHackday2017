; locations
lVRAM			EQU		$8000
lSCRN0	EQU		$9800

; Hardware registers



OAMRAM		EQU	$fe00
rUSER_IO	EQU	$ff00


_spr0_y		equ		OAMRAM
_spr0_x		equ		OAMRAM+1
_spr0_num		equ		OAMRAM+2
_spr0_att		equ		OAMRAM+3

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
