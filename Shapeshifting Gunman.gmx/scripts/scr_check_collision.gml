/// scr_check_collision()

// Moving Down
if (vspeed > 0)
{
    if (place_meeting(x, y+vspeed, obj_solid_block))
    {
        while(!place_meeting(x,y+1,obj_solid_block)){y++};
        vspeed = 0;
    }
}

// Moving Up
if (vspeed < 0)
{
    if (place_meeting(x, y+vspeed, obj_solid_block))
    {
        while(!place_meeting(x,y-1,obj_solid_block)){y--};
        vspeed = 0;
    }
}

// Moving Right
if (hspeed > 0)
{
    if (place_meeting(x+hspeed, y, obj_solid_block))
    {
        while(!place_meeting(x+1,y,obj_solid_block)){x++};
        hspeed = 0;
    }
}

// Moving Left
if (hspeed < 0)
{
    if (place_meeting(x+hspeed, y, obj_solid_block))
    {
        while(!place_meeting(x-1,y,obj_solid_block)){x--};
        hspeed = 0;
    }
}

