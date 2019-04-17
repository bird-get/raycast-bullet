/*
Modular raycast bullet, made by Bridget Littlebird, 20th of October, 2014
Copyright (C) 2014 Bridget Littlebird
This code is licensed under the GNU General Public License version 3.0.
Please refer to the notecard for the full license, usage instructions, tips, etc.
*/

// This effect uses a scorch mark as impact decal, and an energy-like spark/smoke effect.

#define RATE 3
#define START_COLOR <0.553, 0.482, 0.961>
#define END_COLOR <0.453, 0.382, 0.861>

#ifdef EFFECT_IMPACT
impactPrim(integer decal)
{
    // Sound
    string sound;
    integer r = llRound(llFrand(4));
    if(r == 0) sound = "5c5fb718-efa0-d17d-0078-9fb2612fef6f";
    else if(r == 1) sound = "1fdcf84b-a3da-660b-99af-54150d109e05";
    else if(r == 2) sound = "30731ce8-ec9d-2125-30ed-8449d08efd12";
    else if(r == 3) sound = "a271c70f-e825-3257-f7c9-4642b72fe832";
    else if(r == 4) sound = "0e547320-0033-ca32-7ac1-b6ac1e2a60fb";
    llTriggerSound(sound, 1.0);
    
    // Particles
    llLinkParticleSystem(1, [ // Sparks
        PSYS_PART_FLAGS, 291, 
        PSYS_SRC_PATTERN, 8, 
        PSYS_PART_BLEND_FUNC_SOURCE, 7, 
        PSYS_PART_BLEND_FUNC_DEST, 9, 
        PSYS_SRC_TARGET_KEY, (key)"", 
        PSYS_SRC_TEXTURE, "8a21981f-cadb-ddb5-a50f-b2c11361b5c8", 
        PSYS_SRC_BURST_PART_COUNT, 50, 
        PSYS_SRC_BURST_RATE, RATE, 
        PSYS_SRC_BURST_RADIUS, 0.000000, 
        PSYS_PART_MAX_AGE, 1.500000, 
        PSYS_SRC_MAX_AGE, 0.000000, 
        PSYS_SRC_ANGLE_BEGIN, 0.000000, 
        PSYS_SRC_ANGLE_END, 0.300000, 
        PSYS_SRC_BURST_SPEED_MIN, 3.000000, 
        PSYS_SRC_BURST_SPEED_MAX, 6.000000, 
        PSYS_PART_START_ALPHA, 1.000000, 
        PSYS_PART_END_ALPHA, 0.000000, 
        PSYS_PART_START_GLOW, 0.300000, 
        PSYS_PART_END_GLOW, 0.000000, 
        PSYS_SRC_OMEGA, <0.000000, 0.000000, 0.000000>, 
        PSYS_SRC_ACCEL, <0.000000, 0.000000, -9.600000>, 
        PSYS_PART_START_SCALE, <0.0500000, 0.200000, 0.000000>, 
        PSYS_PART_END_SCALE, <0.0500000, 0.100000, 0.000000>, 
        PSYS_PART_START_COLOR, START_COLOR, 
        PSYS_PART_END_COLOR, END_COLOR]);
 
    llLinkParticleSystem(2, [ // Smoke
        PSYS_PART_FLAGS, 11, 
        PSYS_SRC_PATTERN, 8, 
        PSYS_PART_BLEND_FUNC_SOURCE, 7, 
        PSYS_PART_BLEND_FUNC_DEST, 9, 
        PSYS_SRC_TARGET_KEY, (key)"", 
        PSYS_SRC_TEXTURE, "f782d71a-d04b-b860-e3f7-0ed7555391ae", 
        PSYS_SRC_BURST_PART_COUNT, 4, 
        PSYS_SRC_BURST_RATE, RATE, 
        PSYS_SRC_BURST_RADIUS, 0.200000, 
        PSYS_PART_MAX_AGE, 1.000000, 
        PSYS_SRC_MAX_AGE, 0.000000, 
        PSYS_SRC_ANGLE_BEGIN, 0.0, 
        PSYS_SRC_ANGLE_END, 0.6, 
        PSYS_SRC_BURST_SPEED_MIN, 1.000000, 
        PSYS_SRC_BURST_SPEED_MAX, 2.000000, 
        PSYS_PART_START_ALPHA, 0.200000, 
        PSYS_PART_END_ALPHA, 0.000000, 
        PSYS_PART_START_GLOW, 0.000000, 
        PSYS_PART_END_GLOW, 0.000000, 
        PSYS_SRC_OMEGA, <0.000000, 0.000000, 0.000000>, 
        PSYS_SRC_ACCEL, <0.000000, 0.000000, 0.000000>, 
        PSYS_PART_START_SCALE, <1.000000, 1.000000, 0.000000>, 
        PSYS_PART_END_SCALE, <1.500000, 1.500000, 0.000000>, 
        PSYS_PART_START_COLOR, <1.000000, 1.000000, 1.000000>, 
        PSYS_PART_END_COLOR, <1.000000, 1.000000, 1.000000>]);
 
    llLinkParticleSystem(3, [ // Flare
        PSYS_PART_FLAGS, 259, 
        PSYS_SRC_PATTERN, 4, 
        PSYS_PART_BLEND_FUNC_SOURCE, 7, 
        PSYS_PART_BLEND_FUNC_DEST, 9, 
        PSYS_SRC_TARGET_KEY, (key)"", 
        PSYS_SRC_TEXTURE, "099e1c5d-eb86-517d-f55a-ee306ca52b1b", 
        PSYS_SRC_BURST_PART_COUNT, 2, 
        PSYS_SRC_BURST_RATE, RATE, 
        PSYS_SRC_BURST_RADIUS, 0.000000, 
        PSYS_PART_MAX_AGE, 0.200000, 
        PSYS_SRC_MAX_AGE, 0.000000, 
        PSYS_SRC_ANGLE_BEGIN, 0.000000, 
        PSYS_SRC_ANGLE_END, 0.000000, 
        PSYS_SRC_BURST_SPEED_MIN, 0.000000, 
        PSYS_SRC_BURST_SPEED_MAX, 0.000000, 
        PSYS_PART_START_ALPHA, 0.500000, 
        PSYS_PART_END_ALPHA, 0.000000, 
        PSYS_PART_START_GLOW, 1.000000, 
        PSYS_PART_END_GLOW, 0.000000, 
        PSYS_SRC_OMEGA, <0.000000, 0.000000, 0.000000>, 
        PSYS_SRC_ACCEL, <0.000000, 0.000000, 0.000000>, 
        PSYS_PART_START_SCALE, <0.500000, 0.500000, 0.000000>, 
        PSYS_PART_END_SCALE, <0.500000, 0.500000, 0.000000>, 
        PSYS_PART_START_COLOR, START_COLOR, 
        PSYS_PART_END_COLOR, END_COLOR]);
    
    #ifdef EFFECT_BULLET_HOLE
    if(!decal) return;
    
    // Bullet hole
    r = llRound(llFrand(3));
    vector offset;
    if(r == 0) offset = <0.25,0.25,0>;
    else if(r == 1) offset = <-0.25,0.25,0>;
    else if(r == 2) offset = <0.25,-0.25,0>;
    else if(r == 3) offset = <-0.25,-0.25,0>;
    vector holesize = <HOLE_SIZE + llFrand(HOLE_SIZE),HOLE_SIZE + llFrand(HOLE_SIZE),.02>;
    llSetLinkPrimitiveParamsFast(LINK_THIS, [
        PRIM_TEXTURE, 0, "f1f3ae16-cf22-b30b-eb35-ee41420a7702", <0.5,0.5,0>, offset, llFrand(360),
        PRIM_SIZE, holesize,
        PRIM_COLOR, 0, <1,1,1>, 1.0,
        PRIM_TYPE, PRIM_TYPE_CYLINDER, PRIM_HOLE_DEFAULT, <0.00, 1.0, 0.0>, 0.0, <0.0, 0.0, 0.0>, <1.0, 1.0, 0.0>, <0.0, 0.0, 0.0>]);
    
    llSetObjectName("[PE) Bullet hole");
    llSleep(1);
    llLinkParticleSystem(1, []);
    llLinkParticleSystem(2, []);
    llLinkParticleSystem(3, []);
    llRemoveInventory(llGetScriptName());
    #endif
}
#else
#define impactPrim(dummy)
#endif
