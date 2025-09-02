RUN_SPEED = 2;
JUMP_STRENGTH = 20;
TERMINAL_SPEED = 20; // the fastest the player can fall
TERMINAL_SPEED_X = 5;
SLOWDOWN = .8;

wallJumpTimer = 0;
wallJumpJoystick = 0;

respawnX = 512;
respawnY = 320;

// Makes the player appear yellow. Can be removed when we have a proper sprite
image_blend = make_color_rgb(255, 255, 0);

joystick = 0;

weight = 1; // how fast the player falls
coyoteTime = 0; // Frames since the player touched the ground

velocityX = 0; // How fast the player is falling. Positive moves them down, negative is moving up
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
	
	if wallJumpTimer > 0 {
		joystick = wallJumpJoystick;
	}
	
	velocityX += joystick * RUN_SPEED;
	
	if velocityX > TERMINAL_SPEED_X {
		velocityX = TERMINAL_SPEED_X;
	}
	else if velocityX < -TERMINAL_SPEED_X {
		velocityX = -TERMINAL_SPEED_X;
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
	
	if space_is_free(velocityX, 0) {
		x += velocityX;
	}
	else if keyboard_check(jumpKey) && coyoteTime > 10 && wallJumpTimer <= 0 {
		velocityY = -JUMP_STRENGTH;
		wallJumpJoystick = -joystick;
		
		if space_is_free(velocityX, 0) {
			x += velocityX;
		}
		
		wallJumpTimer = .4;
	}
	else {
		velocityX = 0;
	}
	
	coyoteTime++;
	velocityY += weight;
	velocityX *= SLOWDOWN;
	
	if wallJumpTimer > 0 {
	wallJumpTimer -= 1 / game_get_speed(gamespeed_fps);
	}
	
	if velocityY > TERMINAL_SPEED {
		velocityY = TERMINAL_SPEED;
	}
	
	if y > 800 {
		x = respawnX;
		y = respawnY;
	}
}