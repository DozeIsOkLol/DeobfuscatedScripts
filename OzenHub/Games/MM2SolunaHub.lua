-- ts file was generated at discord.gg/25ms


local vu1 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local v2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local v3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local vu4 = typeof
local vu5 = game:GetService("Players")
local vu6 = game:GetService("Players").LocalPlayer
local vu7 = game:GetService("RunService")
local vu8 = game:GetService("UserInputService")
local vu9 = game:GetService("HttpService")
local vu10 = game:GetService("TweenService")
local vu11 = game:GetService("CoreGui")
local vu12 = vu1.Options
local vu13 = {
    fly = {
        active = false,
        gyro = nil,
        velocity = nil,
        speed = 1
    }
}
local vu14 = nil
local vu15 = nil
local vu16 = {
    list = {},
    container = nil,
    addedConn = nil,
    removedConn = nil
}
local vu17 = {
    character = nil,
    parts = {}
}
local vu18 = {}
local v19 = nil
local vu20 = nil
local vu21 = nil
local vu22 = nil
local vu23 = nil
local vu24 = {}
local function vu25()
    if vu16.addedConn then
        vu16.addedConn:Disconnect()
        vu16.addedConn = nil
    end
    if vu16.removedConn then
        vu16.removedConn:Disconnect()
        vu16.removedConn = nil
    end
    vu16.list = {}
    vu16.container = nil
end
local function vu28(pu26)
    if not pu26 then
        return
    end
    for v27 = # vu16.list, 1, - 1 do
        if vu16.list[v27] == pu26 then
            table.remove(vu16.list, v27)
            break
        end
    end
    pcall(function()
        pu26:SetAttribute("SolunaSkip", true)
    end)
    task.delay(2, function()
        pcall(function()
            if pu26 and pu26.Parent then
                pu26:SetAttribute("SolunaSkip", nil)
            end
        end)
    end)
end
local function vu37(p29)
    if p29 then
        if vu16.container ~= p29 then
            vu25()
            vu16.container = p29
            local v30, v31, v32 = ipairs(p29:GetChildren())
            while true do
                local vu33
                v32, vu33 = v30(v31, v32)
                if v32 == nil then
                    break
                end
                pcall(function()
                    vu33:SetAttribute("SolunaSkip", nil)
                end)
                table.insert(vu16.list, vu33)
            end
            vu16.addedConn = p29.ChildAdded:Connect(function(pu34)
                pcall(function()
                    pu34:SetAttribute("SolunaSkip", nil)
                end)
                table.insert(vu16.list, pu34)
            end)
            vu16.removedConn = p29.ChildRemoved:Connect(function(p35)
                for v36 = # vu16.list, 1, - 1 do
                    if vu16.list[v36] == p35 then
                        table.remove(vu16.list, v36)
                        break
                    end
                end
            end)
        end
    else
        vu25()
        return
    end
end
local function vu44(p38)
    if vu17.character == p38 and p38 then
        return vu17.parts
    end
    local v39 = {}
    if p38 then
        local v40, v41, v42 = ipairs(p38:GetDescendants())
        while true do
            local v43
            v42, v43 = v40(v41, v42)
            if v42 == nil then
                break
            end
            if v43:IsA("BasePart") then
                table.insert(v39, v43)
            end
        end
    end
    vu17 = {
        character = p38,
        parts = v39
    }
    return v39
end
local function vu52(p45, p46, p47)
    if p45 and (p45.Parent and p47) then
        local v48, v49, v50 = ipairs(p46)
        while true do
            local v51
            v50, v51 = v48(v49, v50)
            if v50 == nil then
                break
            end
            if v51 and v51.Parent then
                pcall(p47, p45, v51, 0)
                pcall(p47, p45, v51, 1)
            end
        end
    end
end
function vu24.Notify(p53, p54, p55, _, p56)
    if not vu12.enableNotifications or vu12.enableNotifications.Value ~= false then
        vu1:Notify({
            Title = p54 or "Soluna",
            Content = tostring(p53),
            Duration = p55 or 3,
            Callback = p56
        })
    end
end
function vu24.SplitString(p57, p58)
    local v59, v60, v61 = p57:gmatch("[^" .. (p58 or ",") .. "]+")
    local v62 = {}
    while true do
        v61 = v59(v60, v61)
        if v61 == nil then
            break
        end
        table.insert(v62, v61)
    end
    return v62
end
function vu24.ToTokens(p63)
    local v64, v65, v66 = p63:gmatch("([+-])([^+-]+)")
    local v67 = {}
    while true do
        local v68
        v66, v68 = v64(v65, v66)
        if v66 == nil then
            break
        end
        table.insert(v67, {
            Operator = v66,
            Name = v68
        })
    end
    return v67
end
function vu24.OnlyIncludeInTable(p69, p70)
    local v71 = {}
    local v72 = {}
    if not p70 then
        return p69
    end
    local v73, v74, v75 = pairs(p70)
    while true do
        local v76
        v75, v76 = v73(v74, v75)
        if v75 == nil then
            break
        end
        if v76 and v76.Name then
            v71[v76.Name] = true
        end
    end
    local v77, v78, v79 = pairs(p69)
    while true do
        local v80
        v79, v80 = v77(v78, v79)
        if v79 == nil then
            break
        end
        if v80 and (v80.Name and v71[v80.Name]) then
            table.insert(v72, v80)
        end
    end
    return v72
end
function vu24.RemoveTableMatches(p81, p82)
    local v83 = {}
    local v84 = {}
    if not p82 then
        return p81
    end
    local v85, v86, v87 = pairs(p82)
    while true do
        local v88
        v87, v88 = v85(v86, v87)
        if v87 == nil then
            break
        end
        if v88 and v88.Name then
            v83[v88.Name] = true
        end
    end
    local v89, v90, v91 = pairs(p81)
    while true do
        local v92
        v91, v92 = v89(v90, v91)
        if v91 == nil then
            break
        end
        if v92 and (v92.Name and not v83[v92.Name]) then
            table.insert(v84, v92)
        end
    end
    return v84
end
function vu24.GetPlayersByName(p93)
    local v94 = game:GetService("Players")
    local v95 = p93:lower()
    local v96 = # p93
    local v97, v98, v99 = pairs(v94:GetPlayers())
    local v100 = {}
    while true do
        local v101
        v99, v101 = v97(v98, v99)
        if v99 == nil then
            break
        end
        if v95:sub(1, 1) ~= "@" then
            if v101.Name:lower():sub(1, v96) == v95 or v101.DisplayName:lower():sub(1, v96) == v95 then
                table.insert(v100, v101)
            end
        elseif v101.Name:lower():sub(1, v96 - 1) == v95:sub(2) then
            table.insert(v100, v101)
        end
    end
    return v100
end
function vu24.GetPlayer(p102, p103)
    local v104 = game:GetService("Players")
    local v105 = p103 or v104.LocalPlayer
    if p102 == nil then
        return v105
    end
    local v106 = vu24.SplitString(p102, ",")
    local v107, v108, v109 = pairs(v106)
    local v110 = {}
    while true do
        local v111
        v109, v111 = v107(v108, v109)
        if v109 == nil then
            break
        end
        if v111:sub(1, 1) ~= "+" and v111:sub(1, 1) ~= "-" then
            v111 = "+" .. v111
        end
        local v112 = vu24.ToTokens(v111)
        local v113 = v104:GetPlayers()
        local v114, v115, v116 = pairs(v112)
        while true do
            local v117
            v116, v117 = v114(v115, v116)
            if v116 == nil then
                break
            end
            if v117.Operator ~= "+" then
                v113 = vu24.RemoveTableMatches(v113, vu24.GetPlayersByName(v117.Name))
            else
                v113 = vu24.OnlyIncludeInTable(v113, vu24.GetPlayersByName(v117.Name))
            end
        end
        local v118, v119, v120 = pairs(v113)
        while true do
            local v121
            v120, v121 = v118(v119, v120)
            if v120 == nil then
                break
            end
            table.insert(v110, v121)
        end
    end
    return v110[1]
end
function vu24.getClosestModelToPlayer(p122, p123)
    local v124 = nil
    local v125 = math.huge
    if not (p122 and p122.Character and p122.Character:FindFirstChild("HumanoidRootPart")) then
        return nil, math.huge
    end
    local v126 = p122.Character.HumanoidRootPart.Position
    local v127, v128, v129 = ipairs(p123)
    while true do
        local v130
        v129, v130 = v127(v128, v129)
        if v129 == nil then
            break
        end
        if v130 and v130.Parent then
            local v131 = nil
            if vu4(v130.IsA) ~= "function" then
                if v130.ClassName ~= "Model" then
                    if rawget(v130, "Position") then
                        v131 = v130.Position
                    end
                elseif v130.PrimaryPart then
                    v131 = v130.PrimaryPart.Position
                end
            elseif v130:IsA("Model") then
                if v130.PrimaryPart then
                    v131 = v130.PrimaryPart.Position
                elseif vu4(v130.GetPivot) == "function" then
                    local v132 = v130:GetPivot()
                    if v132 and vu4(v132) == "CFrame" then
                        v131 = v132.Position
                    end
                end
            elseif v130:IsA("BasePart") then
                v131 = v130.Position
            end
            if v131 then
                local v133 = (v131 - v126).Magnitude
                if v133 < v125 then
                    v124 = v130
                    v125 = v133
                end
            end
        end
    end
    return v124, v125
end
function vu24.miniFling(p134)
    local v135 = game:GetService("Players").LocalPlayer
    if not p134 then
        vu24.Notify("Fling target is nil.", "Fling Error", 3, "Cancel")
        return
    end
    local vu136 = p134
    local vu137 = v135.Character
    local vu138
    if vu137 then
        vu138 = vu137:FindFirstChildOfClass("Humanoid")
    else
        vu138 = vu137
    end
    local vu139
    if vu138 then
        vu139 = vu138.RootPart
    else
        vu139 = vu138
    end
    if not (vu137 and (vu138 and vu139)) then
        vu24.Notify("Your character is not set up to perform this action.", "Fling Error", 3, "Cancel")
        return
    end
    local vu140 = vu136.Character
    if not vu140 then
        vu24.Notify(vu136.Name .. " has no character to fling.", "Fling Error", 3, "Cancel")
        return
    end
    local vu141 = vu140:FindFirstChildOfClass("Humanoid")
    local v142
    if vu141 then
        v142 = vu141.RootPart
    else
        v142 = vu141
    end
    local v143 = vu140:FindFirstChild("Head")
    local v144 = vu140:FindFirstChildOfClass("Accessory")
    local v145
    if v144 then
        v145 = v144:FindFirstChild("Handle")
    else
        v145 = v144
    end
    local v146 = nil
    if vu139.Velocity.Magnitude >= 50 then
        vu24.Notify("You are moving quickly; fling reset position might be less accurate.", "Fling Info", 2)
    else
        v146 = vu139.CFrame
    end
    if vu141 then
        local _ = vu141.Sit
    end
    if v143 then
        if v143.Velocity.Magnitude > 500 then
            vu24.Notify(vu136.Name .. " is already moving very fast. Not flinging again.", "Fling Info", 3)
            return
        end
    elseif not v143 and (v145 and v145.Velocity.Magnitude > 500) then
        vu24.Notify(vu136.Name .. " (via accessory) is already moving very fast. Not flinging again.", "Fling Info", 3)
        return
    end
    if v143 then
        workspace.CurrentCamera.CameraSubject = v143
    elseif v143 or not v145 then
        if vu141 and v142 then
            workspace.CurrentCamera.CameraSubject = vu141
        end
    else
        workspace.CurrentCamera.CameraSubject = v145
    end
    if not vu140:FindFirstChildWhichIsA("BasePart") then
        vu24.Notify(vu136.Name .. " has no base parts to target for fling.", "Fling Error", 3, "Cancel")
        return
    end
    local function vu150(p147, p148, p149)
        if vu139 and vu139.Parent then
            vu139.CFrame = CFrame.new(p147.Position) * p148 * p149
            if vu137 and vu137.PrimaryPart then
                vu137:SetPrimaryPartCFrame(CFrame.new(p147.Position) * p148 * p149)
            end
            vu139.Velocity = Vector3.new(4782969, 47829690, 4782969)
            vu139.RotVelocity = Vector3.new(43046721, 43046721, 43046721)
        end
    end
    local function v158(p151)
        local v152 = tick()
        local v153 = 0
        local v154 = 2
        while vu139 and (vu141 and (p151 and p151.Parent)) do
            v153 = v153 + 100
            local v155 = vu141.MoveDirection
            local v156 = p151.Velocity.Magnitude
            local v157 = vu141.WalkSpeed
            if v156 < 50 then
                vu150(p151, CFrame.new(0, 1.5, 0) + v155 * v156 / 1.25, CFrame.Angles(math.rad(v153), 0, 0))
                task.wait()
                vu150(p151, CFrame.new(0, - 1.5, 0) + v155 * v156 / 1.25, CFrame.Angles(math.rad(v153), 0, 0))
                task.wait()
                vu150(p151, CFrame.new(2.25, 1.5, - 2.25) + v155 * v156 / 1.25, CFrame.Angles(math.rad(v153), 0, 0))
                task.wait()
                vu150(p151, CFrame.new(- 2.25, - 1.5, 2.25) + v155 * v156 / 1.25, CFrame.Angles(math.rad(v153), 0, 0))
                task.wait()
                vu150(p151, CFrame.new(0, 1.5, 0) + v155, CFrame.Angles(math.rad(v153), 0, 0))
                task.wait()
                vu150(p151, CFrame.new(0, - 1.5, 0) + v155, CFrame.Angles(math.rad(v153), 0, 0))
                task.wait()
            else
                vu150(p151, CFrame.new(0, 1.5, v157), CFrame.Angles(math.rad(90), 0, 0))
                task.wait()
                vu150(p151, CFrame.new(0, - 1.5, - v157), CFrame.Angles(0, 0, 0))
                task.wait()
                vu150(p151, CFrame.new(0, 1.5, v157), CFrame.Angles(math.rad(90), 0, 0))
                task.wait()
                vu150(p151, CFrame.new(0, 1.5, v156 / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                task.wait()
                vu150(p151, CFrame.new(0, - 1.5, - v156 / 1.25), CFrame.Angles(0, 0, 0))
                task.wait()
                vu150(p151, CFrame.new(0, 1.5, v156 / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                task.wait()
                vu150(p151, CFrame.new(0, - 1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                task.wait()
                vu150(p151, CFrame.new(0, - 1.5, 0), CFrame.Angles(0, 0, 0))
                task.wait()
                vu150(p151, CFrame.new(0, - 1.5, 0), CFrame.Angles(math.rad(- 90), 0, 0))
                task.wait()
                vu150(p151, CFrame.new(0, - 1.5, 0), CFrame.Angles(0, 0, 0))
                task.wait()
            end
            if not p151.Parent or p151.Velocity.Magnitude > 500 or (vu136.Parent ~= game:GetService("Players") or (vu136.Character ~= vu140 or vu141 and vu141.Sit) or (vu138 and vu138.Health <= 0 or tick() > v152 + v154)) then
                break
            end
        end
    end
    local v159 = workspace.FallenPartsDestroyHeight
    workspace.FallenPartsDestroyHeight = 0 / 0
    local v160 = Instance.new("BodyVelocity")
    v160.Name = "SolunaFlingVel"
    v160.Parent = vu139
    v160.Velocity = Vector3.new(43046721, 43046721, 43046721)
    v160.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    if vu138 and vu138.Parent then
        vu138:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    end
    if v142 and v143 then
        if (v142.CFrame.Position - v143.CFrame.Position).Magnitude <= 5 then
            v158(v142)
        else
            v158(v143)
        end
    elseif v142 and not v143 then
        v158(v142)
    elseif v142 or not v143 then
        if v142 or (v143 or not (v144 and v145)) then
            vu24.Notify("Can\'t find a proper part of " .. vu136.Name .. " to fling.", "Fling Error", 3, "Cancel")
        else
            v158(v145)
        end
    else
        v158(v143)
    end
    if v160 and v160.Parent then
        v160:Destroy()
    end
    if vu138 and vu138.Parent then
        vu138:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
    end
    if workspace.CurrentCamera and (vu138 and vu138.Parent) then
        workspace.CurrentCamera.CameraSubject = vu138
    end
    if v146 and (vu139 and vu139.Parent) then
        local v161 = 0
        while true do
            vu139.CFrame = v146 * CFrame.new(0, 0.5, 0)
            if vu137 and vu137.PrimaryPart then
                local v162 = vu137
                vu137.SetPrimaryPartCFrame(v162, v146 * CFrame.new(0, 0.5, 0))
            end
            if vu138 and vu138.Parent then
                vu138:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
            if vu137 then
                local v163 = vu137
                local v164, v165, v166 = ipairs(vu137.GetChildren(v163))
                while true do
                    local v167
                    v166, v167 = v164(v165, v166)
                    if v166 == nil then
                        break
                    end
                    if v167:IsA("BasePart") then
                        v167.Velocity = Vector3.new()
                        v167.RotVelocity = Vector3.new()
                    end
                end
            end
            task.wait()
            v161 = v161 + 1
            if not vu139.Parent or ((vu139.Position - v146.Position).Magnitude < 25 or 50 < v161) then
            end
        end
    else
        vu24.Notify("Could not restore original position after fling.", "Fling Info", 2)
        workspace.FallenPartsDestroyHeight = v159
        vu24.Notify("Fling attempt on " .. vu136.Name .. " finished.", "Fling Action", 2)
        return
    end
end
function getMap()
    local v168, v169, v170 = ipairs(workspace:GetChildren())
    while true do
        local v171
        v170, v171 = v168(v169, v170)
        if v170 == nil then
            break
        end
        if v171:FindFirstChild("CoinContainer") and v171:FindFirstChild("Spawns") then
            return v171
        end
    end
    return nil
end
function vu24.pickupGun()
    local v172 = _G.firetouchinterest or firetouchinterest
    if not v172 then
        vu24.Notify("`firetouchinterest` is not available in your executor.", "Error", 4, "Cancel")
        return false
    end
    local v173 = vu6.Character
    local v174
    if v173 then
        v174 = v173:FindFirstChild("HumanoidRootPart")
    else
        v174 = v173
    end
    if not v174 then
        vu24.Notify("Cannot pick up gun: Your character is not available.", "Error", 2)
        return false
    end
    local v175 = workspace:FindFirstChild("GunDrop", true)
    if not (v175 and v175:IsA("BasePart")) then
        vu24.Notify("No dropped gun found anywhere in the game.", "Info", 2)
        return false
    end
    vu24.Notify("Gun detected! Initiating cheat pickup...", "Gun Pickup")
    local v176 = v174.CFrame
    local v177, v178, v179 = ipairs(v173:GetDescendants())
    local v180 = {}
    while true do
        local v181
        v179, v181 = v177(v178, v179)
        if v179 == nil then
            break
        end
        if v181:IsA("BasePart") then
            v180[v181] = v181.CanCollide
            v181.CanCollide = false
        end
    end
    v174.CFrame = v175.CFrame * CFrame.new(0, 2, 0)
    task.wait(0.1)
    pcall(v172, v175, v174, 0)
    task.wait(0.1)
    pcall(v172, v175, v174, 1)
    task.wait(0.2)
    v174.CFrame = v176
    local v182, v183, v184 = pairs(v180)
    while true do
        local v185
        v184, v185 = v182(v183, v184)
        if v184 == nil then
            break
        end
        if v184 and v184.Parent then
            v184.CanCollide = v185
        end
    end
    if v175.Parent then
        vu24.Notify("Failed to pick up the gun.", "Error", 2, "Cancel")
        return false
    end
    vu24.Notify("Successfully picked up the gun!", "Success")
    if vu4(mm2_ReloadPlayerESP) == "function" then
        mm2_ReloadPlayerESP()
    end
    return true
end
local function vu187()
    if not (vu6.Character and vu6.Character:FindFirstChild("HumanoidRootPart")) then
        vu24.Notify("Waiting for character to spawn to create Safe Zone...", "Info")
        vu6.CharacterAdded:Wait()
    end
    local v186 = vu6.Character
    if v186 then
        v186 = vu6.Character:FindFirstChild("HumanoidRootPart")
    end
    if v186 then
        if vu23 and vu23.Parent then
            vu23:Destroy()
        end
        vu23 = Instance.new("Part")
        vu23.Name = "SolunaSafeZone"
        vu23.Size = Vector3.new(500, 2, 500)
        vu23.CFrame = v186.CFrame * CFrame.new(0, 5000, 0)
        vu23.Anchored = true
        vu23.Transparency = 0.5
        vu23.Color = Color3.fromRGB(0, 255, 255)
        vu23.Material = Enum.Material.ForceField
        vu23.CanCollide = true
        vu23.Parent = workspace
        vu24.Notify("Safe Zone platform created 5000 studs above you.", "Success")
    else
        vu24.Notify("Could not get character position for Safe Zone.", "Error")
    end
end
local vu188 = {}
vu188.__index = vu188
local function v190()
    if get_hidden_gui then
        return get_hidden_gui()
    end
    if gethui then
        return gethui()
    end
    if not (syn and syn.protect_gui) then
        return vu11
    end
    local v189 = Instance.new("ScreenGui", vu11)
    v189.Name = vu9:GenerateGUID(false)
    syn.protect_gui(v189)
    return v189
end
vu188.Defaults = {
    AccentColor = Color3.new(1, 1, 0),
    HighlightFillTransparency = 0.7,
    HighlightOutlineTransparency = 0,
    HighlightDepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
    ArrowShow = false,
    ArrowEdgePadding = 50,
    ArrowMinDistance = 0,
    ArrowSize = UDim2.new(0, 30, 0, 30),
    ArrowImage = "rbxassetid://97136202386756",
    ArrowShowDistanceText = true,
    ArrowDistanceFont = Enum.Font.Gotham,
    ArrowDistanceTextSize = 14,
    ShowLabel = false,
    LabelText = "Target",
    LabelMaxDistance = 200,
    LabelOffset = Vector3.new(0, 2.5, 0),
    Parent = v190()
}
function vu188._allArrows(p191)
    local v192, v193, v194 = pairs(p191.Indicators)
    local v195 = {}
    while true do
        local v196
        v194, v196 = v192(v193, v194)
        if v194 == nil then
            break
        end
        if v196.Arrow then
            table.insert(v195, v196.Arrow)
        end
    end
    return v195
end
function vu188.new(p197)
    local vu198 = setmetatable({}, vu188)
    vu198.Settings = {}
    local v199, v200, v201 = pairs(vu188.Defaults)
    while true do
        local v202
        v201, v202 = v199(v200, v201)
        if v201 == nil then
            break
        end
        local v203 = vu198.Settings
        if p197 and p197[v201] ~= nil then
            v202 = p197[v201] or v202
        end
        v203[v201] = v202
    end
    vu198.ScreenGui = Instance.new("ScreenGui")
    local v204 = vu9
    vu198.ScreenGui.Name = "SolunaESPContainer_" .. v204:GenerateGUID(false)
    vu198.ScreenGui.IgnoreGuiInset = true
    vu198.ScreenGui.ResetOnSpawn = false
    vu198.ScreenGui.Parent = vu198.Settings.Parent
    vu198.ArrowTemplate = Instance.new("ImageLabel")
    vu198.ArrowTemplate.Name = "ArrowTemplate"
    vu198.ArrowTemplate.Size = vu198.Settings.ArrowSize
    vu198.ArrowTemplate.AnchorPoint = Vector2.new(0.5, 0.5)
    vu198.ArrowTemplate.BackgroundTransparency = 1
    vu198.ArrowTemplate.Image = vu198.Settings.ArrowImage
    vu198.ArrowTemplate.ImageColor3 = vu198.Settings.AccentColor
    vu198.ArrowTemplate.Visible = false
    vu198.ArrowTemplate.Parent = vu198.ScreenGui
    vu198.Scaler = Instance.new("UIScale", vu198.ArrowTemplate)
    vu198.Scaler.Name = "Scaler"
    vu198.Scaler.Scale = 0
    vu198.Indicators = {}
    vu198.Groups = {}
    vu198.TargetIndex = {}
    vu198._updateConn = vu7.RenderStepped:Connect(function()
        if vu198.ScreenGui and vu198.ScreenGui.Parent then
            vu198:_update()
        end
    end)
    vu198._cleanupConn = vu7.Heartbeat:Connect(function()
        if vu198.ScreenGui and vu198.ScreenGui.Parent then
            vu198:_cleanupOrphaned("Highlight", "_allHighlights")
            vu198:_cleanupOrphaned("ImageLabel", "_allArrows", "^Arrow_")
            vu198:_cleanupOrphaned("BillboardGui", "_allLabels", "^Label_")
        end
    end)
    return vu198
end
function vu188.AddGroup(p205, p206)
    local v207 = p205.Groups[p206]
    if not v207 then
        v207 = {
            enabled = true,
            properties = {},
            targets = {}
        }
        p205.Groups[p206] = v207
    end
    return v207
end
function vu188.GetGroup(p208, p209)
    return p208.Groups[p209]
end
function vu188.GetGroupTargets(p210, p211)
    local v212 = p210.Groups[p211]
    return v212 and v212.targets or {}
end
function vu188.RemoveGroup(p213, p214)
    local v215 = p213.Groups[p214]
    if not v215 then
        return false
    end
    local v216, v217, v218 = ipairs(v215.targets)
    while true do
        local v219
        v218, v219 = v216(v217, v218)
        if v218 == nil then
            p213.Groups[p214] = nil
            return true
        end
        local v220 = p213.TargetIndex[v219]
        if v220 then
            break
        end
        if not p213.TargetIndex[v219] then
            p213:Remove(v219)
        end
    end
    local v221, v222, v223 = ipairs(v220)
    while true do
        local v224
        v223, v224 = v221(v222, v223)
        if v223 == nil then
            break
        end
        if v224 == p214 then
            table.remove(v220, v223)
            break
        end
    end
    if # v220 == 0 then
        p213.TargetIndex[v219] = nil
    end
	
end
function vu188.ClearAllGroups(p225)
    local v226, v227, v228 = pairs(p225.Groups)
    while true do
        local v229
        v228, v229 = v226(v227, v228)
        if v228 == nil then
            break
        end
        p225:RemoveGroup(v228)
    end
end
function vu188.ToggleGroup(p230, p231, p232)
    local v233 = p230.Groups[p231]
    if v233 then
        if p232 == nil or not p232 then
            p232 = not v233.enabled
        end
        v233.enabled = p232
        local v234, v235, v236 = ipairs(v233.targets)
        while true do
            local v237
            v236, v237 = v234(v235, v236)
            if v236 == nil then
                break
            end
            local v238 = p230.Indicators[v237]
            if v238 then
                if v238.Highlight then
                    v238.Highlight.Enabled = v233.enabled
                end
                if v238.Arrow then
                    local v239 = v238.Arrow
                    local v240 = v233.enabled
                    if v240 then
                        v240 = v238.Options.ArrowShow or p230.Settings.ArrowShow
                    end
                    v239.Visible = v240
                end
                if v238.Label then
                    v238.Label.Enabled = v233.enabled
                end
            end
        end
        return v233.enabled
    end
end
function vu188.SetGroupProperty(p241, p242, p243, p244)
    local v245 = p241:AddGroup(p242)
    v245.properties[p243] = p244
    local v246, v247, v248 = ipairs(v245.targets)
    while true do
        local v249
        v248, v249 = v246(v247, v248)
        if v248 == nil then
            break
        end
        local v250 = p241.Indicators[v249]
        if v250 and p243 == "AccentColor" then
            if v250.Highlight then
                v250.Highlight.FillColor = p244
                v250.Highlight.OutlineColor = p244
            end
            if v250.Arrow then
                v250.Arrow.ImageColor3 = p244
            end
            if v250.DistanceLabel then
                v250.DistanceLabel.TextColor3 = p244
            end
            if v250.Label and v250.Label:FindFirstChild("TextLabel") then
                v250.Label.TextLabel.TextColor3 = p244
            end
        end
    end
end
function vu188.Add(p251, p252, p253)
    assert(p252, "ESPIndicator:Add requires a non-nil target")
    if p252:IsA("Instance") and p252.Parent then
        local v254 = p253 or {}
        local v255 = vu9:GenerateGUID(false)
        local v256
        if p252:IsA("Model") or (p252:IsA("BasePart") or p252:IsA("Accoutrement")) then
            v256 = Instance.new("Highlight")
            v256.Name = "Highlight_" .. v255
            v256.Adornee = p252
            v256.FillTransparency = v254.HighlightFillTransparency or p251.Settings.HighlightFillTransparency
            v256.FillColor = v254.AccentColor or p251.Settings.AccentColor
            v256.OutlineColor = v254.AccentColor or p251.Settings.AccentColor
            v256.OutlineTransparency = v254.HighlightOutlineTransparency or p251.Settings.HighlightOutlineTransparency
            v256.DepthMode = v254.HighlightDepthMode or p251.Settings.HighlightDepthMode
            v256.Parent = p251.ScreenGui
        else
            v256 = nil
        end
        local v257 = nil
        local v258, v259
        if v254.ArrowShow or p251.Settings.ArrowShow then
            v258 = p251.ArrowTemplate:Clone()
            v258.Name = "Arrow_" .. v255
            v258.ImageColor3 = v254.AccentColor or p251.Settings.AccentColor
            v258.Size = v254.ArrowSize or p251.Settings.ArrowSize
            v258.Visible = true
            v258.Parent = p251.ScreenGui
            v259 = v258:FindFirstChild("Scaler") or Instance.new("UIScale", v258)
            if v254.ArrowShowDistanceText or p251.Settings.ArrowShowDistanceText then
                v257 = Instance.new("TextLabel")
                v257.Name = "DistanceLabel"
                v257.AnchorPoint = Vector2.new(0.5, 0)
                v257.BackgroundTransparency = 1
                v257.Font = v254.ArrowDistanceFont or p251.Settings.ArrowDistanceFont
                v257.TextSize = v254.ArrowDistanceTextSize or p251.Settings.ArrowDistanceTextSize
                v257.TextColor3 = v254.AccentColor or p251.Settings.AccentColor
                v257.Parent = v258
            end
        else
            v258 = nil
            v259 = nil
        end
        local v260
        if (v254.ShowLabel or p251.Settings.ShowLabel) and (p252:IsA("Model") or p252:IsA("BasePart")) then
            v260 = Instance.new("BillboardGui")
            v260.Name = "Label_" .. v255
            v260.AlwaysOnTop = true
            v260.MaxDistance = v254.LabelMaxDistance or p251.Settings.LabelMaxDistance
            v260.Size = UDim2.new(0, 100, 0, 20)
            v260.StudsOffset = v254.LabelOffset or p251.Settings.LabelOffset
            v260.Adornee = p252
            v260.Parent = p251.ScreenGui
            local v261 = Instance.new("TextLabel")
            v261.Name = "TextLabel"
            v261.Size = UDim2.new(1, 0, 1, 0)
            v261.BackgroundTransparency = 1
            v261.Font = Enum.Font.Gotham
            v261.TextScaled = true
            v261.TextWrapped = true
            v261.TextColor3 = v254.AccentColor or p251.Settings.AccentColor
            v261.Text = v254.LabelText or p251.Settings.LabelText
            v261.Parent = v260
            Instance.new("UIStroke", v261)
        else
            v260 = nil
        end
        p251.Indicators[p252] = {
            Highlight = v256,
            Arrow = v258,
            Scaler = v259,
            DistanceLabel = v257,
            Label = v260,
            Options = v254
        }
        local v262 = v254.GroupName
        if v262 then
            p251:AddToGroup(p252, v262)
        end
    else
        vu24.Notify("ESP target is invalid or has no parent: " .. tostring(p252), "ESP Error")
    end
end
function vu188.Remove(p263, p264)
    local v265 = p263.Indicators[p264]
    if not v265 then
        return
    end
    if v265.Highlight then
        v265.Highlight:Destroy()
    end
    if v265.Arrow then
        v265.Arrow:Destroy()
    end
    if v265.Label then
        v265.Label:Destroy()
    end
    local v266 = p263.TargetIndex[p264]
    if v266 then
        local v267, v268, v269 = ipairs(v266)
        while true do
            local v270
            v269, v270 = v267(v268, v269)
            if v269 == nil then
                break
            end
            local v271 = p263.Groups[v270]
            if v271 then
                local v272, v273, v274 = ipairs(v271.targets)
                while true do
                    local v275
                    v274, v275 = v272(v273, v274)
                    if v274 == nil then
                        break
                    end
                    if v275 == p264 then
                        table.remove(v271.targets, v274)
                        break
                    end
                end
            end
        end
        p263.TargetIndex[p264] = nil
    end
    p263.Indicators[p264] = nil
end
function vu188.AddToGroup(p276, p277, p278)
    local v279 = p276:AddGroup(p278)
    if not table.find(v279.targets, p277) then
        table.insert(v279.targets, p277)
    end
    local v280 = p276.TargetIndex[p277]
    if not v280 then
        v280 = {}
        p276.TargetIndex[p277] = v280
    end
    if not table.find(v280, p278) then
        table.insert(v280, p278)
    end
    local v281, v282, v283 = pairs(v279.properties)
    while true do
        local v284
        v283, v284 = v281(v282, v283)
        if v283 == nil then
            break
        end
        p276:SetGroupProperty(p278, v283, v284)
    end
    local v285 = not v279.enabled and p276.Indicators[p277]
    if v285 then
        if v285.Highlight then
            v285.Highlight.Enabled = false
        end
        if v285.Arrow then
            v285.Arrow.Visible = false
        end
        if v285.Label then
            v285.Label.Enabled = false
        end
    end
    return true
end
function vu188._cleanupOrphaned(p286, p287, p288, p289)
    if not (p286.ScreenGui and p286.ScreenGui.Parent) then
        return
    end
    local v290, v291, v292 = ipairs(p286.ScreenGui:GetChildren())
    while true do
        local v293
        v292, v293 = v290(v291, v292)
        if v292 == nil then
            return
        end
        if v293:IsA(p287) and (not p289 or v293.Name:match(p289)) then
            local v294, v295, v296 = ipairs(p286[p288](p286))
            local v297 = false
            while true do
                local v298
                v296, v298 = v294(v295, v296)
                if v296 == nil then
                    break
                end
                if v298 == v293 then
                    v297 = true
                    break
                end
            end
            if not v297 then
                if v293:IsA("Highlight") or v293:IsA("BillboardGui") then
                    v293.Adornee = nil
                end
                v293:Destroy()
            end
        end
    end
end
function vu188._allHighlights(p299)
    local v300, v301, v302 = pairs(p299.Indicators)
    local v303 = {}
    while true do
        local v304
        v302, v304 = v300(v301, v302)
        if v302 == nil then
            break
        end
        if v304.Highlight then
            table.insert(v303, v304.Highlight)
        end
    end
    return v303
end
function vu188._allLabels(p305)
    local v306, v307, v308 = pairs(p305.Indicators)
    local v309 = {}
    while true do
        local v310
        v308, v310 = v306(v307, v308)
        if v308 == nil then
            break
        end
        if v310.Label then
            table.insert(v309, v310.Label)
        end
    end
    return v309
end
function vu188._update(p311)
    if not (p311.ScreenGui and p311.ScreenGui.Parent) then
        return
    end
    local v312 = workspace.CurrentCamera
    if not v312 then
        return
    end
    local v313 = v312.ViewportSize
    local v314 = v313.X
    local v315 = v313.Y
    local v316, v317, v318 = pairs(p311.Indicators)
    while true do
        while true do
            local v319
            v318, v319 = v316(v317, v318)
            if v318 == nil then
                return
            end
            if not (v318 and v318.Parent) then
                break
            end
            local v320 = v319.Options
            local v321 = v319.Arrow
            local v322 = v319.Scaler
            if v321 and (v322 and (v321.Parent and (v322.Parent and (v321.Visible or (v320.ArrowShow or p311.Settings.ArrowShow))))) then
                local v323
                if v318:IsA("Model") and v318.PrimaryPart then
                    v323 = v318.PrimaryPart.Position
                end
                if v318:IsA("BasePart") then
                    v323 = v318.Position
                    local v324, v325 = v312:WorldToViewportPoint(v323)
                    local v326 = (v312.CFrame.Position - v323).Magnitude
                    local v327 = v320.ArrowMinDistance or p311.Settings.ArrowMinDistance
                    local v328 = v320.ArrowEdgePadding or p311.Settings.ArrowEdgePadding
                    if v325 and v327 < v326 then
                        if v322.Scale ~= 0 then
                            vu10:Create(v322, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Scale = 0
                            }):Play()
                        end
                    else
                        if v322.Scale ~= 1 then
                            vu10:Create(v322, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Scale = 1
                            }):Play()
                        end
                        local _ = v314 - v328 * 2
                        local _ = v315 - v328 * 2
                        local v329 = v312.CFrame:PointToObjectSpace(v323)
                        local v330 = math.atan2(v329.X, - v329.Z)
                        local v331 = math.atan2(v329.Y, math.sqrt(v329.X ^ 2 + v329.Z ^ 2))
                        local v332, v333, v334
                        if v325 then
                            v332 = v324.X
                            v333 = v324.Y
                            v334 = math.deg(math.atan2(v324.X - v314 / 2, - (v324.Y - v315 / 2)))
                        else
                            local v335 = math.tan(v330)
                            math.tan(v331)
                            local v336 = v314 / 2
                            local _ = v315 / 2 / v335
                            local _ = v336 * v335
                            local v337, v338
                            if math.abs(v329.X / - v329.Z) <= v314 / v315 then
                                if v329.Y <= 0 or not v328 then
                                    v337 = v315 - v328
                                else
                                    v337 = v328
                                end
                                v338 = v314 / 2 + v329.X * (v315 / 2 - v328) / math.abs(v329.Y)
                            else
                                if v329.X <= 0 then
                                    v338 = v328
                                else
                                    v338 = v314 - v328 or v328
                                end
                                v337 = v315 / 2 - v329.Y * (v314 / 2 - v328) / math.abs(v329.X)
                            end
                            v332 = math.clamp(v338, v328, v314 - v328)
                            v333 = math.clamp(v337, v328, v315 - v328)
                            v334 = math.deg(v330)
                        end
                        vu10:Create(v321, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Position = UDim2.fromOffset(v332, v333),
                            Rotation = v334
                        }):Play()
                    end
                    if v319.DistanceLabel then
                        v319.DistanceLabel.Text = string.format("%dm", math.round(v326))
                        local v339 = v320.ArrowSize and v320.ArrowSize.Y.Offset or p311.Settings.ArrowSize.Y.Offset
                        v319.DistanceLabel.Position = UDim2.new(0.5, 0, 0, v339 / 2 + 5)
                    end
                end
            end
        end
        p311:Remove(v318)
    end
end
function vu188.Destroy(p340)
    if p340._updateConn then
        p340._updateConn:Disconnect()
        p340._updateConn = nil
    end
    if p340._cleanupConn then
        p340._cleanupConn:Disconnect()
        p340._cleanupConn = nil
    end
    p340:ClearAllGroups()
    local v341, v342, v343 = pairs(p340.Indicators)
    while true do
        local v344
        v343, v344 = v341(v342, v343)
        if v343 == nil then
            break
        end
        p340:Remove(v343)
    end
    if p340.ScreenGui then
        p340.ScreenGui:Destroy()
        p340.ScreenGui = nil
    end
    p340.Indicators = {}
    p340.Groups = {}
    p340.TargetIndex = {}
end
local v345 = vu188
local v346 = vu1
local v347 = vu1.CreateWindow(v346, {
    Title = "Soluna",
    SubTitle = "Murder Mystery 2",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 500),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightShift
})
local v348 = {
    Player = v347:AddTab({
        Title = "Player",
        Icon = "user"
    }),
    Combat = v347:AddTab({
        Title = "Combat",
        Icon = "swords"
    }),
    Visuals = v347:AddTab({
        Title = "Visuals",
        Icon = "eye"
    }),
    Automation = v347:AddTab({
        Title = "Automation",
        Icon = "bot"
    }),
    Teleport = v347:AddTab({
        Title = "Teleport",
        Icon = "move"
    }),
    Misc = v347:AddTab({
        Title = "Misc",
        Icon = "box"
    }),
    Trolling = v347:AddTab({
        Title = "Trolling",
        Icon = "smile"
    }),
    Settings = v347:AddTab({
        Title = "Settings",
        Icon = "settings"
    })
}
local function vu360(p349)
    local v350, v351, v352 = pairs(vu18)
    while true do
        local v353
        v352, v353 = v350(v351, v352)
        if v352 == nil then
            break
        end
        if v353.Role == p349 or p349 == "Sheriff" and v353.Role == "Hero" then
            local v354 = vu5:FindFirstChild(v352)
            if v354 then
                return v354
            end
        end
    end
    local v355 = vu5
    local v356, v357, v358 = ipairs(v355:GetPlayers())
    while true do
        local v359
        v358, v359 = v356(v357, v358)
        if v358 == nil then
            break
        end
        if v359.Backpack:FindFirstChild(p349 == "Murderer" and "Knife" or ((p349 == "Sheriff" or p349 == "Hero") and ("Gun" or "None") or "None")) then
            return v359
        end
        if v359.Character and v359.Character:FindFirstChild(p349 == "Murderer" and "Knife" or ((p349 == "Sheriff" or p349 == "Hero") and ("Gun" or "None") or "None")) then
            return v359
        end
    end
    return nil
end
local function vu368(p361, p362)
    if not (p361 and p361.Character) then
        return Vector3.new(), "Target has no character"
    end
    local v363 = p361.Character:FindFirstChild("HumanoidRootPart")
    local v364 = p361.Character:FindFirstChildOfClass("Humanoid")
    if not (v363 and v364) then
        return Vector3.new(), "Target missing HRP or Humanoid"
    end
    local v365 = v363.AssemblyLinearVelocity
    local v366 = v364.MoveDirection
    local v367 = vu6:GetNetworkPing() * (vu12.mm2_offsetToPingMult and vu12.mm2_offsetToPingMult.Value or 1)
    return v363.Position + v365 * v367 + v366 * p362 * (1 + v367 * 2) + Vector3.new(0, v363.Size.Y * 0.25, 0)
end
function SetFlyState(pu369)
    vu13.fly.active = pu369
    vu24.Notify("Fly", pu369 and "Flight Systems Engaged." or "Flight Systems Disengaged.")
    local vu370 = vu6.Character
    if vu370 then
        pcall(function()
            local v371 = vu370:FindFirstChildOfClass("Humanoid")
            local v372 = vu370:FindFirstChild("HumanoidRootPart")
            if v371 and v372 then
                if pu369 then
                    v371.PlatformStand = true
                    if not vu13.fly.gyro then
                        vu13.fly.gyro = Instance.new("BodyGyro", v372)
                        vu13.fly.gyro.P = 50000
                        vu13.fly.gyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
                    end
                    if not vu13.fly.velocity then
                        vu13.fly.velocity = Instance.new("BodyVelocity", v372)
                        vu13.fly.velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        vu13.fly.velocity.Velocity = Vector3.new()
                    end
                else
                    v371.PlatformStand = false
                    if vu13.fly.gyro then
                        vu13.fly.gyro:Destroy()
                        vu13.fly.gyro = nil
                    end
                    if vu13.fly.velocity then
                        vu13.fly.velocity:Destroy()
                        vu13.fly.velocity = nil
                    end
                end
            end
        end)
    end
end
local v373 = vu7
vu7.BindToRenderStep(v373, "SolunaFly", Enum.RenderPriority.Character.Value, function()
    if vu13.fly.active and (vu13.fly.velocity and vu13.fly.gyro) then
        local v374 = {
            W = 0,
            A = 0,
            S = 0,
            D = 0,
            Q = 0,
            E = 0
        }
        if vu8:IsKeyDown(Enum.KeyCode.W) then
            v374.W = 1
        end
        if vu8:IsKeyDown(Enum.KeyCode.S) then
            v374.S = - 1
        end
        if vu8:IsKeyDown(Enum.KeyCode.A) then
            v374.A = - 1
        end
        if vu8:IsKeyDown(Enum.KeyCode.D) then
            v374.D = 1
        end
        if vu8:IsKeyDown(Enum.KeyCode.E) then
            v374.E = 1
        end
        if vu8:IsKeyDown(Enum.KeyCode.Q) then
            v374.Q = - 1
        end
        local v375 = workspace.CurrentCamera
        local v376 = Vector3.new(v374.A + v374.D, v374.Q + v374.E, v374.S + v374.W)
        local v377 = 50 * vu13.fly.speed
        vu13.fly.velocity.Velocity = (v375.CFrame.RightVector * v376.X + v375.CFrame.UpVector * v376.Y + v375.CFrame.LookVector * v376.Z) * v377
        vu13.fly.gyro.CFrame = v375.CFrame
    end
end)
local v378 = v348.Player
local v379 = v378:AddSection("Character")
v379:AddSlider("universal_walkspeed_slider", {
    Title = "Walkspeed",
    Default = 16,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Callback = function(p380)
        if vu6.Character and vu6.Character:FindFirstChildOfClass("Humanoid") then
            vu6.Character.Humanoid.WalkSpeed = p380
        end
    end
})
v379:AddSlider("universal_fov_val", {
    Title = "Field of View (FOV)",
    Description = "Adjust the camera FOV",
    Default = 70,
    Min = 1,
    Max = 120,
    Rounding = 0,
    Callback = function(p381)
        if workspace.CurrentCamera then
            workspace.CurrentCamera.FieldOfView = p381
        end
    end
})
v379:AddToggle("universal_loopWsFov_toggle", {
    Title = "Loop Walkspeed & FOV",
    Default = false,
    Callback = function(p382)
        vu24.Notify("Loop Walkspeed/FOV: " .. (p382 and "Enabled" or "Disabled"))
    end
})
v379:AddToggle("universal_infiniteJump_toggle", {
    Title = "Infinite Jump",
    Default = false,
    Callback = function(p383)
        vu24.Notify("Infinite Jump: " .. (p383 and "Enabled" or "Disabled"))
        if p383 then
            if vu21 then
                vu21:Disconnect()
            end
            vu21 = vu8.JumpRequest:Connect(function()
                if vu12.universal_infiniteJump_toggle and (vu12.universal_infiniteJump_toggle.Value and vu6.Character) and vu6.Character:FindFirstChildOfClass("Humanoid") then
                    vu6.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        elseif vu21 then
            vu21:Disconnect()
            vu21 = nil
        end
    end
})
local v384 = v378:AddSection("Movement")
if vu8.KeyboardEnabled and vu8.MouseEnabled then
    v384:AddToggle("universal_ctrlClickTp_toggle", {
        Title = "Ctrl+Click Teleport",
        Default = false,
        Callback = function(p385)
            vu24.Notify("Ctrl+Click Teleport: " .. (p385 and "Enabled" or "Disabled"))
        end
    })
end
vu6.CharacterAdded:Connect(function(_)
    if vu12.universal_fly_toggle and vu12.universal_fly_toggle.Value then
        task.wait(1)
        SetFlyState(true)
    end
    vu17 = {
        character = nil,
        parts = {}
    }
end)
vu6.CharacterRemoving:Connect(function()
    vu17 = {
        character = nil,
        parts = {}
    }
end)
v384:AddToggle("universal_fly_toggle", {
    Title = "Fly",
    Default = false,
    Callback = function(p386)
        SetFlyState(p386)
    end
})
v384:AddSlider("universal_flySpeed_slider", {
    Title = "Fly Speed Multiplier",
    Default = 1,
    Min = 0.1,
    Max = 10,
    Rounding = 1,
    Callback = function(p387)
        vu13.fly.speed = p387
    end
})
v384:AddToggle("universal_noclip_toggle", {
    Title = "Noclip",
    Default = false,
    Callback = function(p388)
        if vu20 and vu20.Connected then
            vu20:Disconnect()
        end
        if p388 then
            vu20 = vu7.Stepped:Connect(function()
                local v389 = vu6.Character
                if v389 then
                    local v390, v391, v392 = ipairs(v389:GetDescendants())
                    while true do
                        local v393
                        v392, v393 = v390(v391, v392)
                        if v392 == nil then
                            break
                        end
                        if v393:IsA("BasePart") then
                            v393.CanCollide = false
                        end
                    end
                end
            end)
            vu24.Notify("Noclip: Enabled")
        else
            vu24.Notify("Noclip: Disabled")
            vu24.Notify("Noclip disabled. Character reset might be needed to restore collisions.", "Warning", 4)
        end
    end
})
vu7.RenderStepped:Connect(function()
    if vu12.universal_loopWsFov_toggle and vu12.universal_loopWsFov_toggle.Value then
        if workspace.CurrentCamera and vu12.universal_fov_val then
            local v394 = tonumber(vu12.universal_fov_val.Value) or 70
            workspace.CurrentCamera.FieldOfView = v394
        end
        if vu6.Character and (vu6.Character:FindFirstChildOfClass("Humanoid") and vu12.universal_walkspeed_slider) then
            local v395 = vu12.universal_walkspeed_slider.Value
            vu6.Character.Humanoid.WalkSpeed = v395
        end
    end
end)
vu8.InputBegan:Connect(function(p396, p397)
    if not p397 then
        if vu12.universal_ctrlClickTp_toggle and vu12.universal_ctrlClickTp_toggle.Value and (vu8:IsKeyDown(Enum.KeyCode.LeftControl) and p396.UserInputType == Enum.UserInputType.MouseButton1) then
            local v398 = vu6:GetMouse()
            local v399 = workspace.CurrentCamera:ScreenPointToRay(v398.X, v398.Y)
            local v400 = RaycastParams.new()
            v400.FilterDescendantsInstances = {
                vu6.Character
            }
            v400.FilterType = Enum.RaycastFilterType.Blacklist
            local v401 = workspace:Raycast(v399.Origin, v399.Direction * 1000, v400)
            if v401 and (v401.Position and vu6.Character) and vu6.Character:FindFirstChild("HumanoidRootPart") then
                vu6.Character.HumanoidRootPart.CFrame = CFrame.new(v401.Position)
                vu24.Notify("Teleported to mouse position.")
            else
                vu24.Notify("Could not find a place to teleport.", "Error", nil, "Cancel")
            end
        end
    end
end)
local v402 = v348.Combat
local v403 = v402:AddSection("Sheriff/Hero Actions")
local v404 = v402:AddSection("Murderer Actions")
local v405 = v402:AddSection("Aiming & Prediction")
local function vu430()
    if vu360("Sheriff") == vu6 or vu360("Hero") == vu6 then
        if not (vu6.Character and vu6.Character:FindFirstChild("Gun")) then
            if not vu6.Backpack:FindFirstChild("Gun") then
                vu24.Notify("You don\'t have the gun.", "Error", nil, "Cancel")
                return
            end
            vu6.Character:FindFirstChildOfClass("Humanoid"):EquipTool(vu6.Backpack.Gun)
            task.wait(0.2)
            if not vu6.Character:FindFirstChild("Gun") then
                vu24.Notify("Failed to equip the gun.", "Error", nil, "Cancel")
                return
            end
        end
        local v406 = vu360("Murderer")
        if not v406 then
            local v407 = vu5
            local v408, v409, v410 = ipairs(v407:GetPlayers())
            local v411 = {}
            while true do
                local v412, v413 = v408(v409, v410)
                if v412 == nil then
                    break
                end
                v410 = v412
                if v413 ~= vu6 and (vu18[v413.Name] and (vu18[v413.Name].Role == "Sheriff" or vu18[v413.Name].Role == "Hero") or (v413.Backpack:FindFirstChild("Gun") or v413.Character and v413.Character:FindFirstChild("Gun"))) then
                    table.insert(v411, v413)
                end
            end
            if # v411 > 0 then
                local v414 = math.huge
                if vu6.Character and vu6.Character:FindFirstChild("HumanoidRootPart") then
                    local v415 = vu6.Character.HumanoidRootPart.Position
                    local v416, v417, v418 = ipairs(v411)
                    while true do
                        local v419, v420 = v416(v417, v418)
                        if v419 == nil then
                            break
                        end
                        v418 = v419
                        if v420.Character and v420.Character:FindFirstChild("HumanoidRootPart") then
                            local v421 = (v420.Character.HumanoidRootPart.Position - v415).Magnitude
                            if v421 < v414 then
                                v406 = v420
                                v414 = v421
                            end
                        end
                    end
                else
                    v406 = v411[1]
                end
                vu24.Notify("Murderer not found. Targeting other Sheriff/Hero: " .. v406.Name, "Targeting", 2)
            end
        end
        if v406 and v406.Character then
            local v422, v423 = vu368(v406, vu12.mm2_shootOffset and vu12.mm2_shootOffset.Value or 2.8)
            if v423 then
                vu24.Notify(v423, "Prediction Error", nil, "Cancel")
                return
            else
                if not vu6.Character:FindFirstChild("Gun") then
                    if not vu6.Backpack:FindFirstChild("Gun") then
                        vu24.Notify("Gun lost before firing.", "Error", nil, "Cancel")
                        return
                    end
                    vu6.Character:FindFirstChildOfClass("Humanoid"):EquipTool(vu6.Backpack.Gun)
                    task.wait(0.1)
                    if not vu6.Character:FindFirstChild("Gun") then
                        vu24.Notify("Gun became unequipped before firing.", "Error", nil, "Cancel")
                        return
                    end
                end
                local v424 = vu6.Character:FindFirstChild("Gun")
                local vu425
                if v424 then
                    vu425 = v424:FindFirstChild("Shoot")
                else
                    vu425 = v424
                end
                if vu425 then
                    local vu426 = v424:GetPivot()
                    local vu427 = CFrame.new(v422)
                    local v428, v429 = pcall(function()
                        vu425:FireServer(vu426, vu427)
                    end)
                    if v428 then
                        vu24.Notify("Shot at " .. v406.Name)
                    else
                        vu24.Notify("Failed to shoot: " .. tostring(v429), "Error", nil, "Cancel")
                    end
                else
                    vu24.Notify("Shoot remote not found in Gun.", "Error", nil, "Cancel")
                end
            end
        else
            vu24.Notify("No target found (Murderer or other Sheriff/Hero).", "Error", nil, "Cancel")
            return
        end
    else
        vu24.Notify("You are not the Sheriff/Hero.", "Error", nil, "Cancel")
        return
    end
end
v403:AddButton({
    Title = "Shoot Target (Murderer/Other)",
    Callback = vu430
})
v403:AddKeybind("mm2_shootMurderer_keybind", {
    Title = "Shoot Murderer",
    Mode = "Toggle",
    Default = "F",
    Callback = function(p431)
        if p431 then
            vu430()
        end
    end
})
v404:AddButton({
    Title = "Kill Nearest Player",
    Callback = function()
        if vu360("Murderer") == vu6 then
            if not (vu6.Character and vu6.Character:FindFirstChild("Knife")) then
                if not vu6.Backpack:FindFirstChild("Knife") then
                    vu24.Notify("You don\'t have the knife.", "Error", nil, "Cancel")
                    return
                end
                vu6.Character:FindFirstChildOfClass("Humanoid"):EquipTool(vu6.Backpack.Knife)
                task.wait(0.2)
            end
            local v432 = math.huge
            local v433 = vu5
            local v434, v435, v436 = ipairs(v433:GetPlayers())
            local vu437 = nil
            while true do
                local v438
                v436, v438 = v434(v435, v436)
                if v436 == nil then
                    break
                end
                if v438 ~= vu6 and v438.Character and (v438.Character:FindFirstChild("HumanoidRootPart") and (vu360("Murderer") ~= v438 and (vu360("Sheriff") ~= v438 and vu360("Hero") ~= v438))) then
                    local v439 = (vu6.Character.HumanoidRootPart.Position - v438.Character.HumanoidRootPart.Position).Magnitude
                    if v439 < v432 then
                        vu437 = v438
                        v432 = v439
                    end
                end
            end
            if vu437 then
                if vu12.mm2_simulateKnifeThrow and vu12.mm2_simulateKnifeThrow.Value then
                    local vu440, v441 = vu368(vu437, vu12.mm2_shootOffset and vu12.mm2_shootOffset.Value or 2.8)
                    if v441 then
                        vu24.Notify(v441, "Prediction Error", nil, "Cancel")
                        return
                    end
                    pcall(function()
                        vu6.Character.Knife.Throw:FireServer(vu6.Character.Knife:GetPivot(), vu440)
                        vu24.Notify("Threw knife at " .. vu437.Name)
                    end)
                else
                    local v442 = vu437.Character.HumanoidRootPart
                    local v443 = vu6.Character.HumanoidRootPart
                    local v444 = v442.CFrame
                    local v445 = v442.Anchored
                    v442.Anchored = true
                    v442.CFrame = v443.CFrame * CFrame.new(0, 0, - 2)
                    task.wait(0.05)
                    vu6.Character.Knife.Stab:FireServer("Slash")
                    task.wait(0.05)
                    if v442 and v442.Parent then
                        v442.CFrame = v444
                        v442.Anchored = v445
                    end
                    vu24.Notify("Stabbed " .. vu437.Name)
                end
            else
                vu24.Notify("No nearby players (non-role).", "Error", nil, "Cancel")
            end
        else
            vu24.Notify("You are not the Murderer.", "Error", nil, "Cancel")
            return
        end
    end
})
v404:AddToggle("mm2_killAura_toggle", {
    Title = "Kill Aura",
    Default = false,
    Callback = function(p446)
        vu24.Notify("Kill Aura: " .. (p446 and "Enabled" or "Disabled"))
        if p446 then
            if vu14 and vu14.Connected then
                vu14:Disconnect()
            end
            vu14 = vu7.Heartbeat:Connect(function()
                if vu12.mm2_killAura_toggle and (vu12.mm2_killAura_toggle.Value and (vu360("Murderer") == vu6 and vu6.Character)) and vu6.Character:FindFirstChild("Knife") then
                    local v447 = vu12.mm2_killAuraDistance_slider and vu12.mm2_killAuraDistance_slider.Value or 7
                    local v448 = vu5
                    local v449, v450, v451 = ipairs(v448:GetPlayers())
                    while true do
                        local v452
                        v451, v452 = v449(v450, v451)
                        if v451 == nil then
                            break
                        end
                        if v452 ~= vu6 and v452.Character and (v452.Character:FindFirstChild("HumanoidRootPart") and (vu360("Murderer") ~= v452 and (vu360("Sheriff") ~= v452 and vu360("Hero") ~= v452))) then
                            local v453 = vu6.Character:FindFirstChild("HumanoidRootPart")
                            if not v453 then
                                return
                            end
                            local v454 = v452.Character.HumanoidRootPart
                            if (v454.Position - v453.Position).Magnitude < v447 then
                                local v455 = v454.CFrame
                                local v456 = v454.Anchored
                                v454.Anchored = true
                                v454.CFrame = v453.CFrame * CFrame.new(0, 0, - 2)
                                task.wait(0.05)
                                vu6.Character.Knife.Stab:FireServer("Slash")
                                task.wait(0.05)
                                if v454 and v454.Parent then
                                    v454.CFrame = v455
                                    v454.Anchored = v456
                                end
                                return
                            end
                        end
                    end
                end
            end)
        elseif vu14 and vu14.Connected then
            vu14:Disconnect()
        end
    end
})
v404:AddSlider("mm2_killAuraDistance_slider", {
    Title = "Kill Aura Distance",
    Default = 7,
    Min = 1,
    Max = 20,
    Rounding = 0,
    Callback = function(_)
    end
})
v404:AddButton({
    Title = "Kill Everyone",
    Callback = function()
        if vu360("Murderer") == vu6 then
            if not (vu6.Character and vu6.Character:FindFirstChild("Knife")) then
                if not vu6.Backpack:FindFirstChild("Knife") then
                    vu24.Notify("You don\'t have the knife.", "Error", nil, "Cancel")
                    return
                end
                vu6.Character:FindFirstChildOfClass("Humanoid"):EquipTool(vu6.Backpack.Knife)
                task.wait(0.2)
            end
            local v457 = vu5
            local v458, v459, v460 = ipairs(v457:GetPlayers())
            local v461 = {}
            while true do
                local v462
                v460, v462 = v458(v459, v460)
                if v460 == nil then
                    break
                end
                if v462 ~= vu6 and v462.Character and v462.Character:FindFirstChild("HumanoidRootPart") then
                    local v463 = v462.Character.HumanoidRootPart
                    v461[v462] = {
                        CFrame = v463.CFrame,
                        Anchored = v463.Anchored
                    }
                    v463.Anchored = true
                    v463.CFrame = vu6.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, - 1)
                    task.wait(0.01)
                end
            end
            vu6.Character.Knife.Stab:FireServer("Slash")
            task.wait(0.1)
            local v464, v465, v466 = pairs(v461)
            while true do
                local v467
                v466, v467 = v464(v465, v466)
                if v466 == nil then
                    break
                end
                if v466.Character and v466.Character:FindFirstChild("HumanoidRootPart") then
                    v466.Character.HumanoidRootPart.CFrame = v467.CFrame
                    v466.Character.HumanoidRootPart.Anchored = v467.Anchored
                end
            end
            vu24.Notify("Attempted to kill everyone.")
        else
            vu24.Notify("You are not the Murderer.", "Error", nil, "Cancel")
        end
    end
})
v405:AddParagraph({
    Title = "Combat Settings & Prediction",
    Content = "These settings refine how the script aims at moving targets.\n\'Aim Prediction Offset\' dictates how far ahead to aim.\n\'Ping Multiplier\' dynamically adjusts this offset based on your current network latency (ping) for better accuracy."
})
v405:AddToggle("mm2_simulateKnifeThrow", {
    Title = "Simulate Knife Throw for Kill Nearest",
    Default = false,
    Callback = function(p468)
        vu24.Notify("Simulate Knife Throw: " .. (p468 and "Enabled" or "Disabled"))
    end
})
v405:AddSlider("mm2_shootOffset", {
    Title = "Aim Prediction Offset",
    Default = 2.8,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Callback = function(_)
    end
})
v405:AddSlider("mm2_offsetToPingMult", {
    Title = "Ping Multiplier for Prediction",
    Default = 1,
    Min = 0,
    Max = 5,
    Rounding = 1,
    Callback = function(_)
    end
})
local v469 = v348.Visuals
local v470 = v469:AddSection("Player ESP")
local v471 = v469:AddSection("Object ESP")
local vu472 = v19 or v345.new({
    ArrowEdgePadding = 70,
    ArrowShowDistanceText = false
})
local function vu483()
    if vu472 then
        vu472:RemoveGroup("mm2_players")
        if vu12.mm2_playerESP and vu12.mm2_playerESP.Value then
            local v473 = vu5
            local v474, v475, v476 = ipairs(v473:GetPlayers())
            while true do
                local v477
                v476, v477 = v474(v475, v476)
                if v476 == nil then
                    break
                end
                if v477.Character then
                    local v478 = "Innocent"
                    local v479 = Color3.new(0, 1, 0.03)
                    local v480 = false
                    local v481 = v477.DisplayName
                    local v482 = 0
                    if v477 ~= vu360("Murderer") then
                        if v477 == vu360("Sheriff") or v477 == vu360("Hero") then
                            v479 = Color3.new(0, 0.6, 1)
                            v480 = true
                            v482 = 0
                            v481 = "Sheriff/Hero"
                            v478 = "Sheriff/Hero"
                        end
                    else
                        v479 = Color3.new(1, 0, 0.015)
                        v480 = true
                        v482 = 99999
                        v481 = "Murderer"
                        v478 = "Murderer"
                    end
                    vu472:Add(v477.Character, {
                        AccentColor = v479,
                        ArrowShow = v480,
                        ArrowMinDistance = v482,
                        ArrowSize = UDim2.new(0, 35, 0, 35),
                        LabelText = v481,
                        ShowLabel = v478 ~= "Innocent" and true or vu12.mm2_showInnocentNamesESP.Value,
                        GroupName = "mm2_players"
                    })
                end
            end
        end
    else
        return
    end
end
if game:GetService("ReplicatedStorage"):FindFirstChild("Remotes") and (game:GetService("ReplicatedStorage").Remotes:FindFirstChild("Gameplay") and game:GetService("ReplicatedStorage").Remotes.Gameplay:FindFirstChild("PlayerDataChanged")) then
    game:GetService("ReplicatedStorage").Remotes.Gameplay.PlayerDataChanged.OnClientEvent:Connect(function(p484)
        vu18 = p484
        if vu12.mm2_playerESP and vu12.mm2_playerESP.Value then
            vu483()
        end
    end)
end
v470:AddToggle("mm2_playerESP", {
    Title = "Enable Player ESP",
    Default = false,
    Callback = function(p485)
        vu483()
        vu24.Notify("Player ESP: " .. (p485 and "Enabled" or "Disabled"))
    end
})
v470:AddToggle("mm2_showInnocentNamesESP", {
    Title = "Show Innocent Names (ESP)",
    Default = false,
    Description = "If Player ESP is on, this will show names for Innocents too.",
    Callback = function(p486)
        vu483()
        vu24.Notify("Show Innocent Names ESP: " .. (p486 and "Enabled" or "Disabled"))
    end
})
v471:AddToggle("mm2_gunDropESP", {
    Title = "Dropped Gun ESP",
    Default = false,
    Callback = function(p487)
        if vu472 then
            if p487 then
                local v488 = getMap()
                if v488 then
                    local v489, v490, v491 = ipairs(v488:GetChildren())
                    while true do
                        local v492
                        v491, v492 = v489(v490, v491)
                        if v491 == nil then
                            break
                        end
                        if v492.Name == "GunDrop" then
                            vu472:Add(v492, {
                                AccentColor = Color3.new(0.95, 1, 0.07),
                                ArrowShow = true,
                                ArrowMinDistance = 99999,
                                ArrowSize = UDim2.new(0, 30, 0, 30),
                                LabelText = "Dropped Gun!",
                                ShowLabel = true,
                                GroupName = "mm2_gun"
                            })
                        end
                    end
                end
            else
                vu472:RemoveGroup("mm2_gun")
            end
            vu24.Notify("Dropped Gun ESP: " .. (p487 and "Enabled" or "Disabled"))
        end
    end
})
v471:AddToggle("mm2_trapDetection", {
    Title = "Trap ESP",
    Default = false,
    Callback = function(p493)
        if vu472 then
            if p493 then
                local v494, v495, v496 = ipairs(workspace:GetDescendants())
                while true do
                    local v497
                    v496, v497 = v494(v495, v496)
                    if v496 == nil then
                        break
                    end
                    if v497.Name == "Trap" and v497.Parent and v497.Parent:IsDescendantOf(workspace) then
                        v497.Transparency = 0
                        vu472:Add(v497, {
                            AccentColor = Color3.fromRGB(255, 100, 0),
                            ShowLabel = true,
                            LabelText = "Trap",
                            GroupName = "mm2_traps"
                        })
                    end
                end
            else
                vu472:RemoveGroup("mm2_traps")
            end
            vu24.Notify("Trap ESP: " .. (p493 and "Enabled" or "Disabled"))
        end
    end
})
local v498 = v348.Automation
local v499 = v498:AddSection("Coin Collection")
v499:AddParagraph({
    Title = "Coin Collection",
    Content = "When enabled, this feature will automatically navigate your character to the nearest coin on the map to collect it. Your character will move."
})
v499:AddSlider("mm2_coinFarmSpeed_slider", {
    Title = "Coin Farm Speed (studs/sec)",
    Description = "Adjusts how fast your character moves to collect coins.",
    Default = 10,
    Min = 5,
    Max = 25,
    Rounding = 0,
    Callback = function(_)
    end
})
v499:AddToggle("mm2_coinMagnet_loop_toggle", {
    Title = "Coin Magnet (Auto Collect)",
    Default = false,
    Callback = function(p500)
        vu24.Notify("Coin Magnet: " .. (p500 and "Enabled" or "Disabled"))
        local vu501 = p500
        if p500 then
            if vu15 then
                task.cancel(vu15)
            end
            vu15 = task.spawn(function()
                local v502 = rawget(_G, "firetouchinterest") or firetouchinterest
                local v503 = nil
                local v504 = nil
                local v505 = nil
                local v506 = {}
                while vu501 and (vu6 and vu6.Character) do
                    task.wait(0.02)
                    local v507 = vu6.Character
                    if v507 ~= v504 then
                        v506 = vu44(v507)
                        v504 = v507
                    end
                    if v507 then
                        v507 = v507:FindFirstChild("HumanoidRootPart")
                    end
                    if v507 then
                        local v508 = getMap()
                        if v508 then
                            local v509 = v508:FindFirstChild("CoinContainer")
                            if v509 == vu16.container then
                                if v509 == nil then
                                    vu25()
                                end
                            else
                                vu37(v509)
                            end
                            if # vu16.list ~= 0 then
                                local v510 = math.huge
                                local v511, v512, v513 = ipairs(vu16.list)
                                local v514 = nil
                                local v515 = nil
                                while true do
                                    local v516
                                    v513, v516 = v511(v512, v513)
                                    if v513 == nil then
                                        break
                                    end
                                    if v516 and (v516.Parent and v516:GetAttribute("SolunaSkip") ~= true) then
                                        local v517 = (v516.IsA and v516:IsA("BasePart") and v516.CFrame or v516:GetPivot()).Position
                                        local v518 = (v507.Position - v517).Magnitude
                                        if v518 < v510 then
                                            v515 = CFrame.new(v517)
                                            v514 = v516
                                            v510 = v518
                                        end
                                    end
                                end
                                if v514 and v514.Parent then
                                    local v519 = v515 or v514:GetPivot()
                                    local v520 = math.clamp((v507.Size and (v507.Size.Y or 0) or 0) * 0.5, 0.75, 2)
                                    local v521 = math.max(v520 - 0.4, 0)
                                    local v522 = v519 * CFrame.new(0, v521, 0)
                                    local v523 = v514:IsA("BasePart") and v514 and v514 or v514:FindFirstChildWhichIsA("BasePart", true)
                                    local v524 = (v507.Position - v522.Position).Magnitude
                                    if (v505 ~= v514 or (not v503 or v503.PlaybackState ~= Enum.PlaybackState.Playing)) and true or false then
                                        if v503 then
                                            v503:Cancel()
                                        end
                                        local v525 = vu12.mm2_coinFarmSpeed_slider
                                        local v526 = v525 and v525.Value or 15
                                        local v527 = math.clamp(v524 / math.max(v526, 1), 0.05, 2.5)
                                        v503 = vu10:Create(v507, TweenInfo.new(v527, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                                            CFrame = v522
                                        })
                                        v503:Play()
                                        v505 = v514
                                    end
                                    if v524 <= 4 and v523 then
                                        vu52(v523, v506, v502)
                                    end
                                    if v524 <= 1.5 then
                                        if v523 then
                                            vu52(v523, v506, v502)
                                        end
                                        vu28(v514)
                                        v505 = nil
                                        if v503 then
                                            v503:Cancel()
                                            v503 = nil
                                        end
                                    end
                                else
                                    if v503 then
                                        v503:Cancel()
                                        v503 = nil
                                    end
                                    v505 = nil
                                end
                            end
                        end
                    end
                end
                if v503 then
                    v503:Cancel()
                end
            end)
        else
            if vu15 then
                task.cancel(vu15)
                vu15 = nil
            end
            vu25()
        end
    end
})
local v528 = v498:AddSection("Gun Pickup")
v528:AddParagraph({
    Title = "Gun Pickup",
    Content = "If the Sheriff drops the gun, enabling this will automatically attempt to pick it up using a non-teleport method (`firetouchinterest`)."
})
v528:AddToggle("mm2_autoGetGun_toggle_farm", {
    Title = "Auto-Get Dropped Gun",
    Default = false,
    Callback = function(p529)
        vu24.Notify("Auto-Get Dropped Gun: " .. (p529 and "Enabled" or "Disabled"))
        if p529 then
            local v530 = getMap()
            if v530 and v530:FindFirstChild("GunDrop") then
                vu24.Notify("Gun already on ground, attempting auto-pickup...", "Auto", 3)
                task.spawn(function()
                    vu24.pickupGun()
                end)
            end
        end
    end
})
v528:AddKeybind("mm2_manualGetGun_keybind", {
    Title = "Manually Get Dropped Gun",
    Mode = "Hold",
    Default = "G",
    Callback = function(p531)
        if p531 then
            vu24.pickupGun()
        end
    end
})
local v532 = v348.Teleport
local v533 = v532:AddSection("Game Teleportation")
local v534 = v532:AddSection("Safe Zone")
v533:AddButton({
    Title = "Teleport to Lobby",
    Callback = function()
        if vu6.Character and vu6.Character:FindFirstChild("HumanoidRootPart") then
            vu6.Character.HumanoidRootPart.CFrame = CFrame.new(- 107, 152, 41)
        else
            vu24.Notify("Your character is not available.", "Error", nil, "Cancel")
        end
    end
})
v533:AddButton({
    Title = "Teleport to Map Spawn",
    Callback = function()
        local v535 = getMap()
        if v535 and v535:FindFirstChild("Spawns") then
            local v536 = v535.Spawns:GetChildren()
            if # v536 <= 0 then
                vu24.Notify("No spawns found on map.", "Error", nil, "Cancel")
            else
                local v537 = v536[math.random(1, # v536)]
                if vu6.Character and vu6.Character:FindFirstChild("HumanoidRootPart") then
                    vu6.Character.HumanoidRootPart.CFrame = v537.CFrame
                else
                    vu24.Notify("Your character is not available.", "Error", nil, "Cancel")
                end
            end
        else
            vu24.Notify("Map not loaded or no spawns folder.", "Error", nil, "Cancel")
        end
    end
})
v534:AddButton({
    Title = "Teleport to Safe Zone",
    Callback = function()
        if vu23 and vu23.Parent then
            if vu6.Character and vu6.Character:FindFirstChild("HumanoidRootPart") then
                local v538 = vu6.Character.HumanoidRootPart
                local v539 = vu23.Position + Vector3.new(0, 5, 0)
                v538.CFrame = CFrame.new(v539)
                vu24.Notify("Teleported to Safe Zone.", "Success")
            else
                vu24.Notify("Your character is not available to teleport.", "Error", nil, "Cancel")
            end
        else
            vu24.Notify("Safe Zone does not exist. Try re-creating it.", "Error", nil, "Cancel")
        end
    end
})
v534:AddButton({
    Title = "Re-create Safe Zone",
    Callback = function()
        vu187()
    end
})
local v540 = v348.Misc
local v541 = v540:AddSection("Game Information")
local v542 = v540:AddSection("Spectate System")
local v543 = v540:AddSection("Client")
v541:AddButton({
    Title = "Copy Murderer Username",
    Callback = function()
        local v544 = vu360("Murderer")
        if v544 and typeof(setclipboard) == "function" then
            setclipboard(v544.Name)
            vu24.Notify("Murderer username copied: " .. v544.Name)
        else
            vu24.Notify("Murderer not found or setclipboard is not available.", "Error", nil, "Cancel")
        end
    end
})
v541:AddButton({
    Title = "Copy Sheriff/Hero Username",
    Callback = function()
        local v545 = vu360("Sheriff") or vu360("Hero")
        if v545 and typeof(setclipboard) == "function" then
            setclipboard(v545.Name)
            vu24.Notify("Sheriff/Hero username copied: " .. v545.Name)
        else
            vu24.Notify("Sheriff/Hero not found or setclipboard is not available.", "Error", nil, "Cancel")
        end
    end
})
v541:AddButton({
    Title = "Send Roles to Chat",
    Callback = function()
        local v546 = game:GetService("TextChatService"):WaitForChild("TextChannels"):GetChildren()
        local v547, v548, v549 = ipairs(v546)
        while true do
            local v550
            v549, v550 = v547(v548, v549)
            if v549 == nil then
                break
            end
            if v550.Name ~= "RBXSystem" then
                local v551 = vu360("Murderer")
                local v552 = vu360("Sheriff") or vu360("Hero")
                local v553 = v551 and v551.Name or "-"
                local v554 = v552 and v552.Name or "-"
                v550:SendAsync(string.format("Murderer: %s | Sheriff/Hero: %s | [ Soluna ]", v553, v554))
                vu24.Notify("Roles sent to chat.")
                return
            end
        end
    end
})
v541:AddToggle("mm2_ignoreKnifeThrows_toggle", {
    Title = "Ignore Knife Throws (- Experimental)",
    Default = false,
    Callback = function(p555)
        vu24.Notify("Ignore Knife Throws: " .. (p555 and "Enabled" or "Disabled"))
    end
})
local vu556 = {
    player_list = {},
    current_index = 0,
    is_active = false
}
local function vu558()
    if vu556.is_active and # vu556.player_list ~= 0 then
        local v557 = vu556.player_list[vu556.current_index]
        if v557 and v557.Character and v557.Character:FindFirstChildOfClass("Humanoid") then
            workspace.CurrentCamera.CameraSubject = v557.Character:FindFirstChildOfClass("Humanoid")
            vu24.Notify("Now spectating: " .. v557.Name, "Spectate")
        else
            vu24.Notify((v557 and v557.Name or "Player") .. " has no character. Skipping.", "Spectate", 2)
            table.remove(vu556.player_list, vu556.current_index)
            if # vu556.player_list == 0 then
                vu556.is_active = false
                vu556.current_index = 0
                if vu6.Character and vu6.Character:FindFirstChildOfClass("Humanoid") then
                    workspace.CurrentCamera.CameraSubject = vu6.Character:FindFirstChildOfClass("Humanoid")
                end
                vu24.Notify("No more players to spectate. Stopping.", "Spectate")
                return
            end
            if vu556.current_index > # vu556.player_list then
                vu556.current_index = 1
            end
            vu558()
        end
    elseif vu6.Character and vu6.Character:FindFirstChildOfClass("Humanoid") then
        workspace.CurrentCamera.CameraSubject = vu6.Character:FindFirstChildOfClass("Humanoid")
    end
end
v542:AddButton({
    Title = "Start/Refresh Spectate List",
    Description = "Prepares or updates the list of players to spectate.",
    Callback = function()
        vu556.player_list = vu5:GetPlayers()
        if # vu556.player_list ~= 0 then
            vu556.current_index = 1
            vu556.is_active = true
            vu24.Notify("Spectate list refreshed. Found " .. # vu556.player_list .. " players. Spectating first player.", "Spectate")
            vu558()
        else
            vu24.Notify("No players in server.", "Spectate Error", 3, "Cancel")
            vu556.is_active = false
            vu556.current_index = 0
        end
    end
})
v542:AddButton({
    Title = "Spectate Next Player",
    Callback = function()
        if vu556.is_active and # vu556.player_list ~= 0 then
            vu556.current_index = vu556.current_index + 1
            if vu556.current_index > # vu556.player_list then
                vu556.current_index = 1
            end
            vu558()
        else
            vu24.Notify("Start spectating or refresh list first.", "Spectate Info", 3)
        end
    end
})
v542:AddButton({
    Title = "Spectate Previous Player",
    Callback = function()
        if vu556.is_active and # vu556.player_list ~= 0 then
            vu556.current_index = vu556.current_index - 1
            if vu556.current_index < 1 then
                vu556.current_index = # vu556.player_list
            end
            vu558()
        else
            vu24.Notify("Start spectating or refresh list first.", "Spectate Info", 3)
        end
    end
})
v542:AddButton({
    Title = "Stop Spectating",
    Callback = function()
        if vu556.is_active then
            vu556.is_active = false
            vu556.current_index = 0
            if vu6.Character and vu6.Character:FindFirstChildOfClass("Humanoid") then
                workspace.CurrentCamera.CameraSubject = vu6.Character:FindFirstChildOfClass("Humanoid")
            end
            vu24.Notify("Spectating stopped.", "Spectate")
        else
            vu24.Notify("Not currently spectating.", "Spectate Info", 3)
        end
    end
})
v543:AddButton({
    Title = "Get Ping",
    Callback = function()
        local v559 = vu6
        vu24.Notify("Your ping: " .. math.floor(v559:GetNetworkPing() * 1000 + 0.5) .. "ms")
    end
})
v543:AddButton({
    Title = "Open Developer Console",
    Callback = function()
        pcall(function()
            game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
        end)
        vu24.Notify("Attempted to open Dev Console.")
    end
})
local v560 = v348.Trolling
local v561 = v560:AddSection("General Player Fling")
v561:AddParagraph({
    Title = "Player Fling",
    Content = "This feature attempts to fling the selected player using a common method. Results can vary. Use responsibly."
})
local vu562 = {}
local function vu571()
    table.clear(vu562)
    local v563 = vu5
    local v564, v565, v566 = ipairs(v563:GetPlayers())
    local v567 = false
    while true do
        local v568
        v566, v568 = v564(v565, v566)
        if v566 == nil then
            break
        end
        table.insert(vu562, v568.Name)
        v567 = true
    end
    if not v567 then
        table.insert(vu562, "No players found")
    end
    if vu12.troll_target_player_dropdown then
        local v569 = vu12.troll_target_player_dropdown.Value
        local v570 = vu562[1]
        if not table.find(vu562, v569) then
            v569 = v570
        end
        vu12.troll_target_player_dropdown:SetValues(vu562)
        vu12.troll_target_player_dropdown:SetValue(v569)
    end
    return vu562
end
vu571()
v561:AddDropdown("troll_target_player_dropdown", {
    Title = "Select Player to Troll",
    Values = vu562,
    Multi = false,
    Default = vu562[1] or "No players found",
    Callback = function(p572)
        local v573 = vu5:FindFirstChild(p572)
        if v573 then
            vu22 = v573
        else
            vu22 = nil
            if p572 ~= "No players found" then
                vu24.Notify("Could not find player: " .. p572, "Error")
            end
        end
    end
})
v561:AddButton({
    Title = "Refresh Troll Player List",
    Callback = function()
        vu571()
        vu24.Notify("Troll player list refreshed.")
    end
})
if # vu562 > 0 and vu562[1] ~= "No players found" then
    local v574 = vu5
    vu22 = vu5.FindFirstChild(v574, vu562[1])
end
v561:AddButton({
    Title = "Fling Selected Player",
    Callback = function()
        local v575 = vu22
        if v575 then
            vu24.miniFling(v575)
        else
            vu24.Notify("No target selected.", "Error", nil, "Cancel")
        end
    end
})
v561:AddButton({
    Title = "Fling Murderer (MM2)",
    Callback = function()
        local v576 = vu360("Murderer")
        if v576 then
            vu24.miniFling(v576)
        else
            vu24.Notify("No Murderer found to fling.", "Error")
        end
    end
})
v561:AddButton({
    Title = "Fling Sheriff/Hero (MM2)",
    Callback = function()
        local v577 = vu360("Sheriff") or vu360("Hero")
        if v577 then
            vu24.miniFling(v577)
        else
            vu24.Notify("No Sheriff/Hero found to fling.", "Error")
        end
    end
})
local v578 = v560:AddSection("High-Risk Features")
v578:AddParagraph({
    Title = "God Mode (- Highly Risky)",
    Content = "EXPERIMENTAL: Attempts to make you invincible. This is very unstable, likely to cause crashes, kicks, or may not work at all. Use at your own extreme risk. A character reset is usually needed to undo this."
})
v578:AddButton({
    Title = "Activate God Mode",
    Callback = function()
        vu24.Notify("God Mode is highly unstable and may crash/kick.", "Warning", 5)
        task.wait(1)
        local v579 = workspace.CurrentCamera
        local v580 = vu6.Character
        local v581
        if v580 then
            v581 = v580:FindFirstChildWhichIsA("Humanoid")
        else
            v581 = v580
        end
        if v581 then
            local v582 = v579.CFrame
            local v583 = v581:Clone()
            vu6.Character = nil
            v583.Parent = v580
            v583:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            v583:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            v583:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
            v581:Destroy()
            vu6.Character = v580
            task.wait()
            v579.CameraSubject = v583
            v579.CFrame = v582
            v583.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            local v584 = v580:FindFirstChild("Animate")
            if v584 then
                v584.Disabled = true
                task.wait()
                v584.Disabled = false
            end
            v583.Health = v583.MaxHealth
            vu24.Notify("God Mode activated (experimental).")
        else
            vu24.Notify("Humanoid not found.", "Error", nil, "Cancel")
        end
    end
})
v578:AddParagraph({
    Title = "Hold Everyone Hostage (- Murderer)",
    Content = "As Murderer, this teleports all other players near you and anchors them. Useful for \'Kill Everyone\' or \'Kill Nearest\'. They remain anchored until death or round end."
})
v578:AddButton({
    Title = "Hold Everyone Hostage",
    Callback = function()
        if vu360("Murderer") == vu6 then
            if vu6.Character and vu6.Character:FindFirstChild("HumanoidRootPart") then
                local v585 = vu6.Character.HumanoidRootPart.Position
                local v586 = vu5
                local v587, v588, v589 = ipairs(v586:GetPlayers())
                while true do
                    local v590
                    v589, v590 = v587(v588, v589)
                    if v589 == nil then
                        break
                    end
                    if v590 ~= vu6 and v590.Character and v590.Character:FindFirstChild("HumanoidRootPart") then
                        v590.Character.HumanoidRootPart.Anchored = true
                        v590.Character.HumanoidRootPart.CFrame = CFrame.new(v585 + Vector3.new(math.random(- 2, 2), 0, math.random(- 2, 2)))
                    end
                end
                vu24.Notify("Everyone gathered. Use Kill Everyone or Kill Nearest.")
            else
                vu24.Notify("Your character is not available.", "Error", nil, "Cancel")
            end
        else
            vu24.Notify("You are not the Murderer.", "Error", nil, "Cancel")
            return
        end
    end
})
local v591 = v348.Settings
local v592 = v591:AddSection("UI & Script Settings")
local v593 = v591:AddSection("About & Credits")
v592:AddToggle("acrylicBlurToggle", {
    Title = "UI Blur (Acrylic)",
    Default = v347.Acrylic,
    Callback = function(p594)
        vu1:ToggleAcrylic(p594)
        vu24.Notify((p594 and "Enabled" or "Disabled") .. " UI Blur")
    end
})
v592:AddToggle("enableNotifications", {
    Title = "Enable Notifications",
    Default = true,
    Callback = function(p595)
        vu24.Notify((p595 and "Enabled" or "Disabled") .. " Notifications")
    end
})
v593:AddButton({
    Title = "Join our Discord",
    Callback = function()
        if typeof(setclipboard) ~= "function" then
            vu24.Notify("Could not copy link. Your executor may not support \'setclipboard\'.", "Error")
        else
            setclipboard("https://discord.gg/gdpCUVj6uS")
            vu24.Notify("Discord link copied to clipboard!")
        end
    end
})
v593:AddParagraph({
    Title = "Soluna",
    Content = "Soluna Script Hub for Murder Mystery 2."
})
v593:AddParagraph({
    Title = "discord.gg/gdpCUVj6uS",
    Content = "Script by Soluna Development Team."
})
vu5.PlayerAdded:Connect(function(p596)
    if vu12.mm2_playerESP and (vu12.mm2_playerESP.Value and (vu472 and typeof(vu483) == "function")) then
        task.wait(0.1)
        vu483()
    end
    p596.CharacterAdded:Connect(function(_)
        if vu12.mm2_playerESP and (vu12.mm2_playerESP.Value and (vu472 and typeof(vu483) == "function")) then
            task.wait(0.1)
            vu483()
        end
    end)
    p596.CharacterRemoving:Connect(function(p597)
        if vu472 and p597 then
            vu472:Remove(p597)
        end
    end)
end)
vu5.PlayerRemoving:Connect(function(p598)
    if vu472 and p598.Character then
        vu472:Remove(p598.Character)
    end
    if vu12.mm2_playerESP and (vu12.mm2_playerESP.Value and (vu472 and typeof(vu483) == "function")) then
        vu483()
    end
end)
local v599 = vu5
local v600, v601, v602 = ipairs(vu5.GetPlayers(v599))
local vu603 = vu4
local vu604 = vu24
local vu605 = vu472
while true do
    local v606
    v602, v606 = v600(v601, v602)
    if v602 == nil then
        break
    end
    v606.CharacterAdded:Connect(function(_)
        if vu12.mm2_playerESP and (vu12.mm2_playerESP.Value and (vu605 and typeof(vu483) == "function")) then
            task.wait(0.1)
            vu483()
        end
    end)
    v606.CharacterRemoving:Connect(function(p607)
        if vu605 and p607 then
            vu605:Remove(p607)
        end
    end)
end
workspace.DescendantAdded:Connect(function(p608)
    if vu605 then
        if vu12.mm2_trapDetection and (vu12.mm2_trapDetection.Value and (p608.Name == "Trap" and p608.Parent)) and p608.Parent:IsDescendantOf(workspace) then
            p608.Transparency = 0
            vu605:Add(p608, {
                AccentColor = Color3.fromRGB(255, 100, 0),
                ShowLabel = true,
                LabelText = "Trap",
                GroupName = "mm2_traps"
            })
            vu604.Notify("Murderer placed a trap!", "Alert", 3)
        end
        if p608.Name == "GunDrop" and p608:IsA("BasePart") then
            if vu12.mm2_gunDropESP and vu12.mm2_gunDropESP.Value then
                vu605:Add(p608, {
                    AccentColor = Color3.new(0.95, 1, 0.07),
                    ArrowShow = true,
                    ArrowMinDistance = 99999,
                    ArrowSize = UDim2.new(0, 30, 0, 30),
                    LabelText = "Dropped Gun!",
                    ShowLabel = true,
                    GroupName = "mm2_gun"
                })
                vu604.Notify("Gun has been dropped!", "Alert")
            end
            if vu12.mm2_autoGetGun_toggle_farm and vu12.mm2_autoGetGun_toggle_farm.Value then
                vu604.Notify("Dropped gun detected, attempting auto-pickup...", "Auto", 2)
                task.spawn(function()
                    vu604.pickupGun()
                end)
            end
        end
        if vu12.mm2_ignoreKnifeThrows_toggle and (vu12.mm2_ignoreKnifeThrows_toggle.Value and p608.Name == "ThrowingKnife") then
            p608:Destroy()
            vu604.Notify("Blocked a knife throw!", "Protection", 2)
        end
    end
end)
workspace.DescendantRemoving:Connect(function(p609)
    if vu605 then
        local v610 = vu605:GetGroupTargets("mm2_traps")
        if p609.Name == "Trap" and table.find(v610, p609) then
            vu605:Remove(p609)
        end
        local v611 = vu605:GetGroupTargets("mm2_gun")
        if p609.Name == "GunDrop" and table.find(v611, p609) then
            vu605:Remove(p609)
            vu604.Notify("Dropped gun picked up.", "Alert")
            task.wait(0.5)
            local v612 = vu360("Sheriff") or vu360("Hero")
            if v612 then
                vu604.Notify("New Sheriff/Hero: " .. v612.Name, "Alert")
            end
            if vu603(vu483) == "function" then
                vu483()
            end
        end
    end
end)
workspace.ChildAdded:Connect(function(p613)
    if vu12.mm2_ignoreKnifeThrows_toggle and (vu12.mm2_ignoreKnifeThrows_toggle.Value and p613.Name == "ThrowingKnife") then
        p613:Destroy()
        vu604.Notify("Blocked a knife throw!", "Protection", 2)
    end
end)
v347:SelectTab(1)
task.spawn(vu187)
vu1:Notify({
    Title = "Soluna",
    Content = "Soluna Script Loaded! Safe Zone feature added.",
    Duration = 5
})
if vu12.mm2_playerESP and vu12.mm2_playerESP.Value then
    task.wait(0.5)
    vu483()
end
if vu12.mm2_gunDropESP and (vu12.mm2_gunDropESP.Value and vu605) then
    local v614 = getMap()
    if v614 then
        local v615, v616, v617 = ipairs(v614:GetChildren())
        while true do
            local v618, v619 = v615(v616, v617)
            if v618 == nil then
                break
            end
            v617 = v618
            if v619.Name == "GunDrop" then
                vu605:Add(v619, {
                    AccentColor = Color3.new(0.95, 1, 0.07),
                    ArrowShow = true,
                    ArrowMinDistance = 99999,
                    ArrowSize = UDim2.new(0, 30, 0, 30),
                    LabelText = "Dropped Gun!",
                    ShowLabel = true,
                    GroupName = "mm2_gun"
                })
            end
        end
    end
end
if vu12.mm2_trapDetection and (vu12.mm2_trapDetection.Value and vu605) then
    local v620, v621, v622 = ipairs(workspace:GetDescendants())
    while true do
        local v623, v624 = v620(v621, v622)
        if v623 == nil then
            break
        end
        v622 = v623
        if v624.Name == "Trap" and v624.Parent and v624.Parent:IsDescendantOf(workspace) then
            v624.Transparency = 0
            vu605:Add(v624, {
                AccentColor = Color3.fromRGB(255, 100, 0),
                ShowLabel = true,
                LabelText = "Trap",
                GroupName = "mm2_traps"
            })
        end
    end
end
v2:SetLibrary(vu1)
v3:SetLibrary(vu1)
v2:IgnoreThemeSettings()
v2:SetIgnoreIndexes({})
v3:SetFolder("Soluna")
v2:SetFolder("Soluna/Murder Mystery 2")
v3:BuildInterfaceSection(v348.Settings)
v2:BuildConfigSection(v348.Settings)
v2:LoadAutoloadConfig()
