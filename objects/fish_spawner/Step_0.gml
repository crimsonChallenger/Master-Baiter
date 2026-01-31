fish_timer -= 1 / game_get_speed(gamespeed_fps)

if (fish_timer < 0) {
	var fish_sprite = common_1

	var fish_x = irandom_range(global.spawn_margin, room_width - global.spawn_margin)
	var fish_y = irandom_range(global.spawn_margin, room_height - global.spawn_margin)
	
	var fish = instance_create_layer(fish_x, fish_y, "Fish", fish_parent) 
	fish.sprite_index = fish_sprite
	
	fish_timer = global.fish_spawn_rate
end