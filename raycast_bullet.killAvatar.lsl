/*
Modular raycast bullet, made by Bridget Littlebird, 20th of October, 2014
Copyright (C) 2014 Bridget Littlebird
This code is licensed under the GNU General Public License version 3.0.
Please refer to the notecard for the full license, usage instructions, tips, etc.
*/

killAvatar(key target)
{
    llSetTimerEvent(0);
    killMessage(target);
    
    llSetScale(<1,1,1>);
    llSetStatus(STATUS_PHANTOM, FALSE);
    
    vector targetPos = llList2Vector(llGetObjectDetails(target, [OBJECT_POS]), 0);
    #ifdef ENABLE_DAMAGE_FALLOFF
    
    float damage = DAMAGE_START - llVecDist(targetPos, startPos) * DAMAGE_FALLOFF_MULTIPLIER;
    if(damage < DAMAGE_MIN) damage = DAMAGE_MIN;
    llSetDamage(damage);
    #else
    llSetDamage(DAMAGE_START);
    #endif
    
    integer i;
    for(i = 0; i < KILL_ATTEMPTS; i++)
    {
        llSetRegionPos(targetPos);
        llSleep(.1);
    }
    llDie();
}
