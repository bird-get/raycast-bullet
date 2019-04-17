If you make any useful changes to the code, please send it back to me (Bridget Littlebird) and I will update it.
Since this is free software, please share it!

# Description
This script was made in an attempt to make a more efficient and prettier alternative to regular physical
bullets. Instead of having the server calculate the bullet position every frame, this bullet will travel
in larger steps, resulting in less calculations.
Essentially, physics server stress is transferred to script server stress. This seemed more efficient,
although it will need a lot of testing.

# Usage
A viewer with the LSL preprocessor enabled is required to compile! (Firestorm for example)
Good scripting knowledge is also preferred.

Simply edit the parameters, put the code into a 3-prim object invisible and it's good to go.
If you are using the VARIABLE_VELOCITY switch, set the velocity in the rez param when rezzing the bullet.

# Tips
A lower STEP_TIME and higher STEP_DISTANCE will drastically reduce lag.
Disabling the effects will further reduce lag.
Disabled switches will not be compiled into the code, so the memory/script time usage will be lower.
Simply put: Disable anything you don't need!
Don't hesitate to ask me (Bridget Littlebird) for help or explanation of certain methods.
