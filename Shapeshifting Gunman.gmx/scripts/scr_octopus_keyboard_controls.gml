/// scr_octopus_keyboard_controls()

// Set Octopus Skin
instance_deactivate_object(obj_player_skin);
instance_deactivate_object(obj_cheetah_skin);
obj_player.skin = instance_create(x,y,obj_octopus_skin);

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
if (hspeed > max_speed) {hspeed = max_speed_octopus};
if (hspeed < -max_speed) {hspeed = -max_speed_octopus};
if (vspeed > max_speed) {vspeed = max_speed_octopus};
if (vspeed < -max_speed) {vspeed = -max_speed_octopus};

// Shoot
 // Pistol
if (weapon == weapon_states.pistol)
{
    if (mouse_check_button_pressed(mb_left))
    {
        var shot = instance_create(x,y,obj_pistol_bullets);
    }
}
 // SMG
if (weapon == weapon_states.smg)
{
    if (mouse_check_button(mb_left))
    {
        if (fire_again)
        {
            instance_create(x,y,obj_smg_bullets);
            
            fire_again = false;
            alarm[0] = 3.25;
        }
    }
}
 // Shotgun
if (weapon == weapon_states.shotgun)
{
    if (mouse_check_button_pressed(mb_left))
    {
        if (fire_again)
        {
            instance_create(x,y,obj_shotgun_shots);
         
            fire_again = false;
            alarm[0] = 30;
         }
    }
}
 // Sniper 
if (weapon == weapon_states.sniper)
{
    if (mouse_check_button_pressed(mb_left))
    {
        if (fire_again)
        {
            instance_create(x,y,obj_sniper_bullets);
         
            fire_again = false;
            alarm[0] = 60;
         }
    }
}

// Transform
if (mouse_check_button_pressed(mb_right))
{
    if (state == player_states.human)
    {
        state = player_states.cheetah;
    }
    else if (state == player_states.cheetah)
    {
        state = player_states.octopus;
    }
    else if (state == player_states.octopus) 
    {
        state = player_states.human;
    }
}

// Weapon switch (for testing purposes)
if (keyboard_check_pressed(vk_numpad0)) 
{
    //state = player_states.human;
    weapon = weapon_states.pistol;
}
if (keyboard_check_pressed(vk_numpad1)) 
{
    //state = player_states.cheetah;
    weapon = weapon_states.smg;
}
if (keyboard_check_pressed(vk_numpad2)) 
{
    weapon = weapon_states.shotgun;
}
if (keyboard_check_pressed(vk_numpad3)) 
{
    weapon = weapon_states.sniper;
}

