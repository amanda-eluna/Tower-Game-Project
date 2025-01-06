
//Horizontal Movement
player_speed = 4;

//Vertical Movement
grv = 0.3;
jumpHeight = 7;
vspd = 0;
canJump = 0;
canDoubleJump = false;

//Dash
isDashing = false;
dashSpeed = 5; // Set your desired dash speed
dashDuration = 10; // Set the duration of the dash in steps

//attack
weapon = instance_create_depth(x, y, depth - 1, obj_sword);
weapon_x_offset = 60;
weapon_y_offset = -20;

is_swinging = false;
