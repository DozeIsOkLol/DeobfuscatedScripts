-- ts file was generated at discord.gg/25ms


setfpscap(144)
local v1 = game:GetService("HttpService")
local v2 = game:GetService("Players")
local vu3 = game:GetService("Workspace")
local vu4 = game:GetService("RunService")
local vu5 = game:GetService("TweenService")
local vu6 = game:GetService("ReplicatedStorage")
local v7 = game:GetService("MarketplaceService")
local vu8 = game:GetService("UserInputService")
local vu9 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local v10 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local v11 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local vu12 = v2.LocalPlayer
local v13 = v1:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/Hl3n/purge/refs/heads/main/version.json"))
local v14 = next(v13)
local function vu21()
    local v15, v16, v17 = ipairs(vu3:WaitForChild("Farm"):GetChildren())
    while true do
        local vu18
        v17, vu18 = v15(v16, v17)
        if v17 == nil then
            break
        end
        if vu18:IsA("Folder") then
            local v19, v20 = pcall(function()
                return vu18:WaitForChild("Important"):WaitForChild("Data"):WaitForChild("Owner").Value
            end)
            if v19 and v20 == vu12.Name then
                return vu18
            end
        end
    end
    return nil
end
local vu22 = vu21()
if not vu22 then
    vu9:Notify({
        Title = "Soluna Warning",
        Content = "Could not find your farm plot.",
        SubContent = "Some features may not work until it\'s found.",
        Duration = 8
    })
end
local v23 = vu9:CreateWindow({
    Title = "Soluna | v" .. v14 .. " ",
    SubTitle = v7:GetProductInfo(game.PlaceId).Name,
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 540),
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightShift
})
local v24 = {
    Welcome = v23:AddTab({
        Title = "Welcome",
        Icon = "home"
    }),
    Main = v23:AddTab({
        Title = "Main",
        Icon = "file-code"
    }),
    Automation = v23:AddTab({
        Title = "Automation",
        Icon = "rocket"
    }),
    Eggs = v23:AddTab({
        Title = "Eggs",
        Icon = "egg"
    }),
    Player = v23:AddTab({
        Title = "Player",
        Icon = "user"
    }),
    Visuals = v23:AddTab({
        Title = "Visuals",
        Icon = "eye"
    }),
    Settings = v23:AddTab({
        Title = "Settings",
        Icon = "settings"
    })
}
local vu25 = vu9.Options
vu9:Notify({
    Title = "Soluna",
    Content = "Thank you for using Soluna!",
    SubContent = "Loading features for Grow a Garden...",
    Duration = 5
})
v24.Welcome:AddParagraph({
    Title = "Welcome to Soluna!",
    Content = "This script is designed to enhance your \'Grow a Garden\' experience. You can find all the main features in the \'Automation\' tab.\n\nUse the \'Right Shift\' key to hide and show this menu at any time."
})
v24.Welcome:AddParagraph({
    Title = "How to Use",
    Content = "Simply navigate to the desired tab and toggle the features you want to use. Many features have sliders or dropdowns to customize them. Your settings can be saved in the \'Settings\' tab."
})
v24.Welcome:AddParagraph({
    Title = "Disclaimer",
    Content = "Using scripts can be against the game\'s terms of service. Use this tool responsibly and at your own risk. The developer is not responsible for any actions taken against your account."
})
v24.Main:AddButton({
    Title = "Force Show TP GUI",
    Description = "If the teleport buttons for \'Gear\' and \'Pets\' are missing from your screen, this will force them to appear.",
    Callback = function()
        vu12.PlayerGui.Teleport_UI.Frame.Pets.Visible = true
        vu12.PlayerGui.Teleport_UI.Frame.Gear.Visible = true
        vu9:Notify({
            Title = "Soluna",
            Content = "Teleport GUI has been made visible."
        })
    end
})
v24.Main:AddButton({
    Title = "Redeem Current Codes",
    Description = "Attempts to redeem all currently known active codes for the game. This list may not always be up-to-date.",
    Callback = function()
        vu9:Notify({
            Title = "Soluna",
            Content = "Code redemption is not available at this time.",
            SubContent = "No working codes found in the database.",
            Duration = 5
        })
    end
})
local vu26 = {
    "Carrot",
    "Strawberry",
    "Blueberry",
    "Orange Tulip",
    "Tomato",
    "Corn",
    "Daffodil",
    "Watermelon",
    "Pumpkin",
    "Apple",
    "Bamboo",
    "Coconut",
    "Cactus",
    "Dragon Fruit",
    "Mango",
    "Grape",
    "Mushroom",
    "Pepper",
    "Cacao",
    "Beanstalk"
}
local v27, v28, v29 = ipairs(vu26)
local vu30 = vu12
local vu31 = vu3
local v32 = {
    "All"
}
while true do
    local v33
    v29, v33 = v27(v28, v29)
    if v29 == nil then
        break
    end
    table.insert(v32, v33)
end
local v34 = v24.Automation:AddSection("Farming Management")
local vu35 = false
local vu36 = v34:AddToggle("autoHarvest", {
    Title = "Auto Harvest Fruits",
    Description = "Automatically teleports to and harvests all ready fruits on your farm. Your character will be unable to move while this is active.",
    Default = false
})
local v37 = vu36
vu36.OnChanged(v37, function(p38)
    vu35 = p38
    if p38 then
        task.spawn(function()
            local vu39 = vu30.Character
            local vu40
            if vu39 then
                vu40 = vu39:FindFirstChild("HumanoidRootPart")
            else
                vu40 = vu39
            end
            vu22 = vu22 or vu21()
            if vu22 then
                if vu40 then
                    local function v47(p41)
                        local v42 = vu39
                        local v43, v44, v45 = ipairs(v42:GetDescendants())
                        while true do
                            local v46
                            v45, v46 = v43(v44, v45)
                            if v45 == nil then
                                break
                            end
                            if v46:IsA("BasePart") then
                                v46.CanCollide = p41
                            end
                        end
                    end
                    v47(false)
                    local v48 = vu4.Stepped:Connect(function()
                        if vu35 and (vu40 and vu40.Parent) then
                            vu40.CFrame = CFrame.new(vu40.Position)
                        end
                    end)
                    while vu35 do
                        local v49, v50, v51 = ipairs(vu22.Important.Plants_Physical:GetDescendants())
                        while true do
                            local v52
                            v51, v52 = v49(v50, v51)
                            if v51 == nil or not vu35 then
                                break
                            end
                            if v52:IsA("ProximityPrompt") and v52.Enabled then
                                local v53 = v52.Parent
                                if v53 and v53:IsA("BasePart") then
                                    local v54 = v53.Position + Vector3.new(0, 5, 0)
                                    local v55 = vu5:Create(vu40, TweenInfo.new(0.1, Enum.EasingStyle.Sine), {
                                        CFrame = CFrame.new(v54)
                                    })
                                    v55:Play()
                                    v55.Completed:Wait()
                                    task.wait(0.1)
                                    fireproximityprompt(v52)
                                end
                            end
                        end
                        task.wait(0.3)
                    end
                    v47(true)
                    if v48 then
                        v48:Disconnect()
                    end
                else
                    vu9:Notify({
                        Title = "Auto Harvest Error",
                        Content = "Your character could not be found."
                    })
                    vu36:SetValue(false)
                end
            else
                vu9:Notify({
                    Title = "Auto Harvest Error",
                    Content = "Your farm plot could not be found. Cannot start harvesting."
                })
                vu36:SetValue(false)
                return
            end
        end)
    end
end)
local vu56 = false
local vu57 = 4
v34:AddToggle("autoSell", {
    Title = "Auto Sell All",
    Description = "Periodically teleports you to the sell point to automatically sell all items in your inventory.",
    Default = false
}):OnChanged(function(p58)
    vu56 = p58
    if p58 then
        task.spawn(function()
            while vu56 do
                task.wait()
                local v59 = vu30.Character.Head.CFrame
                for _ = 1, 10 do
                    vu30.Character.Head.CFrame = CFrame.new(51.5473595, 4.46941805, 1.61525869, 0.0307160839, - 0.00628025876, - 0.999508381, - 6.07818038e-6, 0.999980271, - 0.00628341082, 0.99952811, 0.000199073853, 0.0307154395)
                    task.wait(0.05)
                    vu6.GameEvents.Sell_Inventory:FireServer()
                end
                task.wait(0.1)
                vu30.Character.Head.CFrame = v59
                task.wait(vu57)
            end
        end)
    end
end)
v34:AddSlider("sellFrequencySlider", {
    Title = "Auto Sell Frequency",
    Description = "How many seconds to wait between each sell cycle.",
    Default = 4,
    Min = 1,
    Max = 120,
    Rounding = 1,
    Callback = function(p60)
        vu57 = p60
    end
})
local v61 = v24.Automation:AddSection("Planting Automation")
local vu62 = false
local vu63 = {}
local vu64 = 5
local v65 = v61:AddToggle("autoBuySeeds", {
    Title = "Auto Purchase Seeds",
    Description = "Automatically buys the seeds you select from the dropdown below.",
    Default = false
})
local v66 = v61:AddDropdown("seedDropdown", {
    Title = "Seeds to Auto-Buy",
    Description = "Select which seeds you want to purchase automatically.",
    Values = v32,
    Multi = true,
    Default = {}
})
v61:AddSlider("buyFrequencySlider", {
    Title = "Auto Purchase Frequency",
    Description = "How many seconds to wait between each purchase cycle.",
    Default = 5,
    Min = 1,
    Max = 120,
    Rounding = 1,
    Callback = function(p67)
        vu64 = p67
    end
})
v66:OnChanged(function(p68)
    vu63 = {}
    if p68.All then
        vu63 = vu26
    else
        local v69, v70, v71 = pairs(p68)
        while true do
            local v72
            v71, v72 = v69(v70, v71)
            if v71 == nil then
                break
            end
            if v72 and v71 ~= "All" then
                table.insert(vu63, v71)
            end
        end
    end
end)
v65:OnChanged(function(p73)
    vu62 = p73
    if p73 then
        task.spawn(function()
            while vu62 do
                local v74, v75, v76 = ipairs(vu63)
                while true do
                    local v77
                    v76, v77 = v74(v75, v76)
                    if v76 == nil then
                        break
                    end
                    vu6.GameEvents.BuySeedStock:FireServer(v77)
                    task.wait()
                end
                task.wait(vu64)
            end
        end)
    end
end)
local vu78 = false
local vu79 = {}
local vu80 = "Player Position"
local vu81 = nil
local v82 = v61:AddToggle("placeseedtoggle", {
    Title = "Auto Place Seeds",
    Description = "Automatically plants selected seeds from your inventory. Choose a placement mode below.",
    Default = false
})
local v83 = v61:AddDropdown("placeseeddrop", {
    Title = "Seeds to Auto-Plant",
    Description = "Select which seeds you want to plant from your inventory.",
    Values = v32,
    Multi = true,
    Default = {}
})
local v84 = v61:AddDropdown("posmodeseed", {
    Title = "Placement Position",
    Description = "Choose where the seeds will be planted.",
    Values = {
        "Set Position",
        "Player Position",
        "Random Position"
    },
    Default = "Player Position"
})
v61:AddButton({
    Title = "Set Planting Position",
    Description = "Saves your character\'s current ground position for the \'Set Position\' mode.",
    Callback = function()
        if vu30.Character and vu30.Character:FindFirstChild("Head") then
            local v85 = vu30.Character.Head.Position
            vu81 = Vector3.new(v85.X, 0.135, v85.Z)
            vu9:Notify({
                Title = "Position Saved",
                Content = "Planting position has been set."
            })
        else
            vu9:Notify({
                Title = "Error",
                Content = "Could not find your character to save position."
            })
        end
    end
})
v83:OnChanged(function(p86)
    vu79 = {}
    if p86.All then
        vu79 = vu26
    else
        local v87, v88, v89 = pairs(p86)
        while true do
            local v90
            v89, v90 = v87(v88, v89)
            if v89 == nil then
                break
            end
            if v90 and v89 ~= "All" then
                table.insert(vu79, v89)
            end
        end
    end
end)
v84:OnChanged(function(p91)
    vu80 = p91
end)
v82:OnChanged(function(p92)
    vu78 = p92
    if p92 then
        task.spawn(function()
            while true do
                if true then
                    if not vu78 then
                        return
                    end
                    if # vu79 > 0 then
                    end
                end
                local v93, v94, v95 = ipairs(vu79)
                if false then
                end
                if true then
                    if false then
                    end
                end
                local v96
                v95, v96 = v93(v94, v95)
                if v95 ~= nil and vu78 then
                end
                task.wait(0.1)
            end
            local v97, v98, v99 = ipairs({
                vu30.Backpack,
                vu30.Character
            })
            local v100 = nil
            while true do
                if true then
                    if false then
                        break
                    end
                end
                local v101
                v99, v101 = v97(v98, v99)
                local v102
                if v99 == nil then
                    v102 = v100
                end
                local v103, v104, v105 = ipairs(v101:GetChildren())
                while true do
                    v105, v102 = v103(v104, v105)
                    if v105 == nil then
                        v102 = v100
                    end
                    if v102:IsA("Tool") and string.find(string.lower(v102.Name), string.lower(v96)) then
                        break
                    end
                end
                if v102 then
                    break
                end
                v100 = v102
            end
            if v102 then
                v102.Parent = vu30.Character
                task.wait()
                local v106 = nil
                if vu80 ~= "Set Position" or not vu81 then
                    if vu80 ~= "Player Position" then
                        if vu80 == "Random Position" then
                            vu22 = vu22 or vu21()
                            local v107 = {}
                            if vu22 and vu22.Important:FindFirstChild("Plant_Locations") then
                                local v108, v109, v110 = ipairs(vu22.Important.Plant_Locations:GetChildren())
                                while true do
                                    local v111
                                    v110, v111 = v108(v109, v110)
                                    if v110 == nil then
                                        break
                                    end
                                    if v111:IsA("Part") and v111.Name == "Can_Plant" then
                                        table.insert(v107, v111)
                                    end
                                end
                            end
                            if # v107 > 0 then
                                local v112 = v107[math.random(1, # v107)]
                                local v113 = (math.random() - 0.5) * v112.Size.X
                                local v114 = (math.random() - 0.5) * v112.Size.Z
                                local v115 = v112.CFrame * Vector3.new(v113, 0, v114)
                                v106 = Vector3.new(v115.X, 0.135, v115.Z)
                            end
                        end
                    elseif vu30.Character and vu30.Character:FindFirstChild("Head") then
                        local v116 = vu30.Character.Head.Position
                        v106 = Vector3.new(v116.X, 0.135, v116.Z)
                    end
                else
                    v106 = vu81
                end
                if v106 then
                    vu6.GameEvents.Plant_RE:FireServer(v106, v96)
                end
            end
            task.wait()
        end)
    end
end)
local v117 = v24.Automation:AddSection("Miscellaneous")
local vu118 = false
local vu119 = nil
local function vu124(pu120)
    task.spawn(function()
        task.wait(0.1)
        if pu120 and pu120.Parent then
            pu120.Size = UDim2.new(15, 0, 15, 0)
            local v121 = pu120:FindFirstChild("Holder")
            if v121 then
                v121.Size = UDim2.new(15, 0, 15, 0)
                local v122 = v121:FindFirstChild("Frame")
                if v122 then
                    v122.Size = UDim2.new(15, 0, 15, 0)
                    local v123 = v122:FindFirstChild("Accept")
                    if v123 then
                        v123.Size = UDim2.new(15, 0, 15, 0)
                    end
                end
            end
            task.wait(0.1)
            mouse1click()
            vu9:Notify({
                Title = "Soluna",
                Content = "Auto-accepted a gift.",
                Duration = 3
            })
        end
    end)
end
v117:AddToggle("autoAcceptGifts", {
    Title = "Auto Accept Gifts",
    Description = "Automatically accepts any gift notifications that appear on screen.",
    Default = false
}):OnChanged(function(p125)
    vu118 = p125
    if vu118 then
        local v126 = vu30.PlayerGui:WaitForChild("Gift_Notification"):WaitForChild("Frame")
        local v127, v128, v129 = ipairs(v126:GetChildren())
        while true do
            local v130
            v129, v130 = v127(v128, v129)
            if v129 == nil then
                break
            end
            if v130.Name == "Gift_Notification" then
                vu124(v130)
            end
        end
        vu119 = v126.ChildAdded:Connect(function(p131)
            if p131.Name == "Gift_Notification" then
                vu124(p131)
            end
        end)
    elseif vu119 then
        vu119:Disconnect()
        vu119 = nil
    end
end)
local vu132 = false
v117:AddToggle("antiAfk", {
    Title = "Anti AFK",
    Description = "Prevents the game from kicking you for being idle by simulating a small character movement every few minutes.",
    Default = false
}):OnChanged(function(p133)
    vu132 = p133
    if vu132 then
        vu9:Notify({
            Title = "Soluna",
            Content = "Anti AFK has been enabled.",
            Duration = 3
        })
        task.spawn(function()
            while vu132 do
                task.wait(120)
                if not vu132 then
                    break
                end
                local v134 = vu30.Character
                if v134 then
                    v134 = v134:FindFirstChild("HumanoidRootPart")
                end
                if v134 then
                    v134.CFrame = v134.CFrame + Vector3.new(0, 0.1, 0)
                    task.wait(0.1)
                    if v134.Parent then
                        v134.CFrame = v134.CFrame - Vector3.new(0, 0.1, 0)
                    end
                end
            end
        end)
    else
        vu9:Notify({
            Title = "Soluna",
            Content = "Anti AFK has been disabled.",
            Duration = 3
        })
    end
end)
local v135 = v24.Eggs:AddSection("Egg Management")
local vu136 = false
v135:AddToggle("autoBuyEggs", {
    Title = "Auto Purchase Eggs",
    Description = "Rapidly buys all available pet eggs. Useful for farming pets.",
    Default = false
}):OnChanged(function(p137)
    vu136 = p137
    if p137 then
        task.spawn(function()
            while vu136 do
                vu6.GameEvents.BuyPetEgg:FireServer(1)
                task.wait(0.1)
                vu6.GameEvents.BuyPetEgg:FireServer(2)
                task.wait(0.1)
                vu6.GameEvents.BuyPetEgg:FireServer(3)
                task.wait(1)
            end
        end)
    end
end)
local v138 = v24.Player:AddSection("Character Stats")
local function vu142(p139)
    local v140 = vu30.Character
    local v141 = v140 and v140:FindFirstChildOfClass("Humanoid")
    if v141 then
        v141.WalkSpeed = p139
    end
end
local function vu146(p143)
    local v144 = vu30.Character
    local v145 = v144 and v144:FindFirstChildOfClass("Humanoid")
    if v145 then
        v145.JumpPower = p143
    end
end
local function vu148(p147)
    if vu31.CurrentCamera then
        vu31.CurrentCamera.FieldOfView = p147
    end
end
vu30.CharacterAdded:Connect(function()
    task.wait(1)
    vu142(vu25.walkSpeedSlider.Value)
    vu146(vu25.jumpPowerSlider.Value)
end)
v138:AddSlider("walkSpeedSlider", {
    Title = "WalkSpeed",
    Default = 16,
    Min = 16,
    Max = 200,
    Rounding = 0,
    Callback = function(p149)
        vu142(p149)
    end
})
v138:AddSlider("jumpPowerSlider", {
    Title = "JumpPower",
    Default = 50,
    Min = 50,
    Max = 300,
    Rounding = 0,
    Callback = function(p150)
        vu146(p150)
    end
})
v138:AddSlider("fovSlider", {
    Title = "Field of View (FOV)",
    Default = 70,
    Min = 30,
    Max = 120,
    Rounding = 0,
    Callback = function(p151)
        vu148(p151)
    end
})
local v152 = v24.Player:AddSection("Movement Mods")
local vu153 = false
local vu154 = nil
local vu155 = 5
local v156 = v152:AddToggle("flyToggle", {
    Title = "Fly",
    Description = "Move with WASD. Up/Down with Space/LShift.",
    Default = false
})
v152:AddSlider("flySpeedSlider", {
    Title = "Fly Speed",
    Default = 5,
    Min = 1,
    Max = 50,
    Rounding = 1,
    Callback = function(p157)
        vu155 = p157
    end
})
v156:OnChanged(function(p158)
    vu153 = p158
    local v159 = vu30.Character
    if v159 then
        local vu160 = v159:FindFirstChild("HumanoidRootPart")
        if vu160 then
            pcall(function()
                vu160:FindFirstChildOfClass("BodyVelocity"):Destroy()
            end)
            pcall(function()
                vu160:FindFirstChildOfClass("BodyGyro"):Destroy()
            end)
            if vu153 then
                local vu161 = Instance.new("BodyVelocity", vu160)
                local vu162 = Instance.new("BodyGyro", vu160)
                vu161.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
                vu161.Velocity = Vector3.new(0, 0, 0)
                vu162.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
                vu162.D = 100
                vu162.P = 5000
                vu154 = vu4.RenderStepped:Connect(function()
                    if vu153 then
                        vu162.CFrame = vu31.CurrentCamera.CFrame
                        local v163 = Vector3.new()
                        if vu8:IsKeyDown(Enum.KeyCode.W) then
                            v163 = v163 + Vector3.new(0, 0, - 1)
                        end
                        if vu8:IsKeyDown(Enum.KeyCode.S) then
                            v163 = v163 + Vector3.new(0, 0, 1)
                        end
                        if vu8:IsKeyDown(Enum.KeyCode.A) then
                            v163 = v163 + Vector3.new(- 1, 0, 0)
                        end
                        if vu8:IsKeyDown(Enum.KeyCode.D) then
                            v163 = v163 + Vector3.new(1, 0, 0)
                        end
                        local v164 = vu31.CurrentCamera.CFrame:VectorToWorldSpace(v163) * vu155 * 10
                        local v165 = not vu8:IsKeyDown(Enum.KeyCode.Space) and 0 or vu155 * 10
                        if vu8:IsKeyDown(Enum.KeyCode.LeftShift) then
                            v165 = - vu155 * 10
                        end
                        vu161.Velocity = Vector3.new(v164.X, v165, v164.Z)
                    else
                        vu154:Disconnect()
                    end
                end)
            end
        end
    else
        return
    end
end)
local vu166 = false
local vu167 = nil
v152:AddToggle("noclipToggle", {
    Title = "Noclip",
    Description = "Allows you to walk through walls.",
    Default = false
}):OnChanged(function(p168)
    vu166 = p168
    if vu166 then
        vu167 = vu4.Stepped:Connect(function()
            if vu166 and vu30.Character then
                local v169, v170, v171 = ipairs(vu30.Character:GetDescendants())
                while true do
                    local v172
                    v171, v172 = v169(v170, v171)
                    if v171 == nil then
                        break
                    end
                    if v172:IsA("BasePart") then
                        v172.CanCollide = false
                    end
                end
            elseif vu167 then
                vu167:Disconnect()
            end
        end)
    elseif vu167 then
        vu167:Disconnect()
    end
end)
local v173 = v24.Player:AddSection("Render Mods")
local function vu180(p174)
    vu9:Notify({
        Title = "X-Ray",
        Content = (p174 and "Enabling" or "Disabling") .. " X-Ray...",
        Duration = 2
    })
    task.wait()
    local v175 = vu31
    local v176, v177, v178 = ipairs(v175:GetDescendants())
    while true do
        local v179
        v178, v179 = v176(v177, v178)
        if v178 == nil then
            break
        end
        if v179:IsA("BasePart") and not (v179:IsDescendantOf(vu30.Character) or v179:IsDescendantOf(vu31.CurrentCamera)) and (v179.Parent and v179.Parent:FindFirstChildOfClass("Humanoid") or v179:IsDescendantOf(vu31.Farm)) then
            v179.LocalTransparencyModifier = p174 and 0.75 or 0
        end
    end
    vu9:Notify({
        Title = "X-Ray",
        Content = "X-Ray has been " .. (p174 and "enabled." or "disabled."),
        Duration = 4
    })
end
v173:AddButton({
    Title = "Enable X-Ray",
    Description = "Makes players and farm items visible through walls. (One-time effect)",
    Callback = function()
        vu180(true)
    end
})
v173:AddButton({
    Title = "Disable X-Ray",
    Description = "Resets all parts to their normal transparency.",
    Callback = function()
        vu180(false)
    end
})
local vu181 = vu30:WaitForChild("leaderstats")
local vu182
if vu181 then
    vu182 = vu181:WaitForChild("Sheckles")
else
    vu182 = vu181
end
if vu182 then
    local vu183 = false
    local vu184 = vu182.Value
    local v185 = v24.Visuals:AddToggle("editShekels", {
        Title = "Edit Shekels (VISUAL ONLY)",
        Description = "WARNING: This only changes the number on your screen. It does NOT give you real currency and you cannot buy anything with it.",
        Default = false
    })
    v24.Visuals:AddSlider("shekelsSlider", {
        Title = "Shekels Value",
        Description = "Adjust the slider to set your visual shekels amount.",
        Default = vu182.Value,
        Min = 0,
        Max = 5000000000000,
        Rounding = 0,
        Callback = function(p186)
            vu184 = p186
            if vu183 then
                vu182.Value = vu184
                local v187 = vu30.PlayerGui:FindFirstChild("Sheckles_UI")
                if v187 then
                    v187.TextLabel.val.Value = vu184
                end
            end
        end
    })
    v185:OnChanged(function(p188)
        vu183 = p188
        if p188 then
            task.spawn(function()
                while vu183 do
                    vu182.Value = vu184
                    local v189 = vu30.PlayerGui:FindFirstChild("Sheckles_UI")
                    if v189 then
                        v189.TextLabel.val.Value = vu184
                    end
                    task.wait()
                end
            end)
        else
            local v190 = vu181:FindFirstChild("Sheckles")
            if v190 then
                local v191 = v190.Value
                vu182.Value = v191
                local v192 = vu30.PlayerGui:FindFirstChild("Sheckles_UI")
                if v192 then
                    v192.TextLabel.val.Value = v191
                end
            end
        end
    end)
    v10:SetLibrary(vu9)
    v11:SetLibrary(vu9)
    v10:IgnoreThemeSettings()
    v10:SetIgnoreIndexes({})
    v11:SetFolder("Soluna")
    v10:SetFolder("Soluna/Grow A Garden")
    v11:BuildInterfaceSection(v24.Settings)
    v10:BuildConfigSection(v24.Settings)
    v23:SelectTab(1)
    vu9:Notify({
        Title = "Soluna",
        Content = "Successfully loaded!",
        SubContent = "Press Right Shift to toggle the menu.",
        Duration = 8
    })
    v10:LoadAutoloadConfig()
end
