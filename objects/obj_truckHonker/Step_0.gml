audio_emitter_position(Honker, obj_bobber_p2.x, obj_bobber_p2.y, 0);
audio_listener_set_position(0, obj_bobber_p1.x, obj_bobber_p1.y, 0)

var _inv = 1 / meters_to_pixels;
audio_emitter_velocity(Honker, obj_bobber_p2.velocityx * _inv, obj_bobber_p2.velocityy * _inv, 0);
audio_listener_velocity(obj_bobber_p1.velocityx * _inv, obj_bobber_p1.velocityy * _inv, 0);

var _ref = ref_distance_meters * meters_to_pixels;
var _max = max_distance_meters * meters_to_pixels;

audio_emitter_falloff(Honker, _ref, _max, falloff_factor)

if (!audio_is_playing(current_honk)) {
    var _index = irandom(2);
    
    if (_index == 0) current_honk = truck_honk1;
    else if (_index == 1) current_honk = truck_honk2;
    else current_honk = truck_honk3;
	audio_play_sound_on(Honker, current_honk, false, 1);
}