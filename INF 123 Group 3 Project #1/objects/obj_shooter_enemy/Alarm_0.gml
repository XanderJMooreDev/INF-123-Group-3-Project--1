bullet = instance_create_layer(x + 30 * facingDir, y + 20, "Instances", obj_bullet_enemy);
bullet.facingDir = facingDir;
audio_play_sound(Enemy_Projectile,8,false);
alarm[0] = 60;