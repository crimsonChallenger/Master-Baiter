var fish = other

if (fish != noone && !fish.CaughtYa) {
	fish.image_alpha = 1;
	fish.image_blend = c_white
	obj_fish_spawner.fish_count -= 1;
	array_push(fish_caught, fish.sprite_index)
	fish.CaughtYa = true
}




