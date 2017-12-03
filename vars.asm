;----------------
; RAM variables
;----------------

SECTION "RAM Vars", WRAM0[$C000]

player_x: 	DB
player_y:	DB

SECTION "OAM Vars", WRAM0[$C100]

player_sprite:	DS	4