// 1. Get Input
var _h_input = keyboard_check(right_key) - keyboard_check(left_key);
var _v_input = keyboard_check(down_key) - keyboard_check(up_key);

// 2. Normalize Diagonal Input
// This ensures that holding W and D doesn't result in a combined speed of 1.41
if (_h_input != 0 && _v_input != 0) {
    _h_input *= 0.7071; // Roughly 1 / sqrt(2)
    _v_input *= 0.7071;
}

// 3. Apply Acceleration
velocityx += _h_input * global.accellaration;
velocityy += _v_input * global.accellaration;

// 4. Apply Friction (When no keys are pressed)
if (_h_input == 0) velocityx *= global.frictionbutcooler;
if (_v_input == 0) velocityy *= global.frictionbutcooler;

// 5. Limit Max Speed (Clamp)
// This forces velocity to stay between -max_speed and max_speed
velocityx = clamp(velocityx, -global.max_speed, global.max_speed);
velocityy = clamp(velocityy, -global.max_speed, global.max_speed);

var other_bobber = instance_place(x + velocityx, y + velocityy, bobber_parent);

if (other_bobber != noone) {
    // We're about to collide - bounce off each other
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

// 6. Update Position
x += velocityx;
y += velocityy;