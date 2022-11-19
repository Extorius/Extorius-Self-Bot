local ChatEvents = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents", math.huge)
local OnMessageEvent =
    ChatEvents:WaitForChild("OnMessageDoneFiltering", math.huge).OnClientEvent:Connect(
    function(data)
        if data ~= nil then
            local player = tostring(data.FromSpeaker)
            local Player = game:GetService("Players"):FindFirstChild(player)
            local message = tostring(data.Message)
            local originalchannel = tostring(data.OriginalChannel)
            if string.find(originalchannel, "To ") then
                message = "/w " .. string.gsub(originalchannel, "To ", "") .. " " .. message
            end
            if originalchannel == "Team" then
                message = "/team " .. message
            end
            print(tostring(Player)) -- Player is a player instance
            print(player) -- player is a string (Player.Name)
            print(message) -- String
        end
    end
)
