<<<<<<< Updated upstream
RUN_SPEED = 2;
JUMP_STRENGTH = 20;
TERMINAL_SPEED = 20; // the fastest the player can fall
TERMINAL_SPEED_X = 5;
SLOWDOWN = .8;

shootingDir = 0;
shootCountdown = 0;
wallJumpTimer = 0;
wallJumpJoystick = 0;
=======
RUN_SPEED = 8;
JUMP_STRENGTH = 20;
TERMINAL_SPEED = 20; // the fastest the player can fall
>>>>>>> Stashed changes

respawnX = 512;
respawnY = 320;

// Makes the player appear yellow. Can be removed when we have a proper sprite
image_blend = make_color_rgb(255, 255, 0);

joystick = 0;

weight = 1; // how fast the player falls
coyoteTime = 0; // Frames since the player touched the ground

<<<<<<< Updated upstream
velocityX = 0; // How fast the player is falling. Positive moves them down, negative is moving up
=======
>>>>>>> Stashed changes
velocityY = 0; // How fast the player is falling. Positive moves them down, negative is moving up

jumpKey = ord("W"); // Allows us to change the player controls as we need
leftKey = ord("A");
rightKey = ord("D");
<<<<<<< Updated upstream
shootKey = vk_space;
=======
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
		facingDir = joystick;
		if audio_is_playing(Player_Steps){
		}
		else{
			audio_play_sound(Player_Steps,8,false);
		}
	}
	if keyboard_check_released(leftKey){
		audio_stop_sound(Player_Steps);
=======
>>>>>>> Stashed changes
	}
	
	if keyboard_check(rightKey) {
		joystick += 1;
<<<<<<< Updated upstream
		facingDir = joystick;
		if audio_is_playing(Player_Steps){
		}
		else{
			audio_play_sound(Player_Steps,8,false);
		}
	}
	if keyboard_check_released(rightKey){
		audio_stop_sound(Player_Steps);	
=======
>>>>>>> Stashed changes
	}
	// The above code checks whether the player wants to move left, right,
	// or is pressing both, which will do the same as pressing neither.
	
<<<<<<< Updated upstream
	if wallJumpTimer > 0 {
		joystick = wallJumpJoystick;
	}
	
	velocityX += joystick * RUN_SPEED;
	
	if velocityX > TERMINAL_SPEED_X {
		velocityX = TERMINAL_SPEED_X;
	}
	else if velocityX < -TERMINAL_SPEED_X {
		velocityX = -TERMINAL_SPEED_X;
=======
	if space_is_free(joystick * RUN_SPEED, 0) {
		x += joystick * RUN_SPEED;
>>>>>>> Stashed changes
	}
	
	if keyboard_check(jumpKey) && coyoteTime < 5 {
		velocityY = -JUMP_STRENGTH;
<<<<<<< Updated upstream
		audio_play_sound(Player_Jump,8,false);
=======
>>>>>>> Stashed changes
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
	
<<<<<<< Updated upstream
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
	
	if shootCountdown > 0 {
		shootCountdown -= 1 / game_get_speed(gamespeed_fps);
	}
=======
	coyoteTime++;
	velocityY += weight;
>>>>>>> Stashed changes
	
	if velocityY > TERMINAL_SPEED {
		velocityY = TERMINAL_SPEED;
	}
	
<<<<<<< Updated upstream
	if keyboard_check(shootKey) && shootCountdown <= 0 {
		shootCountdown = 1;
		bullet = instance_create_layer(x, y + 20, "Instances", obj_bullet);
		bullet.facingDir = facingDir;
		audio_play_sound(Player_Projectile,10,false);
	}
	
	if y > 800 || place_meeting(x, y, obj_enemy) {
=======
	if y > 800 {
>>>>>>> Stashed changes
		x = respawnX;
		y = respawnY;
	}
}