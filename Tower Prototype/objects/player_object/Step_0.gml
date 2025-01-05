/// @desc Movement

//inputs
var right = keyboard_check(ord("D"));
/// @desc Movement

//inputs
var right = keyboard_check(ord("D"));
var left = keyboard_check(ord("A"));
var keyJump = keyboard_check_pressed(vk_space);
var isGrounded = place_meeting(x, y + 1, obj_wall); // Changed spike_zone to obj_wall

//Horizontal Movement

//direction

var move = (right - left) * player_speed;

	//collision check

if place_meeting(x + move, y, obj_wall) { // Changed spike_zone to obj_wall
    while !place_meeting(x + sign(move), y, obj_wall){ // Changed spike_zone to obj_wall
        x += sign(move);
    }
    move = 0;
}

//commit to move
x += move;

//Vertical Movement

vspd += grv; //gravity

//collision check

if place_meeting(x, y + vspd, obj_wall) { // Changed spike_zone to obj_wall
    while !place_meeting(x, y + sign(vspd), obj_wall){ // Changed spike_zone to obj_wall
        y += sign(vspd);	
    }
	
    vspd = 0;	
}

if isGrounded{ //when on the ground
    canJump = 10;
    canDoubleJump = false;
} else { 
    canJump -= 1;
}
// jumping action

if canDoubleJump and keyJump { // double jump
    vspd = 0;
    canDoubleJump = false;
    vspd -= jumpHeight;
}

if canJump > 0 and keyJump { // normal jump
    vspd = 0;
    canJump = 0;
    canDoubleJump = true;
    vspd -= jumpHeight;
}


y += vspd; //commit to move


// Start the dash
if (keyboard_check_pressed(vk_shift) && !isDashing) {
    isDashing = true;

    // Determine dash direction based on input
    if (keyboard_check(ord("D"))) dashDirection = dashSpeed; // Dash right
    else if (keyboard_check(ord("A"))) dashDirection = -dashSpeed; // Dash left
    else dashDirection = 0;

    alarm[0] = dashDuration; // Start the timer for dash duration
}

// Handle dashing
if (isDashing) {
    // Check for wall collision before moving
    if (!place_meeting(x + dashDirection, y, obj_wall)) { // Changed spike_zone to obj_wall
        x += dashDirection; // Move the player
    } else {
        isDashing = false; // Stop dashing if hitting a wall
    }
}
