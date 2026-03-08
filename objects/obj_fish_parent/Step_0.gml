move_timer -= 1 / game_get_speed(gamespeed_fps)

if (CaughtYa)
{
	image_alpha -= fadeOut_speed;
    if (image_alpha <= 0) {
        instance_destroy();
    }
	
}

else
	{ if (image_alpha < 1) {
	    image_alpha += fade_speed;
	} else {
	    image_alpha = 1; 
	}

	if (move_timer < 0) {
	    // Check if objects exist first to avoid crashes
	    var d1 = instance_exists(obj_bobber_p1) ? point_distance(x, y, obj_bobber_p1.x, obj_bobber_p1.y) : infinity;
	    var d2 = instance_exists(obj_bobber_p2) ? point_distance(x, y, obj_bobber_p2.x, obj_bobber_p2.y) : infinity;

	    var closest_bobber = (d1 < d2) ? obj_bobber_p1 : obj_bobber_p2;

	    if (instance_exists(closest_bobber)) {
	        movedirection = point_direction(closest_bobber.x, closest_bobber.y, x, y);
        
	        // Update velocity ONLY when direction changes
	        velocityx = lengthdir_x(global.fish_speed, movedirection);
	        velocityy = lengthdir_y(global.fish_speed, movedirection);
        
	        move_timer = global.fish_move_timer; // Set this to 60 for 1 second
	    }
	}

	// 2. Bounce Logic (Now it won't be overwritten immediately)
	if (bbox_left + velocityx < 0 || bbox_right + velocityx > room_width) {
	    velocityx = -velocityx * global.bounciness;
	    movedirection = point_direction(0, 0, velocityx, velocityy); // Keep angle in sync
	}
	if (bbox_top + velocityy < 0 || bbox_bottom + velocityy > room_height) {
	    velocityy = -velocityy * global.bounciness;
	    movedirection = point_direction(0, 0, velocityx, velocityy); // Keep angle in sync
	}

	// 3. Apply movement
	x += velocityx;
	y += velocityy;

	// 4. Flip Sprite
	image_xscale = (movedirection > 90 && movedirection < 270) ? -1 : 1; }