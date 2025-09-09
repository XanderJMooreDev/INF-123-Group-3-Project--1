if hp <= 0 {
	return;
}


instance_create_layer(64,random_range(50,300),"Instances",obj_boss_projectile);
instance_create_layer(64,random_range(301,480),"Instances",obj_boss_projectile);
instance_create_layer(64,random_range(481,580),"Instances",obj_boss_projectile);

sprite_index = spr_boss_inhale;

alarm[0] = random_range(180,240);