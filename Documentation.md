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
		["Makes the character move forwards."] -- Description
		Aliases = { -- Other acceptable words / phrases users can say to use the same command. Non case-sensitive.
			["forward"],
			["walk"],
			["move"],
			["1"]
		}
	},
	["backwards"] = {
		["Makes the character move backwards."]
		Aliases = {
			["backward"],
			["down"],
			["back"],
			["2"]
		}
	},
	["left"] = {
		["Makes the character move left."]
		Aliases = {
			["3"]
		}
	},
	["right"] = {
		["Makes the character move right."]
		Aliases = {
			["4"]
		}
	},
	["jump"] = {
		["Makes the character jump."]
		Aliases = {
			["up"],
			["5"]
		}
	},
	["die"] = {
		["Makes the character die."]
		Aliases = {
			["oof"],
			["kill"],
			["dead"],
			["6"]
		}
	},
	["points"] = {
		["Displays / Says how many points the speaker has."] -- Speaker being whoever used the command.
		Aliases = {
			["balance"],
			["7"]
		}
	},
	["gamble"] = {
		["Has a chance of adding or removing points from the speaker."]
		Aliases = {
			["8"]
		}
	},
	["work"] = {
		["Gives the speaker points."]
		Aliases = {
			["9"]
		}
	},
}
```

## Configuring Messages
```lua
local Message_list = {
	On_Move = { -- The message used whenever a player uses forwards, backwards, etc.
		["Enabled"] = true, -- Whether this message is enabled or not.
		["Message"] = "[-_C] _P has made me move _D." -- The message itself. "_C" replaces with the cost, "_P" replaces with the speaker's username, "_D" replaces with the direction.
	},
	On_Jump = { -- The message used whenever a player uses jump.
		["Enabled"] = true,
		["Message"] = "[-_C] _P has made me jump."
	},
	On_Die = { -- The message used whenever a player uses die.
		["Enabled"] = true,
		["Message"] = "[-_C] _P has made me die."
	},
	On_Points = { -- The message used whenever a player uses points.
		["Enabled"] = true,
		["Message"] = "[_B] _P's points." -- "_B" replaces with the speaker's points / balance.
	},
	On_Gamble = { -- The message used whenever a player uses gamble.
		["Enabled"] = true,
		["Success"] = "[+_A] Congratulations, _P.", -- The message when a player wins. "_A" replaces with the amount their lost / won.
		["Lost"] = "[-_A] Better luck next time, _P.", -- The message when a player lost.
		["Cooldown"] = "You're still on cooldown, _P." -- The message when the player's still on cooldown.
	},
	On_Work = { -- The message used whenever a player uses work.
		["Enabled"] = true,
		["Success"] = "[+_A] _P has completed work.",
		["Cooldown"] = "You're still on cooldown, _P." -- The message when the player's still on cooldown.
	},
}
```
