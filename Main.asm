; Base game template
; This file was auto generated
; It is common to move out all of the header info
; out into another file and include it

;---------------------------
;includes
;---------------------------

INCLUDE "constants.asm"

;---------------------------
;restart sections
;---------------------------

SECTION "Restart $00", ROM0[$00]
	ret

SECTION "Restart $08", ROM0[$08]
	ret

SECTION "Restart $10", ROM0[$10]
	ret

SECTION "Restart $18", ROM0[$18]
	ret

SECTION "Restart $20", ROM0[$20]
	ret

SECTION "Restart $28", ROM0[$28]
	ret

SECTION "Restart $30", ROM0[$30]
	ret

SECTION "Restart $38", ROM0[$38]
	ret

;---------------------------
;interrupt table
;---------------------------

SECTION "V-Blank Interrupt", ROM0[$40]
	jp VBlankInterrupt

SECTION "LCD Status Interrupt", ROM0[$48]
	jp LCDInterrupt

SECTION "Timer Interrupt", ROM0[$50]
	jp TimerInterrupt

SECTION "Serial Interrupt", ROM0[$58]
	jp SerialInterrupt

SECTION "Joypad Intterupt", ROM0[$60]
	jp JoypadInterrupt

;---------------------------
;Entrypoint into main program
;---------------------------

SECTION "Entrypoint", ROM0[$100]
	nop
	jp 	Main

;---------------------------
;ROM information
;---------------------------

SECTION "Rom Header", ROM0[$104]
	
; $0104 - $0133: Nintendo logo

	DB  $CE,$ED,$66,$66,$CC,$0D,$00,$0B,$03,$73,$00,$83,$00,$0C,$00,$0D
	DB  $00,$08,$11,$1F,$88,$89,$00,$0E,$DC,$CC,$6E,$E6,$DD,$DD,$D9,$99
	DB  $BB,$BB,$67,$63,$6E,$0E,$EC,$CC,$DD,$DC,$99,$9F,$BB,$B9,$33,$3E

; $0134 - $0142: Game title
; 16 uppercase ASCII characters
; must pad with 0s

	DB	"TEMPLATE",0,0,0,0,0,0,0,0

; $0143: Gameboy Color compatibility
; $00 = Gameboy
; $80 = Color Gameboy

	DB	$00

; $0144: High nibble of licensee code
; normall $00 if [$014B] != $33

	DB	$00

; $0145: Low nibble of licensee code
; normall $00 if [$014B] != $33

	DB	$00

; $0146: GB/SGB Indicator
; $00 = Gameboy
; $03 = Super Gameboy

	DB	$00

; $0147: Cartridge type
; $00 = ROM ONLY

	DB	$00

; $0148: ROM size
; $00 = 32KB

	DB	$00

; $0149: RAM size
; $00 = none

	DB	$00

; $014A: Destination code
; $00 = Japan
; $01 = All others

	DB	$01

; $014B: Licensee code
; must be $33

	DB	$33

; $014C: Mask ROM version - RGBFIX takes care of this

	DB	$00

; $014D: Mask ROM version - RGBFIX takes care of this

	DB $00

; $014E: Mask ROM version - RGBFIX takes care of this

	DB $00

;---------------------------
;main program
;---------------------------

SECTION "Program Start", ROM0[$150]

Main::

	DI					;disable interrupts

	LD sp, $FFFE		;reset stack pointer

	LD a, mSetLowBit	;force vblank interrupt
	LD [rIE], a
	EI

.main_loop
	
	INC A
	nop

	jp .main_loop



;---------------------------
;interrupt service routines
;---------------------------
VBlankInterrupt:
	reti
LCDInterrupt:
	reti
TimerInterrupt:
	reti
SerialInterrupt:
	reti
JoypadInterrupt:
	reti