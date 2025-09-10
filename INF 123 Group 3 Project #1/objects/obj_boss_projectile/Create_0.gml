sprite_index = spr_exclam;
image_xscale = .25;
image_yscale = .25;
visible = true;
blinks = 0;
velocityX = 0;

if random(2) == 1 {
	sprite_index = spr_spacerock_1;
}
else if random(2) == 1 {
	sprite_index = spr_spacerock_2;
}
else {
	sprite_index = spr_spacerock_3;
}

alarm[0] = 10;