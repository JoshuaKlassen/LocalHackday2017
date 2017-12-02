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

.init

	DI					;disable interrupts

	LD sp, $FFFE		;reset stack pointer

	call WAIT_VBLANK
	call LCD_OFF

	call CLEAR_SCREEN

	LD a, mBgPalette	;load our palette
	LD [rBGP], a

	ld hl, Hello_Tiles
	ld bc, 9*16
	call LOAD_TILE

	call LOAD_MAP

	call LCD_ON

	EI

.main_loop
	
	halt
	nop

	jp .main_loop


WAIT_VBLANK::
	ld a, [rLY]			;load y cord of scanline
	cp 145				;line 145 = we are in vblank
	jr nz, WAIT_VBLANK
	ret

UPDATE_GAME:
	ret

CLEAR_SCREEN:
	ld hl, lSCRN0
	ld bc, 32*32
.clear_screen_loop
	ld a,$0
	ldi [hl], a
	dec bc
	ld a, b
	or c
	jr nz, .clear_screen_loop

	ret

;----------------------------
;LOAD_TILE
;
; loads a tile into VRAM
; parameters: 
;		hl: start of tile(s)
; 		bc: number of bytes
;
;----------------------------

LOAD_TILE:
	push af
	push de

	ld de, lVRAM

.load_tile_loop
	ld a,[hl]
	inc hl
	ld [de], a
	inc de
	dec bc
	ld a,b
	or c
	jr nz, .load_tile_loop

	pop de
	pop af

	ret

LOAD_MAP:
	ld hl, Hello_Map
	ld de, lSCRN0
	ld c, 5
.load_map_loop
	ld a,[hl]
	inc hl
	ld [de], a
	inc de
	dec c
	jr nz, .load_map_loop
	ret


LCD_OFF:
	
	ld a, [rLCDC]
	res 7, a
	ld [rLCDC], a
	ret

LCD_ON:

	ld a, [rLCDC]
	set 7, a
	ld [rLCDC], a
	ret

My_Tile:
DB $7C,$7C,$00,$C6,$C6,$00,$00,$FE,$C6,$C6,$00,$C6,$C6,$00,$00,$00

Hello_Tiles:
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $00,$00,$00,$00,$00,$00,$00,$00
DB $C6,$C6,$C6,$C6,$C6,$C6,$FE,$FE
DB $FE,$FE,$C6,$C6,$C6,$C6,$C6,$C6
DB $FE,$FE,$FE,$FE,$80,$80,$F8,$F8
DB $F8,$F8,$80,$80,$FE,$FE,$FE,$FE
DB $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0
DB $C0,$C0,$C0,$C0,$FE,$FE,$FE,$FE
DB $7C,$7C,$FE,$FE,$C6,$C6,$C6,$C6
DB $C6,$C6,$C6,$C6,$FE,$FE,$7C,$7C
DB $C6,$C6,$C6,$C6,$C6,$C6,$C6,$C6
DB $D6,$D6,$D6,$D6,$FE,$FE,$6C,$6C
DB $FC,$FC,$FE,$FE,$C6,$C6,$FC,$FC
DB $FC,$FC,$C6,$C6,$C6,$C6,$C6,$C6
DB $FC,$FC,$FE,$FE,$C6,$C6,$C6,$C6
DB $C6,$C6,$C6,$C6,$FE,$FE,$FC,$FC
DB $6C,$6C,$6C,$6C,$6C,$6C,$6C,$6C
DB $6C,$6C,$6C,$6C,$00,$00,$6C,$6C

Hello_Map:
DB $01,$02,$03,$03,$04

;---------------------------
;interrupt service routines
;---------------------------
VBlankInterrupt:

	PUSH af				;save regs
	PUSH bc

	POP bc				;load regs
	POP af

	reti
LCDInterrupt:
	reti
TimerInterrupt:
	reti
SerialInterrupt:
	reti
JoypadInterrupt:
	reti