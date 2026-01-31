fish_timer -= delta_time / 1000000

if (fish_timer < 0) {
	show_debug_message("fish timer done")
	
	fish_sprite = common_1

	fish_x = irandom_range(global.spawn_margin, room_width - global.spawn_margin)
	fish_y = irandom_range(global.spawn_margin, room_height - global.spawn_margin)
	
	fish = instance_create_layer(fish_x, fish_y, "Fish", fish_parent) 
	fish.sprite_index = fish_sprite
	
	fish_timer = global.fish_spawn_rate
end