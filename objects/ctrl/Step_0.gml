round_timer--;
show_debug_message("Time left: " + string(round_timer / room_speed));
if (round_timer <= 0) {
    room_goto(End);
}