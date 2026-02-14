round_timer--;
show_debug_message("Time left: " + string(round_timer / room_speed));
if (round_timer <= 0) {
    with (bobber_p1) {
        global.player1_fish = fish_caught;
    }
    with (bobber_p2) {
        global.player2_fish = fish_caught;
    }
	room_goto(End);
}