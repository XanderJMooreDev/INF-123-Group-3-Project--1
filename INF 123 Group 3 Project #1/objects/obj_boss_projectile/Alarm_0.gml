blinks++;

visible = !visible;	

if blinks == 8 {
	x = -30;
	sprite_index = spr_placeholder_box;
	velocityX = 20;
}
else {
	alarm[0] = 10;
}