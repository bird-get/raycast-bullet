/*
Modular raycast bullet, made by Bridget Littlebird, 20th of October, 2014
Copyright (C) 2014 Bridget Littlebird
This code is licensed under the GNU General Public License version 3.0.
Please refer to the notecard for the full license, usage instructions, tips, etc.
*/

travel()
{
    @start;
    debugMessage("Traveling...");
    
    #ifdef ENABLE_VARIABLE_VELOCITY
    vector targetPos = llGetPos() + llRot2Fwd(llGetRot()) * step_distance;
    #else
    vector targetPos = llGetPos() + llRot2Fwd(llGetRot()) * STEP_DISTANCE;
    #endif
    
    list ray = llCastRay(llGetPos(), targetPos, [RC_DATA_FLAGS, RC_GET_NORMAL]);
    key hitKey = llList2Key(ray, 0);
    vector hitPos = llList2Vector(ray, 1);
    rotation normalRot = normal2Rot(llList2Vector(ray, 2));
    
    if(llList2Integer(ray, -1) == RCERR_SIM_PERF_LOW || 
        llList2Integer(ray, -1) == RCERR_CAST_TIME_EXCEEDED)
    {
        debugMessage("An error occurred.");
        jump start;
    }
    else if(llList2Integer(ray, -1) == 0) // Hit nothing
    {
        llSetRegionPos(targetPos);
    }
    else
    {
        #ifdef IGNORE_OWNER
        if(hitKey == llGetOwner())
        {
            llSetRegionPos(targetPos + llRot2Fwd(llGetRot()) * STEP_DISTANCE);
            return;
        }
        #endif
        
        if(llGetAgentSize(hitKey) != ZERO_VECTOR) // Hit avatar
        {
            #ifdef ENABLE_RP_DAMAGE
            rpDamage(hitKey);
            #else
            killAvatar(hitKey);
            #endif
        }
        else if(hitPos != ZERO_VECTOR) // Hit object or ground
        {
            llLinkParticleSystem(1, []);
            llLinkParticleSystem(2, []);
            llLinkParticleSystem(3, []);
                        
            llSetRegionPos(hitPos);
            llSetLinkPrimitiveParamsFast(1, [PRIM_ROTATION, normalRot]);
            llSetLinkPrimitiveParamsFast(2, [PRIM_ROT_LOCAL, ZERO_ROTATION]);
            llSetLinkPrimitiveParamsFast(3, [PRIM_ROT_LOCAL, ZERO_ROTATION]);
            
            llSleep(.05);
            
            if(hitKey) // Hit object
            {
                if(llList2Integer(llGetObjectDetails(hitKey, [OBJECT_RUNNING_SCRIPT_COUNT]), 0) > 0)
                {
                    #ifdef ENABLE_PRIM_DAMAGE_EFFECTS
                    impactPrim(FALSE);
                    #endif
                    
                    #ifdef ENABLE_PRIM_DAMAGE
                    primDamage(hitKey);
                    #endif
                }
                else if(llList2Integer(llGetObjectDetails(hitKey, [OBJECT_PHYSICS]), 0))
                    impactPrim(FALSE);
                else
                {
                    if(llList2Vector(llGetObjectDetails(hitKey, [OBJECT_POS]), 0) != ZERO_VECTOR)
                        impactPrim(TRUE);
                }
            }
            else
            {
                impactGround();
            }
            llSleep(.5);
            llDie();
        }
    }
}
