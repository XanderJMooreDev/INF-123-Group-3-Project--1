if room == room_test{
	audio_play_sound(Planet_Base,10,true);
}
else if room != room_test{
	audio_stop_sound(Planet_Base);
}

if room == Room2{
	audio_play_sound(Planet_Astro,10,true);
}
else if room != Room2{
	audio_stop_sound(Planet_Astro);
}