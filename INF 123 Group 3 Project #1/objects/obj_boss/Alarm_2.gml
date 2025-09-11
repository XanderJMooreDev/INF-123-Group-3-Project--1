if hp > 0 {
	hp--;
	effect_create_layer("Instances", ef_explosion, random(1300), random(750), 10, c_red);
	audio_play_sound(Explosion, 4, false);
	alarm[2] = 10;
	obj_starboy.image_alpha += .4;
}
else {
	room_goto(room_victory);
}