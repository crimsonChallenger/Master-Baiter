
// Draw GUI Event of obj_results_controller

// ===== PLAYER 1 SIDE =====
draw_text(P1_X, HEADER_Y, "PLAYER 1");

// Count unique fish for P1
var p1_unique = [];
var p1_counts = [];

for (var i = 0; i < array_length(global.player1_fish); i++) {
    var fish_sprite = global.player1_fish[i];
    var found = -1;
    
    for (var j = 0; j < array_length(p1_unique); j++) {
        if (p1_unique[j] == fish_sprite) {
            found = j;
            break;
        }
    }
    
    if (found == -1) {
        array_push(p1_unique, fish_sprite);
        array_push(p1_counts, 1);
    } else {
        p1_counts[found]++;
    }
}

// Draw P1's fish with counts
var y_pos = FISH_START_Y;
for (var i = 0; i < array_length(p1_unique); i++) {
    draw_sprite(p1_unique[i], 0, P1_X + FISH_SPRITE_X_OFFSET, y_pos);
    draw_text(P1_X + FISH_COUNT_X_OFFSET, y_pos, "x" + string(p1_counts[i]));
    y_pos += FISH_SPACING_Y;
}


// ===== PLAYER 2 SIDE =====
draw_text(P2_X, HEADER_Y, "PLAYER 2");

// Count unique fish for P2
var p2_unique = [];
var p2_counts = [];

for (var i = 0; i < array_length(global.player2_fish); i++) {
    var fish_sprite = global.player2_fish[i];
    var found = -1;
    
    for (var j = 0; j < array_length(p2_unique); j++) {
        if (p2_unique[j] == fish_sprite) {
            found = j;
            break;
        }
    }
    
    if (found == -1) {
        array_push(p2_unique, fish_sprite);
        array_push(p2_counts, 1);
    } else {
        p2_counts[found]++;
    }
}

// Draw P2's fish with counts
y_pos = FISH_START_Y;
for (var i = 0; i < array_length(p2_unique); i++) {
    draw_sprite(p2_unique[i], 0, P2_X + FISH_SPRITE_X_OFFSET, y_pos);
    draw_text(P2_X + FISH_COUNT_X_OFFSET, y_pos, "x" + string(p2_counts[i]));
    y_pos += FISH_SPACING_Y;
}


// ===== RESTART PROMPT =====
draw_text(RESTART_TEXT_X, RESTART_TEXT_Y, "SPACE to play again");
