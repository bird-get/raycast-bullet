/*
Modular raycast bullet, made by Bridget Littlebird, 20th of October, 2014
Copyright (C) 2014 Bridget Littlebird
This code is licensed under the GNU General Public License version 3.0.
Please refer to the notecard for the full license, usage instructions, tips, etc.
*/

#ifdef ENABLE_RP_DAMAGE
rpDamage(key target)
{
    integer i;
    for(i = 0; i < RP_DAMAGE; i++)
    {
        vector targetPos = llList2Vector(llGetObjectDetails(target, [OBJECT_POS]), 0);
        llSetRegionPos(targetPos);
        
        llRezObject(RP_DAMAGE_NAME, targetPos + <0,0,RP_DAMAGE_OFFSET>, <0,0,-RP_DAMAGE_VEL>, ZERO_ROTATION, 1);
    }
    llDie();
}
#else
#define rpDamage(dummy)
#endif
