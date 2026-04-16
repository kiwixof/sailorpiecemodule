local Module = {}

function Module.AutoAttack()
    local Event = game:GetService("ReplicatedStorage").CombatSystem.Remotes.RequestHit
    Event:FireServer()
end

function Module.AcceptQuest(quest)
    local Event = game:GetService("ReplicatedStorage").RemoteEvents.QuestAccept
    Event:FireServer(quest)
end

function Module.TeleportBypass(char,target)
    local Event = game:GetService("ReplicatedStorage").Remotes.TeleportToPortal
    Event:FireServer(
        "Academy"
    )
    task.wait(0.3)
    char.CFrame = CFrame.new(unpack(target))
end

function Module.FindTargetMob(mob)
    local targetMob;
    local NPCs = game.Workspace:FindFirstChild("NPCs")
    if NPCs then
        for _, v in pairs(NPCs:GetChildren()) do
            if v.Name:match(mob) then
                targetMob = v
                break
            end
        end
    end

    return targetMob
end

function Module.TeleportMob(mob,char)
    
    local targetMob = Module.FindTargetMob(mob)
    char.HumanoidRootPart.Positon = targetMob.Position + Vector3.new(0,5,0)
    char.HumanoidRootPart.CFrame = CFrame.lookAt(char.HumanoidRootPart.Positon, targetMob.Position)
    
end

return Module
