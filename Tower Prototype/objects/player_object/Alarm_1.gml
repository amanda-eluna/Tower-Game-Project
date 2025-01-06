/// @description hitbox alarm

var offset_x = 30;
var offset_y = 30;

instance_create_depth(weapon.x + offset_x, weapon.y + offset_y, depth - 1, obj_Hitbox);