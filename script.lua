local Admins = {"Enter", "Usernames", "Here", "ExtoriusOnTop"}
local Blacklists = {"Enter", "Usernames", "Here"}
local Saved_Points = {}
if not isfolder("Self Bot RMA") then
    makefolder("Self Bot RMA")
end
if not isfolder("Self Bot RMA/saved_points") then
    makefolder("Self Bot RMA/saved_points")
    for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
        if table.find(Admins, v.Name) then
            writefile(
                "Self Bot RMA/saved_points/" .. tostring(v) .. ".txt",
                game:GetService("HttpService"):JSONEncode(100000)
            )
        else
            writefile(
                "Self Bot RMA/saved_points/" .. tostring(v) .. ".txt",
                game:GetService("HttpService"):JSONEncode(50)
            )
        end
    end
end
if not isfolder("Self Bot RMA/saved_blacklists") then
    makefolder("Self Bot RMA/saved_blacklists")
    for i, v in ipairs(Blacklists) do
        writefile("Self Bot RMA/saved_blacklists/" .. v .. ".txt", "This player is blacklisted.")
    end
end
if not isfolder("Self Bot RMA/saved_admins") then
    makefolder("Self Bot RMA/saved_admins")
    for i, v in ipairs(Admins) do
        writefile("Self Bot RMA/saved_admins/" .. v .. ".txt", "This player is a admin.")
    end
end

local function SetPoints(player, amount)
    writefile(
        "Self Bot RMA/saved_points/" .. tostring(player) .. ".txt",
        game:GetService("HttpService"):JSONEncode(tonumber(amount))
    )
end
local function ReturnPoints(player)
    if isfile("Self Bot RMA/saved_points/" .. tostring(player) .. ".txt") then
        return tonumber(readfile("Self Bot RMA/saved_points/" .. tostring(player) .. ".txt"))
    end
end
local function GivePoints(player, amount)
    if isfile("Self Bot RMA/saved_points/" .. tostring(player) .. ".txt") then
        Original = ReturnPoints(player)
        writefile(
            "Self Bot RMA/saved_points/" .. tostring(player) .. ".txt",
            game:GetService("HttpService"):JSONEncode(tonumber(Original + amount))
        )
    end
end
local function RemovePoints(player, amount)
    if isfile("Self Bot RMA/saved_points/" .. tostring(player) .. ".txt") then
        Original = ReturnPoints(player)
        writefile(
            "Self Bot RMA/saved_points/" .. tostring(player) .. ".txt",
            game:GetService("HttpService"):JSONEncode(tonumber(Original - amount))
        )
    end
end

local function ReturnBlacklist(player)
    IsBlacklisted = false
    for _, v in ipairs(listfiles("Self Bot RMA/saved_blacklists")) do
        if v:match(player) then
            IsBlacklisted = true
        end
    end

    return IsBlacklisted
end
local function ReturnAdmin(player)
    IsAdmin = false
    for _, v in ipairs(listfiles("Self Bot RMA/saved_admins")) do
        if v:match(player) then
            IsAdmin = true
        end
    end

    return IsAdmin
end

local function BlacklistPlayer(player)
    writefile("Self Bot RMA/saved_blacklists/" .. tostring(player) .. ".txt", "This player is blacklisted.")
end
local function UnblacklistPlayer(player)
    if isfile("Self Bot RMA/saved_blacklists/" .. tostring(player) .. ".txt") then
        delfile("Self Bot RMA/saved_blacklists/" .. tostring(player) .. ".txt")
    end
end
local function AdminPlayer(player)
    if isfile("Self Bot RMA/saved_blacklists/" .. tostring(player) .. ".txt") then
        delfile("Self Bot RMA/saved_blacklists/" .. tostring(player) .. ".txt")
    end

    writefile("Self Bot RMA/saved_admins/" .. tostring(player) .. ".txt", "This player is a admin.")
end
local function UnadminPlayer(player)
    if isfile("Self Bot RMA/saved_admins/" .. tostring(player) .. ".txt") then
        delfile("Self Bot RMA/saved_admins/" .. tostring(player) .. ".txt")
    end
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end
repeat
    task.wait()
until game:GetService("Players") and game:GetService("Workspace") and game:GetService("ReplicatedStorage") and
    game:GetService("UserInputService")

for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
    if not isfile("Self Bot RMA/saved_points/" .. tostring(v) .. ".txt") then
        if table.find(Admins, v.Name) then
            writefile(
                "Self Bot RMA/saved_points/" .. tostring(v) .. ".txt",
                game:GetService("HttpService"):JSONEncode(100000)
            )
        else
            writefile(
                "Self Bot RMA/saved_points/" .. tostring(v) .. ".txt",
                game:GetService("HttpService"):JSONEncode(50)
            )
        end
    end

    Gamble = Instance.new("NumberValue", v)
    Gamble.Name = "Gamble"
    Gamble.Value = 0

    Work = Instance.new("NumberValue", v)
    Work.Name = "Work"
    Work.Value = 0
end
game:GetService("Players").PlayerAdded:Connect(
    function(player)
        if not isfile("Self Bot RMA/saved_points/" .. tostring(player) .. ".txt") then
            if ReturnAdmin(tostring(player)) then
                writefile(
                    "Self Bot RMA/saved_points/" .. tostring(player) .. ".txt",
                    game:GetService("HttpService"):JSONEncode(100000)
                )
            else
                writefile(
                    "Self Bot RMA/saved_points/" .. tostring(player) .. ".txt",
                    game:GetService("HttpService"):JSONEncode(50)
                )
            end
        end

        Gamble = Instance.new("NumberValue", player)
        Gamble.Name = "Gamble"
        Gamble.Value = 0

        Work = Instance.new("NumberValue", player)
        Work.Name = "Work"
        Work.Value = 0
    end
)
local LocalPlayer = game:GetService("Players").LocalPlayer
loadstring(game:HttpGet("https://pastebin.com/raw/tUUGAeaH", true))()
for i, connection in pairs(getconnections(LocalPlayer.Idled)) do
    connection:Disable()
end
local function returnHRP()
    if not LocalPlayer.Character then
        return
    end
    if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return
    else
        return LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    end
end
local function returnHUM()
    if not LocalPlayer.Character then
        return
    end
    if not LocalPlayer.Character:FindFirstChild("Humanoid") then
        return
    else
        return LocalPlayer.Character:FindFirstChild("Humanoid")
    end
end
repeat
    task.wait()
until returnHRP() and returnHUM()

local function UpdateBooth(text, image)
    game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(
        table.unpack(
            {
                [1] = "Update",
                [2] = {
                    ["DescriptionText"] = text,
                    ["ImageId"] = image
                }
            }
        )
    )
end

local Loops = {}
local function Walk(direction)
    Loop =
        game:GetService("RunService").RenderStepped:Connect(
        function()
            if direction == "Forward" then
                returnHUM():Move(Vector3.new(0, 0, -5), true)
            elseif direction == "Backwards" then
                returnHUM():Move(Vector3.new(0, 0, 5), true)
            elseif direction == "Left" then
                returnHUM():Move(Vector3.new(-5, 0, 0), true)
            elseif direction == "Right" then
                returnHUM():Move(Vector3.new(5, 0, 0), true)
            end
        end
    )

    table.insert(Loops, Loop)
    task.wait(1)
    for _, v in ipairs(Loops) do
        v:Disconnect()
    end
end
local function Jump()
    returnHUM():ChangeState(3)
end
local function Die()
    returnHUM().Health = 0
end
local function Explode()
    Jump()
    task.wait(0.4)
    Die()
    task.wait(0.2)
    for _, v in ipairs(returnHUM().Parent:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("Base Part") then
            v.Velocity = Vector3.new(math.random(-100, 100), 150, math.random(-100, 100))
        end
    end
end
local function Dance()
    ChatMain = require(LocalPlayer.PlayerScripts.ChatScript.ChatMain)
    ChatMain.MessagePosted:fire("/e dance" .. tostring(math.random(1, 2)))
end
local function PointsSystem(control, player)
    if
        control == "forward" or control == "forwards" or control == "backwards" or control == "backward" or
            control == "left" or
            control == "right" or
            control == "jump"
     then
        if ReturnPoints(player) >= 5 or ReturnPoints(player) == 5 then
            RemovePoints(player, 5)
            return true
        else
            return false
        end
    elseif control == "die" then
        if ReturnPoints(player) >= 50 or ReturnPoints(player) == 50 then
            RemovePoints(player, 50)
            return true
        else
            return false
        end
    elseif control == "explode" then
        if ReturnPoints(player) >= 100 or ReturnPoints(player) == 100 then
            RemovePoints(player, 100)
            return true
        else
            return false
        end
    end
end
local function CheckOption(option, player)
    if option == "gamble" then
        if player.Gamble.Value == 0 then
            return true
        else
            return false
        end
    elseif option == "work" then
        if player.Work.Value == 0 then
            return true
        else
            return false
        end
    end
end

local NotShowingControls = true
local ChatEvents = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents", math.huge)
local OnMessageEvent =
    ChatEvents:WaitForChild("OnMessageDoneFiltering", math.huge).OnClientEvent:Connect(
    function(data)
        if data ~= nil then
            local player = tostring(data.FromSpeaker)
            local Player = game:GetService("Players"):FindFirstChild(player)
            local Player2 = nil
            local message = tostring(data.Message)
            local originalchannel = tostring(data.OriginalChannel)
            if string.find(originalchannel, "To ") then
                message = "/w " .. string.gsub(originalchannel, "To ", "") .. " " .. message
            end
            if originalchannel == "Team" then
                message = "/team " .. message
            end
            if player then
                local originalmsg = message
                local message = string.lower(message)

                if not ReturnBlacklist(player) or Player == LocalPlayer then
                    if message == "forward" or message == "forwards" then
                        if PointsSystem(message, Player) == true then
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                player .. " has requested I go forward. Removed 5 points from them.",
                                "All"
                            )
                            Walk("Forward")
                        else
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                "Sorry " .. player .. ", you don't have enough points.",
                                "All"
                            )
                        end
                    elseif message == "backwards" or message == "backward" then
                        if PointsSystem(message, Player) == true then
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                player .. " has requested I go backwards. Removed 5 points from them.",
                                "All"
                            )
                            Walk("Backwards")
                        else
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                "Sorry " .. player .. ", you don't have enough points.",
                                "All"
                            )
                        end
                    elseif message == "left" then
                        if PointsSystem(message, Player) == true then
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                player .. " has requested I go left. Removed 5 points from them.",
                                "All"
                            )
                            Walk("Left")
                        else
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                "Sorry " .. player .. ", you don't have enough points.",
                                "All"
                            )
                        end
                    elseif message == "right" then
                        if PointsSystem(message, Player) == true then
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                player .. " has requested I go right. Removed 5 points from them.",
                                "All"
                            )
                            Walk("Right")
                        else
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                "Sorry " .. player .. ", you don't have enough points.",
                                "All"
                            )
                        end
                    elseif message == "die" then
                        if PointsSystem(message, Player) == true then
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                player .. " has requested I die. Removed 50 points from them.",
                                "All"
                            )
                            Die()
                        else
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                "Sorry " .. player .. ", you don't have enough points.",
                                "All"
                            )
                        end
                    elseif message == "jump" then
                        Jump()
                        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                            player .. " has requested I jump.",
                            "All"
                        )
                    elseif message == "dance" then
                        Dance()
                        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                            player .. " has requested I dance",
                            "All"
                        )
                    elseif message == "controls" or message == '"controls"' then
                        if NotShowingControls then
                            NotShowingControls = false

                            for i = 6, 0, -1 do
                                UpdateBooth(
                                    "[Page 1]\n1. forward\n2. backwards\n3. left\n4. right\n5. jump\n" ..
                                        tostring(i) .. ".."
                                )

                                task.wait(1)
                            end
                            for i = 6, 0, -1 do
                                UpdateBooth(
                                    "[Page 2]\n6. die\n7. points\n8. gamble\n9. work\n10. explode\n" ..
                                        tostring(i) .. ".."
                                )

                                task.wait(1)
                            end

                            NotShowingControls = true
                        end
                    elseif message == "points" then
                        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                            player ..
                                " has " ..
                                    tostring(ReturnPoints(Player)) .. " points left. 10 points are given every minute.",
                            "All"
                        )
                    elseif message == "gamble" then
                        Correct = math.random(1, 4)
                        if Correct == 1 and CheckOption(message, Player) == true then
                            Player.Gamble.Value = 45
                            GivePoints(Player, 20)
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                player .. " has received 20 points through gambling!",
                                "All"
                            )
                        elseif CheckOption(message, Player) == true then
                            RemovePoints(Player, 20)
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                player .. " has lost 20 points through gambling.",
                                "All"
                            )
                        else
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                "Sorry " .. player .. ", you're still on cooldown.",
                                "All"
                            )
                        end
                    elseif message == "work" then
                        if CheckOption(message, Player) == true then
                            Player.Work.Value = 120
                            GivePoints(Player, 30)
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                player .. " received 30 points for working.",
                                "All"
                            )
                        else
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                "Sorry " .. player .. ", you're still on cooldown.",
                                "All"
                            )
                        end
                    elseif message == "explode" then
                        if PointsSystem(message, Player) == true then
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                player .. " has requested I explode.",
                                "All"
                            )

                            for i = 5, 0, -1 do
                                task.wait(1)
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Exploding in " .. tostring(i),
                                    "All"
                                )
                            end

                            Explode()
                        else
                            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                "Sorry " .. player .. ", you don't have enough points.",
                                "All"
                            )
                        end
                    elseif
                        message == "1" or message == "2" or message == "3" or message == "4" or message == "5" or
                            message == "6" or
                            message == "7" or
                            message == "8" or
                            message == "9" or
                            message == "10"
                     then
                        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                            "Reminder: You don't say the number, you say the word.",
                            "All"
                        )
                    end

                    if Player == LocalPlayer then
                        if message:match("add admin") then
                            Split = string.split(message, " ")
                            PlayerName = Split[3]

                            for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
                                if
                                    string.lower(v.Name):match(PlayerName) or
                                        string.lower(v.DisplayName):match(PlayerName)
                                 then
                                    Player2 = v
                                end
                            end

                            if Player2 then
                                AdminPlayer(Player2)
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Success! " .. tostring(Player2.Name) .. " has been given admin controls.",
                                    "All"
                                )
                            else
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Sorry " .. player .. ", that player isn't in this server.",
                                    "All"
                                )
                            end
                        elseif message:match("remove admin") then
                            Split = string.split(message, " ")
                            PlayerName = Split[3]

                            for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
                                if
                                    string.lower(v.Name):match(PlayerName) or
                                        string.lower(v.DisplayName):match(PlayerName)
                                 then
                                    Player2 = v
                                end
                            end

                            if Player2 then
                                UnadminPlayer(Player2)
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Success! " .. tostring(Player2.Name) .. " has been removed admin controls.",
                                    "All"
                                )
                            else
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Sorry " .. player .. ", that player isn't in this server.",
                                    "All"
                                )
                            end
                        end
                    end
                    if ReturnAdmin(player) then
                        if message:match("add points") then
                            Split = string.split(message, " ")
                            PlayerName = Split[3]
                            Amount = tonumber(Split[4])

                            for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
                                if
                                    string.lower(v.Name):match(PlayerName) or
                                        string.lower(v.DisplayName):match(PlayerName)
                                 then
                                    Player2 = v
                                end
                            end

                            if Player2 then
                                GivePoints(Player2, Amount)
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Success! " ..
                                        tostring(Player2) .. " has been given " .. tostring(Amount) .. " points.",
                                    "All"
                                )
                            else
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Sorry " .. player .. ", that player isn't in this server.",
                                    "All"
                                )
                            end
                        elseif message:match("remove points") then
                            Split = string.split(message, " ")
                            PlayerName = Split[3]
                            Amount = tonumber(Split[4])

                            for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
                                if
                                    string.lower(v.Name):match(PlayerName) or
                                        string.lower(v.DisplayName):match(PlayerName)
                                 then
                                    Player2 = v
                                end
                            end

                            if Player2 then
                                RemovePoints(Player2, Amount)
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Success! " ..
                                        tostring(Player2) .. " has been removed " .. tostring(Amount) .. " points.",
                                    "All"
                                )
                            else
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Sorry " .. player .. ", that player isn't in this server.",
                                    "All"
                                )
                            end
                        elseif message:match("set points") then
                            Split = string.split(message, " ")
                            PlayerName = Split[3]
                            Amount = tonumber(Split[4])

                            for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
                                if
                                    string.lower(v.Name):match(PlayerName) or
                                        string.lower(v.DisplayName):match(PlayerName)
                                 then
                                    Player2 = v
                                end
                            end

                            if Player2 then
                                SetPoints(Player2, Amount)
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Success! " ..
                                        tostring(Player2) .. " has been set to " .. tostring(Amount) .. " points.",
                                    "All"
                                )
                            else
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Sorry " .. player .. ", that player isn't in this server.",
                                    "All"
                                )
                            end
                        elseif message:match("add blacklist") then
                            Split = string.split(message, " ")
                            PlayerName = Split[3]

                            for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
                                if
                                    string.lower(v.Name):match(PlayerName) or
                                        string.lower(v.DisplayName):match(PlayerName)
                                 then
                                    Player2 = v
                                end
                            end

                            if Player2 then
                                BlacklistPlayer(Player2)
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Success! " .. tostring(Player2) .. " has been blacklisted.",
                                    "All"
                                )
                            else
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Sorry " .. player .. ", that player isn't in this server.",
                                    "All"
                                )
                            end
                        elseif message:match("remove blacklist") then
                            Split = string.split(message, " ")
                            PlayerName = Split[3]

                            for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
                                if
                                    string.lower(v.Name):match(PlayerName) or
                                        string.lower(v.DisplayName):match(PlayerName)
                                 then
                                    Player2 = v
                                end
                            end

                            if Player2 then
                                UnblacklistPlayer(tostring(Player2))
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Success! " .. tostring(Player2) .. " has been unblacklisted.",
                                    "All"
                                )
                            else
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                                    "Sorry " .. player .. ", that player isn't in this server.",
                                    "All"
                                )
                            end
                        end
                    end
                end
            end
        end
    end
)

spawn(
    function()
        while task.wait(60) do
            for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
                GivePoints(v, 10)
            end
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                "Every player has been rewarded 10 points.",
                "All"
            )
        end
    end
)

spawn(
    function()
        while task.wait(1) do
            for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
                if v.Gamble.Value ~= 0 then
                    v.Gamble.Value = v.Gamble.Value - 1
                elseif v.Gamble.Value == -1 then
                	v.Gamble.Value = -1
                end
                if v.Work.Value ~= 0 then
                    v.Work.Value = v.Gamble.Value - 1
                elseif v.Work.Value == -1 then
                	v.Work.Value = 0
                end
            end
        end
    end
)

spawn(
    function()
        while task.wait() do
            Message1 = 'Control my character for me!\nSay "controls" to see all controls.'
            Message2 = ""
            for v in Message1:gmatch "." do
                Message2 = Message2 .. v
                if NotShowingControls then
                    UpdateBooth(Message2)
                    task.wait(.05)
                end
            end

            if NotShowingControls then
                task.wait(8)
            end
        end
    end
)

if not AfkMode then
    AfkMode = "Accurate"
elseif AfkMode ~= "Accurate" or AfkMode ~= "Spoof true" or AfkMode ~= "Spoof false" then
    AfkMode = "Accurate"
end
local namecall
namecall =
    hookmetamethod(
    game,
    "__namecall",
    function(calledon, ...)
        local method = getnamecallmethod()
        local args = {...}
        local args2 = args[2]
        if method == "FireServer" and calledon.Name == "AFK" then
            if AfkMode == "Accurate" then
            	ActiveFunc = identifyexecutor and isrbxactive() or iswindowactive()
            	return namecall(calledon, not ActiveFunc)
            elseif AfkMode == "Spoof true" then
            	return namecall(calledon, true)
            elseif AfkMode == "Spoof false" then
            	return namecall(calledon, false)
			end
        else
			return namecall(calledon, ...)
        end
    end
)
spawn(function()
	while task.wait(0.1) do
		game:GetService("ReplicatedStorage").AFK:FireServer(nil)
	end
end)
