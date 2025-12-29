local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Hoàng GM--speed of legend",
   LoadingTitle = "Mobile Ultimate Fix",
   LoadingSubtitle = "Hoàng GM",
   ConfigurationSaving = {
      Enabled = false
   },
   KeySystem = false
})

local Settings = {
    AutoFarm = false, AutoGem = false, AutoRebirth = false,
    City = "City", Power = 1,
    EnableStats = false, WS = 16, JP = 50, Noclip = false
}

local rEvents = game:GetService("ReplicatedStorage"):WaitForChild("rEvents", 10)
local orbRemote = rEvents and rEvents:FindFirstChild("orbEvent")
local rebirthRemote = rEvents and rEvents:FindFirstChild("rebirthEvent")

local TabFarm = Window:CreateTab("Auto Farm", 4483362458)

TabFarm:CreateSection("Thu Thập")

TabFarm:CreateToggle({
   Name = "Auto Farm Speed (Orb)",
   CurrentValue = false,
   Callback = function(v) Settings.AutoFarm = v end,
})

TabFarm:CreateToggle({
   Name = "Auto Farm Gems",
   CurrentValue = false,
   Callback = function(v) Settings.AutoGem = v end,
})

TabFarm:CreateToggle({
   Name = "Auto Rebirth (Tự tái sinh)",
   CurrentValue = false,
   Callback = function(v) Settings.AutoRebirth = v end,
})

TabFarm:CreateInput({
   Name = "Sức Mạnh Farm (Max 150)",
   PlaceholderText = "Nhập số (1-150)",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      local num = tonumber(Text)
      if num then
         Settings.Power = math.clamp(num, 1, 150)
      end
   end,
})

local TabChar = Window:CreateTab("Nhân Vật", 4483345998)

TabChar:CreateSection("Chỉ Số")

TabChar:CreateToggle({
   Name = "KÍCH HOẠT SPEED/JUMP",
   CurrentValue = false,
   Callback = function(v) 
       Settings.EnableStats = v 
       if not v then
           pcall(function()
               game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
               game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
           end)
       end
   end,
})

TabChar:CreateInput({
   Name = "Nhập Tốc Độ (WalkSpeed)",
   PlaceholderText = "Mặc định 16",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      Settings.WS = tonumber(Text) or 16
   end,
})

TabChar:CreateInput({
   Name = "Nhập Lực Nhảy (JumpPower)",
   PlaceholderText = "Mặc định 50",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      Settings.JP = tonumber(Text) or 50
   end,
})

TabChar:CreateToggle({
   Name = "Xuyên Tường (Noclip)",
   CurrentValue = false,
   Callback = function(v) Settings.Noclip = v end,
})

task.spawn(function()
    while task.wait(0.01) do
        if Settings.AutoFarm and orbRemote then
            pcall(function()
                for i = 1, Settings.Power do
                    orbRemote:FireServer("collectOrb", "Red Orb", Settings.City)
                end
            end)
        end
        if Settings.AutoGem and orbRemote then
            pcall(function() orbRemote:FireServer("collectOrb", "Gem", Settings.City) end)
        end
        if Settings.AutoRebirth and rebirthRemote then
            pcall(function() rebirthRemote:FireServer("rebirthRequest") end)
        end
    end
end)

game:GetService("RunService").Stepped:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        if Settings.EnableStats then
            char.Humanoid.WalkSpeed = Settings.WS
            char.Humanoid.JumpPower = Settings.JP
        end
        if Settings.Noclip then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end
end)
