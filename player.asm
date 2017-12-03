SECTION "Player", ROM0

PLAYER_INIT::
	ld a, $20
	ld [player_y], a
	ret

PLAYER_UPDATE::
	ld hl, player_y
	ld a, [hl]
	inc a
	ld [hl], a

	call PLAYER_OAM
	ret

PLAYER_OAM:
	ld hl, player_sprite
	ld a, [player_y]
	ld [hl], a
	inc hl
	ld [hl], $30
	inc hl
	ld [hl], $19
	inc hl
	ld [hl], 0
	ret
