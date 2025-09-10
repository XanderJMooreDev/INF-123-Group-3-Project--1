hp = 30;
phase++;
hurting = false;

sprite_index = spr_boss_idle;

if phase == 5 {
	alarm[2] = 10;
}
else {
	alarm[0] = 120;
}