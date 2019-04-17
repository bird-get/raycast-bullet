/*
Modular raycast bullet, made by Bridget Littlebird, 20th of October, 2014
Copyright (C) 2014 Bridget Littlebird
This code is licensed under the GNU General Public License version 3.0.
Please refer to the notecard for the full license, usage instructions, tips, etc.
*/

#ifdef EFFECT_IMPACT
impactGround()
{
    // Sound
    string sound;
    integer r = llRound(llFrand(9));
    if(r == 0) sound = "62c0015d-da6d-73f0-842a-f10668cf3315";
    else if(r == 1) sound = "e8b9401b-de38-110e-6073-8dd2d8df1afe";
    else if(r == 2) sound = "3e44962b-e7cc-9199-1a02-2222f1fde986";
    else if(r == 3) sound = "97b4fa93-5b5e-5643-8d67-ebf8bd359288";
    else if(r == 4) sound = "c4f2e6f4-8f34-7d02-d16d-d3848225bc10";
    else if(r == 5) sound = "441b5d10-32fa-b1f9-cbf3-cd634d98d73e";
    else if(r == 6) sound = "934ec484-5433-83f4-0fa4-c4959daff6bb";
    else if(r == 7) sound = "0904dd50-dead-b21d-2ae1-38a3b374c530";
    else if(r == 8) sound = "0205a809-3c47-7da6-6de3-97040143637d";
    else if(r == 9) sound = "2f28906a-64ee-6a4c-a138-a54e63a85d80";
    llTriggerSound(sound, 1.0);
    
    llLinkParticleSystem(1, [ // Dust
        PSYS_PART_FLAGS, 35, 
        PSYS_SRC_PATTERN, 8, 
        PSYS_PART_BLEND_FUNC_SOURCE, 7, 
        PSYS_PART_BLEND_FUNC_DEST, 9, 
        PSYS_SRC_TARGET_KEY, (key)"", 
        PSYS_SRC_TEXTURE, "ef8379e7-7c9f-73f4-f4a4-632aefeafaf4", 
        PSYS_SRC_BURST_PART_COUNT, 2, 
        PSYS_SRC_BURST_RATE, 3.000000, 
        PSYS_SRC_BURST_RADIUS, 0.000000, 
        PSYS_PART_MAX_AGE, 1.000000, 
        PSYS_SRC_MAX_AGE, 0.000000, 
        PSYS_SRC_ANGLE_BEGIN, 0.000000, 
        PSYS_SRC_ANGLE_END, 0.300000, 
        PSYS_SRC_BURST_SPEED_MIN, 0.200000, 
        PSYS_SRC_BURST_SPEED_MAX, 0.500000, 
        PSYS_PART_START_ALPHA, 1.000000, 
        PSYS_PART_END_ALPHA, 0.000000, 
        PSYS_PART_START_GLOW, 0.000000, 
        PSYS_PART_END_GLOW, 0.000000, 
        PSYS_SRC_OMEGA, <0.000000, 0.000000, 0.000000>, 
        PSYS_SRC_ACCEL, <0.000000, 0.000000, 0.000000>, 
        PSYS_PART_START_SCALE, <0.500000, 0.500000, 0.000000>, 
        PSYS_PART_END_SCALE, <0.500000, 0.500000, 0.000000>, 
        PSYS_PART_START_COLOR, <0.860004, 0.614751, 0.384542>, 
        PSYS_PART_END_COLOR, <0.752441, 0.571341, 0.396156>]);
 
    llLinkParticleSystem(2, [ // Debris
        PSYS_PART_FLAGS, 3, 
        PSYS_SRC_PATTERN, 8, 
        PSYS_PART_BLEND_FUNC_SOURCE, 7, 
        PSYS_PART_BLEND_FUNC_DEST, 9, 
        PSYS_SRC_TARGET_KEY, (key)"", 
        PSYS_SRC_TEXTURE, "ca25414d-80e2-8f42-7f1b-2a7ab69c7afe", 
        PSYS_SRC_BURST_PART_COUNT, 4, 
        PSYS_SRC_BURST_RATE, 3.000000, 
        PSYS_SRC_BURST_RADIUS, 0.000000, 
        PSYS_PART_MAX_AGE, 1.000000, 
        PSYS_SRC_MAX_AGE, 0.000000, 
        PSYS_SRC_ANGLE_BEGIN, 2.541593, 
        PSYS_SRC_ANGLE_END, 3.141593, 
        PSYS_SRC_BURST_SPEED_MIN, 0.400000, 
        PSYS_SRC_BURST_SPEED_MAX, 1.100000, 
        PSYS_PART_START_ALPHA, 0.500000, 
        PSYS_PART_END_ALPHA, 0.000000, 
        PSYS_PART_START_GLOW, 0.000000, 
        PSYS_PART_END_GLOW, 0.000000, 
        PSYS_SRC_OMEGA, <0.000000, 0.000000, 0.000000>, 
        PSYS_SRC_ACCEL, <0.000000, 0.000000, -2.000000>, 
        PSYS_PART_START_SCALE, <0.500000, 0.500000, 0.000000>, 
        PSYS_PART_END_SCALE, <0.500000, 0.500000, 0.000000>, 
        PSYS_PART_START_COLOR, <0.831078, 0.538320, 0.210219>, 
        PSYS_PART_END_COLOR, <0.863738, 0.566967, 0.139855>]);
}
#else
#define impactGround()
#endif
