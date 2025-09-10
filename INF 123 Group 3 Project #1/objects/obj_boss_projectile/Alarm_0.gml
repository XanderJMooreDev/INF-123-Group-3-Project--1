blinks++;

visible = !visible;	

if blinks == 8 {
	x = -30;
	image_xscale = .1;
	image_yscale = .1;
	
	if random(2) == 1 {
		sprite_index = spr_spacerock_1;
	}
	else if random(2) == 1 {
		sprite_index = spr_spacerock_2;
	}
	else {
		sprite_index = spr_spacerock_3;
	}
	velocityX = 20;
}
else {
	alarm[0] = 10;
}