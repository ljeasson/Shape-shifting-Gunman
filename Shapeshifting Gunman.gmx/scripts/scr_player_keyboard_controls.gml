/// scr_player_keyboard_controls()

// Set Player Skin
instance_deactivate_object(obj_cheetah_skin);
instance_deactivate_object(obj_octopus_skin);
obj_player.skin = instance_create(x,y,obj_player_skin);

// Set key inputs
key_w = keyboard_check(ord('W'));  //Movement
key_a = keyboard_check(ord('A'));
key_s = keyboard_check(ord('S'));
key_d = keyboard_check(ord('D'));
key_e = keyboard_check_pressed(ord('E'));  //Interaction

// Move with input
if (key_w) {vspeed -= move_speed};
if (key_a) {hspeed -= move_speed};
if (key_s) {vspeed += move_speed};
if (key_d) {hspeed += move_speed};
if (key_a and key_d) {hspeed = 0};
if (key_w and key_s) {vspeed = 0};
if (!key_a and !key_d) {hspeed = 0};
if (!key_w and !key_s) {vspeed = 0};

// Limit movement speed
if (hspeed > max_speed) {hspeed = max_speed};
if (hspeed < -max_speed) {hspeed = -max_speed};
if (vspeed > max_speed) {vspeed = max_speed};
if (vspeed < -max_speed) {vspeed = -max_speed};

// Shoot
if (mouse_check_button_pressed(mb_left))
{
    var bullet = instance_create(x,y,obj_bullet);
    bullet.speed = obj_bullet.bullet_speed;
    bullet.direction = point_direction(x,y,mouse_x,mouse_y);
}

// Transform
if (keyboard_check_pressed(vk_numpad0)) 
{
    state = player_states.human;
}
if (keyboard_check_pressed(vk_numpad1)) 
{
    state = player_states.cheetah;
}
if (keyboard_check_pressed(vk_numpad2)) 
{
    state = player_states.octopus;
}

