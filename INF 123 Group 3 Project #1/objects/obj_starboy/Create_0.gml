RUN_SPEED = 2;
JUMP_STRENGTH = 10;
TERMINAL_SPEED = 10; // the fastest the player can fall
TERMINAL_SPEED_X = 5;
SLOWDOWN = .8;

shootingDir = 1;
facingDir = 1;
shootCountdown = 0;
wallJumpTimer = 0;
wallJumpJoystick = 0;
canSpin=true;
timeSinceSpin = 5;
cannoning = "Ready";

animationFrame = 0;

state = "Standing";

standSprite = spr_idle_pose;
walkSprite = spr_walk_pose;
spinSprite = spr_spin_pose;
jumpSprite = spr_jump;
fallSprite = spr_jump;
shootSprite = spr_shoot_pose;

spriteToUse = standSprite;
spriteFrame = 0;

respawnX = 160;
respawnY = 672;
respawnRoom = room1;

joystick = 0;

weight = .25; // how fast the player falls
coyoteTime = 0; // Frames since the player touched the ground

velocityX = 0; // How fast the player is falling. Positive moves them down, negative is moving up
velocityY = 0; // How fast the player is falling. Positive moves them down, negative is moving up

jumpKey = vk_space; // Allows us to change the player controls as we need
leftKey = ord("A");
rightKey = ord("D");
shootKey = ord("E");

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
		facingDir = joystick;
	}
	
	if keyboard_check(rightKey) {
		joystick += 1;
		facingDir = joystick;
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
			canSpin = true;
		}
		
		// If we collide with a platform, up or down, we set movement to 0 to avoid sticking. 
		velocityY = 0;
	}
	
	if space_is_free(velocityX, 0) {
		if coyoteTime > 20 && keyboard_check(jumpKey) && canSpin && wallJumpTimer < .1
		{
			canSpin=false;
			timeSinceSpin = 0;
			velocityY=-7.5;
		
			effect_create_layer("Instances", ef_star, x + 30, y + 35, 20, c_yellow);
			effect_create_layer("Instances", ef_star, x + 30, y + 10, 10, c_yellow);
			effect_create_layer("Instances", ef_star, x + 60, y + 40, 10, c_yellow);
			effect_create_layer("Instances", ef_star, x, y + 40, 10, c_yellow);
			effect_create_layer("Instances", ef_star, x + 45, y + 80, 10, c_yellow);
			effect_create_layer("Instances", ef_star, x + 15, y + 80, 10, c_yellow);
		
		}
		
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
	if shootCountdown > .3 {
		state = "Shooting";
	}
	else if coyoteTime < 8 {
		if joystick = 0 {
			state = "Standing";
		}
		else {
			state = "Walking";
		}
	}
	else if velocityY > 0 {
		state = "Falling";
	}
	else if timeSinceSpin < 1 {
		state = "Spinning";
	}
	else {
		state = "Jumping";
	}
	
	if wallJumpTimer > 0 {
		wallJumpTimer -= 1 / game_get_speed(gamespeed_fps);
	}
	
	if shootCountdown > 0 {
		shootCountdown -= 1 / game_get_speed(gamespeed_fps);
	}

	animationFrame += 10 / game_get_speed(gamespeed_fps);
	timeSinceSpin += 7 / game_get_speed(gamespeed_fps);

	if velocityY > TERMINAL_SPEED {
		velocityY = TERMINAL_SPEED;
	}
	
	if keyboard_check(shootKey) && shootCountdown <= 0 {
		shootCountdown = .5;
		bullet = instance_create_layer(x + 30 * facingDir, y + 20, "Instances", obj_bullet);
		bullet.facingDir = facingDir;
	}
	
	if place_meeting(x, y, obj_vertical_enemy) || place_meeting(x, y, obj_horizontal_enemy) || place_meeting(x, y, obj_bullet_enemy) || place_meeting(x, y, obj_boss_projectile) {
		if state != "Spinning" {
			death();
		}
	}
	
	if y<0
	{
		room_goto_next();
		y=799
	}
	
	if y>800
	{
		if room == room1 {
			death();
		}
		else {
			room_goto_previous();
			y=1
		}
	}
}

death = function() {
	room = respawnRoom;
	x = respawnX;
	y = respawnY;
}