repeat wait() until game:IsLoaded()



local ID = game.PlaceId
local Earth = 536102540
local Queue = 3565304751
local top = 535527772
local htop = 3552158750

function AntiKick()
    if game:GetService("CoreGui").RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt") then
        game:GetService("TeleportService"):Teleport(Queue)
    end
end

game:GetService("RunService").Stepped:Connect(AntiKick)

if ID == top or ID == htop then 
    wait(3)
end

repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui.HUD and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Humanoid and game.Players.LocalPlayer.Character.HumanoidRootPart


local localPlayer = game.Players.LocalPlayer
local Char = localPlayer.Character
local Hum = Char.Humanoid
local HRP = Char.HumanoidRootPart
local Buy = false
local jd = false

money = string.sub(game:GetService("Players").LocalPlayer.PlayerGui.HUD.FullSize.Money.Text, 2)
money = string.gsub(money, ",", "")

print(money)

if tonumber(money) == 2000000 then
    Buy = true
end


if ID == Earth then
    if Buy == false then
        game:GetService("TeleportService"):Teleport(Queue)
    else
        repeat wait()
            local npc = workspace.FriendlyNPCs:FindFirstChild("Korin BEANS")
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(npc)
            wait(0.65)

            local messages = {"k", "k", "Beans", "k", "80", "k", "Red", "k", "Yes", "k"}
            for _, message in ipairs(messages) do
                game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({[1] = message})
                wait(0.35)
            end
        until tonumber(money) == 0
        game:GetService("TeleportService"):Teleport(Queue)
    end
elseif ID == Queue then
    if Buy == false then
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("Seat") and v.BrickColor.Name == "New Yeller" then
                HRP.CFrame = v.CFrame
            end
        end
        wait(20)
        game:GetService("TeleportService"):Teleport(Queue)
    else
        game:GetService("TeleportService"):Teleport(Earth)
    end
elseif ID == top or ID == htop then



    task.spawn(function()
        wait(120)
        game:GetService("TeleportService"):Teleport(Queue)
    end)

    if game.Workspace.Live:FindFirstChild("Prum") then
        local prum = game.Workspace.Live:FindFirstChild("Prum")
        if prum:FindFirstChild("Humanoid") and prum:FindFirstChild("HumanoidRootPart") then
            game:GetService("TweenService"):Create(HRP, TweenInfo.new(.3, Enum.EasingStyle.Linear), {CFrame = prum.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)}):Play()

            local tp = game:GetService("RunService").Stepped:Connect(function()
                if prum.Humanoid.Health > 0 then
                    HRP.CFrame = prum.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
                    local camera = game.Workspace.CurrentCamera
            	    camera.CFrame = CFrame.new(camera.CFrame.Position, prum.HumanoidRootPart.Position)
                end
            end)

            repeat wait() 
                game.Players.LocalPlayer.Backpack.ServerTraits.EatSenzu:FireServer(true)

                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "Anger Rush" then
                        v.Parent = game.Players.LocalPlayer.Character
                        v:Activate()
                        wait(0.1)
                        v:Deactivate()
                        v.Parent = game.Players.LocalPlayer.Backpack
                    end
                end
            until not prum or prum.Humanoid.Health <= 0
            tp:Disconnect()
            prum:Destroy()
        end
    end

    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Part") and v.CanCollide == true then
            v.CanCollide = false
        end
    end

    game:GetService("TweenService"):Create(HRP, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {CFrame = CFrame.new(-193, 310, -33)}):Play()
    wait(.3)

    HRP.Anchored = true

    players = {}

    game:GetService("RunService").Stepped:Connect(function()
        game.Players.LocalPlayer.Backpack.ServerTraits.EatSenzu:FireServer(true)
        for y,n in pairs(game.Players:GetChildren()) do
            table.insert(players, n.Name)
        end
    end)

    game:GetService("RunService").Stepped:Connect(function()
        game.Players.LocalPlayer.Backpack.ServerTraits.EatSenzu:FireServer(true)

        if game.Workspace.Live:FindFirstChild("Jiren") then
            jd = true
        end

        for t,c in pairs(game.Workspace.Live:GetChildren()) do
            if not table.find(players, c.Name) and c:FindFirstChild("Humanoid") and c:FindFirstChild("HumanoidRootPart") and c.Humanoid.Health > 0 then  
                for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:FindFirstChild("Ki") and v:FindFirstChild("Mesh") then
                        v.CFrame = c.HumanoidRootPart.CFrame
                        local camera = game.Workspace.CurrentCamera
            	        camera.CFrame = CFrame.new(camera.CFrame.Position, c.HumanoidRootPart.Position)

                        break
                    end
                end
            end
        end

    end)

    repeat wait()
        for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "Chain Destructo Disk" then
                v.Parent = game.Players.LocalPlayer.Character
                v:Activate()
                wait(0.1)
                v:Deactivate()
                v.Parent = game.Players.LocalPlayer.Backpack
            end
        end

    until #game.Workspace.Live:GetChildren() == #game.Players:GetChildren() and jd

    while wait() do 

        local npc = workspace.FriendlyNPCs:FindFirstChild("Zenoh-sama")
        game.Players.LocalPlayer.Backpack.ServerTraits.ChatStart:FireServer(npc)
        wait(0.65)

        local messages = {"k", "100k Zenni", "k", "Yes", "k"}
        for _, message in ipairs(messages) do
            game.Players.LocalPlayer.Backpack.ServerTraits.ChatAdvance:FireServer({[1] = message})
            wait(0.65)
        end
    end
end
