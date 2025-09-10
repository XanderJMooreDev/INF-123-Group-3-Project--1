show_debug_message(hp);

if hp <= 0 {
	sprite_index = spr_boss_open;
}
else if phase == 5 || (!audio_is_playing(Boss_Vacuum) && hurting) {
	sprite_index = spr_boss_hurt;
}
else if !audio_is_playing(Boss_Vacuum) && !hurting {
	sprite_index = spr_boss_idle;
}
else if audio_is_playing(Boss_Vacuum) && hurting {
	sprite_index = spr_boss_hurt_inhale;
}
else if audio_is_playing(Boss_Vacuum) && !hurting {
	sprite_index = spr_boss_inhale;
}