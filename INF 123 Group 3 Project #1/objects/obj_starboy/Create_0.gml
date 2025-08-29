RUN_SPEED = 8;
JUMP_STRENGTH = 20;
TERMINAL_SPEED = 20; // the fastest the player can fall

respawnX = 512;
respawnY = 320;

// Makes the player appear yellow. Can be removed when we have a proper sprite
image_blend = make_color_rgb(255, 255, 0);

joystick = 0;

weight = 1; // how fast the player falls
coyoteTime = 0; // Frames since the player touched the ground

velocityY = 0; // How fast the player is falling. Positive moves them down, negative is moving up

jumpKey = ord("W"); // Allows us to change the player controls as we need
leftKey = ord("A");
rightKey = ord("D");

// This function checks if a specified location triggers a collision with specified
// objects. 
space_is_free = function(changeX, changeY) {
	return !place_meeting(x + changeX, y + changeY, obj_placeholder_terrain);
}

// Checks for player input and moves the player accordingly. 
movement_update = function() {
	joystick = 0;
	
	if keyboard_check(leftKey) {
		joystick -= 1;
	}
	
	if keyboard_check(rightKey) {
		joystick += 1;
	}
	// The above code checks whether the player wants to move left, right,
	// or is pressing both, which will do the same as pressing neither.
	
	if space_is_free(joystick * RUN_SPEED, 0) {
		x += joystick * RUN_SPEED;
	}
	
	if keyboard_check(jumpKey) && coyoteTime < 5 {
		velocityY = -JUMP_STRENGTH;
	}
	
	if space_is_free(0, velocityY) {
		// Checks if the player can move to that spot
		y += velocityY;
	}
	else {
		// If they can't, we see if they're moving up or down. 
		if velocityY > 0 {
			// If they're moving down, we tell the player that they've touched the ground
			coyoteTime = 0;
		}
		
		// If we collide with a platform, up or down, we set movement to 0 to avoid sticking. 
		velocityY = 0;
	}
	
	coyoteTime++;
	velocityY += weight;
	
	if velocityY > TERMINAL_SPEED {
		velocityY = TERMINAL_SPEED;
	}
	
	if y > 800 {
		x = respawnX;
		y = respawnY;
	}
}