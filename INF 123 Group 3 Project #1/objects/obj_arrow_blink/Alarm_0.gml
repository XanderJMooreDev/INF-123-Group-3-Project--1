blinks++;

visible = !visible;	

if blinks == 8 {
	instance_destroy();
}

alarm[0] = 30;