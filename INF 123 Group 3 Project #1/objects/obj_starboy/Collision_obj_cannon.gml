if cannoning == "Ready" {
	instance_destroy(other);
	
	cannoning = "Aim";

	alarm[0] = 60;
}