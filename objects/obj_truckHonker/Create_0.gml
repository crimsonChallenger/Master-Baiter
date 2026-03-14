current_honk = -1;
Honker = audio_emitter_create();
audio_listener_orientation(0, 0, 1, 0, -1, 0);

meters_to_pixels = 2; // 1 meter = 32 pixels, tweak this

ref_distance_meters = 100;    // starts falling off after 2 meters
max_distance_meters = 5;   // completely gone at 20 meters
falloff_factor = 1.0;       // higher = drops off faster

audio_falloff_set_model(audio_falloff_inverse_distance);