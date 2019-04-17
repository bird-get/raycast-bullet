/* TODO:
• Improve border check on high velocity
• Paintball effect
• Blood effect
*/

/*
Modular raycast bullet, made by Bridget Littlebird, 20th of October, 2014
Version 0.01
Copyright (C) 2014 Bridget Littlebird
This code is licensed under the GNU General Public License version 3.0.
Please refer to the notecard for the full license, usage instructions, tips, etc.
*/

// SWITCHES //
//#define DEBUG
#define EFFECT_BULLET_HOLE
//#define EFFECT_ANIMATED_BULLET_HOLE
#define EFFECT_IMPACT
#define EFFECT_TRAIL

#define IGNORE_OWNER
#define ENABLE_DAMAGE_FALLOFF
#define ENABLE_KILL_MESSAGE
#define ENABLE_VARIABLE_VELOCITY
//#define ENABLE_RP_DAMAGE
#define ENABLE_PRIM_DAMAGE
#define ENABLE_PRIM_DAMAGE_EFFECTS


// OPTIONS //

// Velocity = distance / step_time
#define STEP_DISTANCE 39
#define STEP_TIME .1

#define DAMAGE_START 100
#define DAMAGE_MIN 10
#define DAMAGE_FALLOFF_MULTIPLIER .01

#define PRIM_DAMAGE 1
#define PRIM_DAMAGE_VEL 100
#define PRIM_DAMAGE_OFFSET 8.00
#define PRIM_DAMAGE_NAME "prim_damage"

#define RP_DAMAGE 1
#define RP_DAMAGE_VEL 100
#define RP_DAMAGE_OFFSET 8.00
#define RP_DAMAGE_NAME "rp_damage"

#define KILL_ATTEMPTS 5
#define HOLE_SIZE .4


// INCLUDES //
#include "include/debug.lsl"
#include "include/normal2Rot.lsl"
#include "include/raycast_bullet.trailEffect_smoke.lsl"
#include "include/raycast_bullet.impactPrim_bullet.lsl"
#include "include/raycast_bullet.impactGround.lsl"
#include "include/raycast_bullet.killMessage.lsl"
#include "include/raycast_bullet.killAvatar.lsl"
#include "include/raycast_bullet.travel.lsl"
#include "include/raycast_bullet.primDamage.lsl"
#include "include/raycast_bullet.rpDamage.lsl"


// START OF CODE //
#ifdef ENABLE_DAMAGE_FALLOFF
vector startPos;
#endif

#ifdef ENABLE_VARIABLE_VELOCITY
float step_distance;
#endif

default
{
    on_rez(integer sp)
    {
        debugMemory();
        if(sp)
        {
            #ifdef ENABLE_VARIABLE_VELOCITY
            step_distance = sp * STEP_TIME;
            #endif
            
            travel();
            llSetTimerEvent(STEP_TIME);
            
            #ifdef ENABLE_DAMAGE_FALLOFF
            startPos = llGetPos();
            #endif
        }
    }
    
    state_entry()
    {
        #ifdef EFFECT_ANIMATED_BULLET_HOLE
        llSetTextureAnim(ANIM_ON | LOOP, 0, 4, 4, 0.0, 16.0, 4);
        #else
        llSetTextureAnim(FALSE, 0, 4, 4, 0.0, 16.0, 0);
        #endif
        
        trailEffect();
    }
    
    timer()
    {
        travel();
    }
}
