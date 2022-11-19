# Extorius Self-Bot
This is documentation for Extorius Self-Bot.
All documentation is just a speculation of what will be added. None of this will work as of now.

## Booting the Script
```lua
loadstring(game:HttpGet('https://raw.githubusercontent.com/Extorius/Scripts/main/Self%20Bot.lua'))()
```
### Configuring Which Version
```lua
local Bot_Version = "Rate My Avatar"
```
#### Current Bot_Version Options
+ "Rate My Avatar"
+ "Universal"
+ "The Booth Plaza 2"

## Configuring Commands
```lua
local Command_List = {
	["forwards"] = {
		["Description"] = "Makes the character move forwards." -- Description
		Aliases = { -- Other acceptable words / phrases users can say to use the same command. Non case-sensitive.
			["Alias1"] = "forward",
			["Alias2"] = "walk",
			["Alias3"] = "move",
			["Alias4"] = "1"
		}
	},
	["backwards"] = {
		["Description"] = "Makes the character move backwards."
		Aliases = {
			["Alias1"] = "backward",
			["Alias2"] = "down",
			["Alias3"] = "back",
			["Alias4"] = "2"
		}
	},
	["left"] = {
		["Description"] = "Makes the character move left."
		Aliases = {
			["Alias"] = "3"
		}
	},
	["right"] = {
		["Description"] = "Makes the character move right."
		Aliases = {
			["Alias"] = "4"
		}
	},
	["jump"] = {
		["Description"] = "Makes the character jump."
		Aliases = {
			["Alias1"] = "up",
			["Alias2"] = "5"
		}
	},
	["die"] = {
		["Description"] = "Makes the character die."
		Aliases = {
			["Alias1"] = "oof",
			["Alias2"] = "kill",
			["Alias3"] = "dead",
			["Alias4"] = "6"
		}
	},
	["points"] = {
		["Description"] = "Displays / Says how many points the speaker has." -- Speaker being whoever used the command.
		Aliases = {
			["Alias1"] = "balance",
			["Alias2"] = "7"
		}
	},
	["gamble"] = {
		["Description"] = "Has a chance of adding or removing points from the speaker."
		Aliases = {
			["Alias"] = "8"
		}
	},
	["work"] = {
		["Description"] = "Gives the speaker points."
		Aliases = {
			["Alias"] = "9"
		}
	},
}
```

## Configuring Messages
```lua
local Message_list = {
	["On_Move"] = { -- The message used whenever a player uses forwards, backwards, etc.
		["Enabled"] = true, -- Whether this message is enabled or not.
		["Message"] = "[-_C] _P has made me move _D." -- The message itself. "_C" replaces with the cost, "_P" replaces with the speaker's username, "_D" replaces with the direction.
	},
	["On_Jump"] = { -- The message used whenever a player uses jump.
		["Enabled"] = true,
		["Message"] = "[-_C] _P has made me jump."
	},
	["On_Die"] = { -- The message used whenever a player uses die.
		["Enabled"] = true,
		["Message"] = "[-_C] _P has made me die."
	},
	["On_Points"] = { -- The message used whenever a player uses points.
		["Enabled"] = true,
		["Message"] = "[_B] _P's points." -- "_B" replaces with the speaker's points / balance.
	},
	["On_Gamble"] = { -- The message used whenever a player uses gamble.
		["Enabled"] = true,
		["Success"] = "[+_A] Congratulations, _P.", -- The message when a player wins. "_A" replaces with the amount their lost / won.
		["Lost"] = "[-_A] Better luck next time, _P.", -- The message when a player lost.
		["Cooldown"] = "You're still on cooldown, _P." -- The message when the player's still on cooldown.
	},
	["On_Work"] = { -- The message used whenever a player uses work.
		["Enabled"] = true,
		["Success"] = "[+_A] _P has completed work.",
		["Cooldown"] = "You're still on cooldown, _P." -- The message when the player's still on cooldown.
	},
}
```

## Points and Values
```lua
local Points_List = { -- This fun and intuitive points system prevents spam for you, and keeps the bot fun for others.
	["On_Move"] = 5 -- How many points are deducted for forwards, backwards, etc movements.
	["On_Jump"] = 0 -- How many points are deducted for jump.
	["On_Die"] = 50 -- How many points are deducted for die.
	["On_Points"] = 0 -- How many points are deducted for die.
	["On_Gamble"] = {
		["Win"] = 25, -- How many points are awarded for winning.
		["Lose"] = 20, -- How many points are deducted for losing.
		["Cooldown"] = 60 -- How long it takes player's to use the command again. (In seconds)
	}
	["On_Work"] = {
		["Amount"] = 30, -- How many points are awarded for working
		["Cooldown"] = 120 -- How long it takes player's to use the command again. (In seconds)
	}
}
```
