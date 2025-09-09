hp = 30;
phase++;

sprite_index = spr_boss_idle;

if phase == 4 {
	room_goto(room_victory);
}