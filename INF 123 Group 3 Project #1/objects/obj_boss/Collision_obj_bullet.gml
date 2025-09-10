if hp <= 0 {
	return;
}

audio_play_sound(Player_Death,10,false);

hp--;
instance_destroy(other);

if sprite_index == spr_boss_idle {
	sprite_index = spr_boss_hurt;
}
else if sprite_index == spr_boss_inhale {
	sprite_index = spr_boss_hurt_inhale;
}

hurting = true;
alarm[1] = 30;

if hp == 0 {
	instance_create_layer(700, 352, "Instances", obj_arrow_blink);
	sprite_index = spr_boss_open;
}