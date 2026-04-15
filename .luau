local Module = {}

function Module.AcceptQuest(quest)
    local Event = game:GetService("ReplicatedStorage").RemoteEvents.QuestAccept
    Event:FireServer(quest)
end
    

return Module
