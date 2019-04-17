/*
Modular raycast bullet, made by Bridget Littlebird, 20th of October, 2014
Copyright (C) 2014 Bridget Littlebird
This code is licensed under the GNU General Public License version 3.0.
Please refer to the notecard for the full license, usage instructions, tips, etc.
*/

#ifdef ENABLE_KILL_MESSAGE
killMessage(key id)
{
    llOwnerSay("You killed " + llKey2Name(id) + ".");
}
#else
#define killMessage(dummy)
#endif
