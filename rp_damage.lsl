/*
Modular raycast bullet, made by Bridget Littlebird, 20th of October, 2014
Copyright (C) 2014 Bridget Littlebird
This code is licensed under the GNU General Public License version 3.0.
Please refer to the notecard for the full license, usage instructions, tips, etc.
*/

default
{
    state_entry()
    {
        llSetStatus(STATUS_DIE_AT_EDGE, TRUE);
        llSetStatus(STATUS_ROTATE_X|STATUS_ROTATE_Y|STATUS_ROTATE_Z, FALSE);
        llCollisionFilter(llGetObjectName(), "", FALSE);
        llCollisionSound("", 0);
    }
    
    on_rez(integer sp)
    {
        if(sp) llSetTimerEvent(1);
    }
    
    timer()
    {
        llDie();
    }

    collision_start(integer num)
    {
        llDie();
    }
    
    land_collision_start(vector pos)
    {
        llDie();
    }
}
