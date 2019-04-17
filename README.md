Modular raycast bullet, made by Bridget Littlebird, 20th of October, 2014
Copyright (C) 2014 Bridget Littlebird


If you make any useful changes to the code, please send it back to me (Bridget Littlebird) and I will update it.
Since this is free software, please share it!


LICENSE:
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License version 3 as published by
the Free Software Foundation, either version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

Go to http://www.gnu.org/licenses/ for the full license.



DESCRIPTION:
This script was made in an attempt to make a more efficient and prettier alternative to regular physical
bullets. Instead of having the server calculate the bullet position every frame, this bullet will travel
in larger steps, resulting in less calculations.
Essentially, physics server stress is transferred to script server stress. This seemed more efficient,
although it will need a lot of testing.

USAGE:
A viewer with the LSL preprocessor enabled is required to compile! (Firestorm for example)
Good scripting knowledge is also preferred.

Simply edit the parameters, put the code into a 3-prim object invisible and it's good to go.
If you are using the VARIABLE_VELOCITY switch, set the velocity in the rez param when rezzing the bullet.

TIPS:
A lower STEP_TIME and higher STEP_DISTANCE will drastically reduce lag.
Disabling the effects will further reduce lag.
Disabled switches will not be compiled into the code, so the memory/script time usage will be lower.
Simply put: Disable anything you don't need!
Don't hesitate to ask me (Bridget Littlebird) for help or explanation of certain methods.


CHANGELOG:
v0.01 - First version.
