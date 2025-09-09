if cannoning == "Ready" {
	movement_update();
}
else if cannoning == "Aim" {	
	timeSinceSpin += 7 / game_get_speed(gamespeed_fps);
}
else {
	y -= velocityY;
	velocityY++;
}