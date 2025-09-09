hp--;
instance_destroy(other);
sprite_index = spr_boss_core_hit;
alarm[0] = 30;

if (hp <= 0) {
	room_goto(room_boss_fight);
}