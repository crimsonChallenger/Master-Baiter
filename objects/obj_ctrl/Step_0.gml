round_timer--;

if (round_timer <= 0) {
    with (obj_bobber_p1) {
        global.player1_fish = fish_caught;
    }
    with (obj_bobber_p2) {
        global.player2_fish = fish_caught;
    }
	room_goto(rm_End);
}