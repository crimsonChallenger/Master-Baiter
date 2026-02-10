
var h_input = keyboard_check(right_key) - keyboard_check(left_key);
var v_input = keyboard_check(down_key) - keyboard_check(up_key);

if (h_input != 0 && v_input != 0) {
    h_input *= 0.7071; 
    v_input *= 0.7071;
}

velocityx += h_input * global.accellaration;
velocityy += v_input * global.accellaration;

if (h_input == 0) velocityx *= global.frictionbutcooler;
if (v_input == 0) velocityy *= global.frictionbutcooler;

velocityx = clamp(velocityx, -global.max_speed, global.max_speed);
velocityy = clamp(velocityy, -global.max_speed, global.max_speed);

var other_bobber = instance_place(x + velocityx, y + velocityy, bobber_parent);

if (other_bobber != noone) {
    var temp_vx = velocityx;
    var temp_vy = velocityy;
    
    velocityx = other_bobber.velocityx * global.bounciness;
    velocityy = other_bobber.velocityy * global.bounciness;
    
    other_bobber.velocityx = temp_vx * global.bounciness;
    other_bobber.velocityy = temp_vy * global.bounciness;
}

if (bbox_left + velocityx < 0 || bbox_right + velocityx > room_width) {
    velocityx = -velocityx * global.bounciness;
}
if (bbox_top + velocityy < 0 || bbox_bottom + velocityy > room_height) {
    velocityy = -velocityy * global.bounciness;
}

var fish = instance_place(x + velocityx, y + velocityy, fish_parent);

if (fish != noone) {
	array_push(fish_caught, fish.sprite_index)
	instance_destroy(fish)
}

x += velocityx;
y += velocityy;