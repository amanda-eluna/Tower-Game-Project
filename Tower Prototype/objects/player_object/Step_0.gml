/// @desc Movement

//inputs
var right = keyboard_check(ord("D"));
var left = keyboard_check(ord("A"));
var keyJump = keyboard_check_pressed(vk_space);
var isGrounded = place_meeting(x, y + 1, spike_zone);

//Horizontal Movement

//direction

var move = (right - left) * player_speed;

	//collison check

if place_meeting(x + move, y, spike_zone) {
	while !place_meeting(x + sign(move), y, spike_zone){
		x += sign(move)	
	}
	move = 0;
}

//commit to move
x += move;

//Vertical Movement

vspd += grv; //gravity

//collison check

if place_meeting(x, y + vspd, spike_zone) {
	while !place_meeting(x, y + sign(vspd), spike_zone){
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

//Dash Ability
if (keyboard_check(vk_shift) && !isDashing) {

    isDashing = true;

    alarm[0] = dashDuration;

}



if (isDashing) {

    var dashDirection = (right - left) * dashSpeed;

    x += dashDirection;

}

