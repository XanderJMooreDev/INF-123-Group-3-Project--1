if place_meeting(x + velocityX, y, obj_placeholder_terrain) {
	velocityX *= -1;
}

image_xscale = velocityX / 8;

x += velocityX;