if room == room1 {
	audio_stop_all();
	audio_play_sound(Level2, 7, true);
}
else if room == room_boss_fight {
	audio_stop_all();
	audio_play_sound(Boss_Music, 7, true);
}