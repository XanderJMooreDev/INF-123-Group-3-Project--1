//if y > maxY {
//	velocityY = -4;
//}
//
//if y < minY {
//	velocityY = +4;
//}

if place_meeting(x, y + velocityY, obj_placeholder_terrain) {
	velocityY *= -1;
}

y+= velocityY;