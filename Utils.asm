SECTION "Utils", ROM0

WAIT_VBLANK::
	ld a, [rLY]			;load y cord of scanline
	cp 145				;line 145 = we are in vblank
	jr nz, WAIT_VBLANK
	ret

CLEAR_SCREEN::
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

CLEAR_OAM:
	ld hl, OAMRAM
	ld bc, $A0		;160

.clear_oam_loop
	ld a, $0
	ld [hli], a
	dec bc
	ld a,b
	or c
	jr nz, .clear_oam_loop
	ret

CLEAR_RAM:
	ld hl, $C100
	ld bc, $A0
.clear_ram_loop
	ld a, $0
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .clear_ram_loop
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

LOAD_TILES::
	push af						;store af
	push de						;store de

	ld de, lVRAM				;load location of vram

.load_tile_loop
	ld a,[hl]					;load value at hl into a
	inc hl						;increment hl
	ld [de], a					;load value of a into address at de
	inc de						;increment de
	dec bc						;decrement tile count
	ld a,b						
	or c
	jr nz, .load_tile_loop

	pop de						;restore de
	pop af						;restore af

	ret

;LOAD_MAP::
;	ld hl, Hello_Map
;	ld de, lSCRN0
;	ld c, 13
.load_map_loop
;	ld a,[hl]
;	inc hl
;	ld [de], a
;	inc de
;	dec c
;	jr nz, .load_map_loop
;	ret


LCD_OFF::
	
	ld a, [rLCDC]
	res 7, a
	ld [rLCDC], a
	ret

LCD_ON::

	ld a, [rLCDC]
	set 7, a
	ld [rLCDC], a
	ret

dma_routine:
  	ld      a, $C1
  	ld      [$FF46], a
  	ld      a, $28
.loop:
  	dec     a
  	jr      nz, .loop
  	ret


COPY_DMA_ROUTINE:
	ld 	hl, dma_routine
	ld 	de, _HRAM
	ld 	c, $13

.copy_dma_routine
	ld 	a, [hli]
	ld [de], a
	inc de
	dec c
	ld 	a, b
	or	c
	jp	nz, .copy_dma_routine

	ret