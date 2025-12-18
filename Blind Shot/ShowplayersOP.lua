--[[ 
such a simple script
https://scriptblox.com/script/Blind-Shot-Show-players-OP-75953

Script by Succuh (https://scriptblox.com/u/Succuh)
]]
local vu1 = game:GetService("Players")
local v2 = game:GetService("RunService")
local v3 = game:GetService("UserInputService")
game:GetService("TweenService")
local vu4 = game:GetService("ReplicatedStorage")
local vu5 = game:GetService("CoreGui")
local vu6 = vu1.LocalPlayer
local v7 = workspace.CurrentCamera
local vu8 = {
    laserLen = 55,
    laserWidth = 0.25,
    laserGlow = 0.75,
    laserColor = Color3.fromRGB(255, 0, 0),
    headBoxColor = Color3.fromRGB(255, 0, 255),
    revealColor = Color3.fromRGB(255, 0, 255),
    boxTransparency = 0
}
local vu9 = {
    laser = false,
    headBox = false,
    reveal = false
}
local vu10 = Instance.new("ScreenGui")
vu10.Name = "BlindShot OP"
pcall(function()
    vu10.Parent = vu5
end)
if not vu10.Parent then
    vu10.Parent = vu6:WaitForChild("PlayerGui")
end
local vu11 = Instance.new("ImageLabel")
vu11.Parent = vu10
vu11.Size = UDim2.new(0, 250, 0, 220)
vu11.Position = UDim2.new(0.1, 0, 0.1, 0)
vu11.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
vu11.BorderSizePixel = 2
vu11.BorderColor3 = Color3.fromRGB(255, 0, 0)
vu11.Image = ""
vu11.ScaleType = Enum.ScaleType.Slice
local v12 = Instance.new("Frame")
v12.Parent = vu11
v12.Size = UDim2.new(1, 0, 0, 25)
v12.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
v12.BackgroundTransparency = 0.5
local v13 = Instance.new("TextLabel")
v13.Parent = v12
v13.Size = UDim2.new(0.8, 0, 1, 0)
v13.BackgroundTransparency = 1
v13.Font = Enum.Font.Code
v13.TextSize = 14
v13.TextColor3 = Color3.new(1, 1, 1)
v13.Text = "KUPALZ ESP"
local vu14 = Instance.new("TextButton")
vu14.Parent = v12
vu14.Size = UDim2.new(0.15, 0, 1, 0)
vu14.Position = UDim2.new(0.85, 0, 0, 0)
vu14.Text = "-"
vu14.Font = Enum.Font.Code
vu14.TextSize = 18
vu14.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
vu14.BackgroundTransparency = 0.5
vu14.TextColor3 = Color3.new(1, 1, 1)
local vu15 = Instance.new("Frame")
vu15.Parent = vu11
vu15.Position = UDim2.new(0, 0, 0, 30)
vu15.Size = UDim2.new(1, 0, 1, - 30)
vu15.BackgroundTransparency = 1
local function v22(pu16, p17, pu18, pu19)
    local vu20 = Instance.new("TextButton")
    vu20.Parent = vu15
    vu20.Size = UDim2.new(0.9, 0, 0, 30)
    vu20.Position = UDim2.new(0.05, 0, 0.05 + p17 * 0.22, 0)
    vu20.Font = Enum.Font.Code
    vu20.TextSize = 14
    vu20.TextColor3 = Color3.new(1, 1, 1)
    vu20.BackgroundTransparency = 0.3
    local function vu21()
        vu20.Text = pu16 .. ": " .. (vu9[pu18] and "ON" or "OFF")
        vu20.BackgroundColor3 = vu9[pu18] and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(50, 50, 50)
    end
    vu21()
    vu20.MouseButton1Click:Connect(function()
        vu9[pu18] = not vu9[pu18]
        vu21()
        if pu19 then
            pu19()
        end
    end)
    return vu20
end
local function v24()
    if vu9.reveal then
        local v23 = vu4:FindFirstChild("invisivel")
        if v23 then
            v23:FireServer(false)
        else
            warn("invisivel remote missing")
        end
    end
end
v22("HEAD LASER", 0, "laser")
v22("HEAD BOX", 1, "headBox")
v22("SHOW PLAYERS", 2, "reveal", v24)
local vu25 = nil
local vu26 = nil
local vu27 = nil
v12.InputBegan:Connect(function(p28)
    if p28.UserInputType == Enum.UserInputType.MouseButton1 then
        vu25 = true
        vu26 = p28.Position
        vu27 = vu11.Position
    end
end)
v3.InputChanged:Connect(function(p29)
    if vu25 and p29.UserInputType == Enum.UserInputType.MouseMovement then
        local v30 = p29.Position - vu26
        vu11.Position = UDim2.new(vu27.X.Scale, vu27.X.Offset + v30.X, vu27.Y.Scale, vu27.Y.Offset + v30.Y)
    end
end)
v3.InputEnded:Connect(function(p31)
    if p31.UserInputType == Enum.UserInputType.MouseButton1 then
        vu25 = false
    end
end)
local vu32 = false
vu14.MouseButton1Click:Connect(function()
    vu32 = not vu32
    if vu32 then
        vu15.Visible = false
        vu14.Text = "+"
        vu11:TweenSize(UDim2.new(0, 250, 0, 25), "Out", "Quad", 0.25, true)
    else
        vu11:TweenSize(UDim2.new(0, 250, 0, 220), "Out", "Quad", 0.25, true)
        task.delay(0.15, function()
            vu15.Visible = true
        end)
        vu14.Text = "-"
    end
end)
local vu33 = Instance.new("Folder")
vu33.Name = "KupalzVisuals"
vu33.Parent = v7
local vu34 = {}
local vu35 = CFrame.new(0, - 9999, 0)
local function vu40(_)
    local v36 = Instance.new("Attachment", vu33)
    local v37 = Instance.new("Attachment", vu33)
    local v38 = Instance.new("Beam")
    v38.Attachment0 = v36
    v38.Attachment1 = v37
    v38.Width0 = vu8.laserWidth
    v38.Width1 = vu8.laserWidth
    v38.Color = ColorSequence.new(vu8.laserColor)
    v38.LightEmission = vu8.laserGlow
    v38.FaceCamera = true
    v38.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1)
    })
    v38.Parent = vu33
    local v39 = Instance.new("Part")
    v39.Anchored = true
    v39.CanCollide = false
    v39.Material = Enum.Material.Neon
    v39.Size = Vector3.new(1.3, 1.3, 1.3)
    v39.Color = vu8.headBoxColor
    v39.Transparency = vu8.boxTransparency
    v39.CastShadow = false
    v39.CFrame = vu35
    v39.Parent = vu33
    return {
        a0 = v36,
        a1 = v37,
        beam = v38,
        box = v39
    }
end
v2.RenderStepped:Connect(function()
    local v41 = vu1
    local v42, v43, v44 = ipairs(v41:GetPlayers())
    while true do
        local v45
        v44, v45 = v42(v43, v44)
        if v44 == nil then
            break
        end
        if v45 ~= vu6 then
            vu34[v45] = vu34[v45] or vu40(v45)
            local v46 = vu34[v45]
            local v47 = v45.Character
            local v48
            if v47 then
                v48 = v47:FindFirstChild("Head")
            else
                v48 = v47
            end
            if v48 then
                if vu9.laser then
                    v46.a0.WorldPosition = v48.Position
                    v46.a1.WorldPosition = v48.Position + v48.CFrame.LookVector * vu8.laserLen
                    v46.beam.Enabled = true
                else
                    v46.beam.Enabled = false
                end
                if vu9.headBox then
                    v46.box.CFrame = v48.CFrame
                else
                    v46.box.CFrame = vu35
                end
                if vu9.reveal then
                    local v49, v50, v51 = ipairs(v47:GetChildren())
                    while true do
                        local v52
                        v51, v52 = v49(v50, v51)
                        if v51 == nil then
                            break
                        end
                        if v52:IsA("BasePart") and v52.Transparency > 0.5 then
                            v52.Transparency = 0
                            v52.Material = Enum.Material.ForceField
                            v52.Color = vu8.revealColor
                        end
                    end
                end
            else
                v46.beam.Enabled = false
                v46.box.CFrame = vu35
            end
        end
    end
end)
vu1.PlayerRemoving:Connect(function(p53)
    local v54 = vu34[p53]
    if v54 then
        local v55, v56, v57 = pairs(v54)
        while true do
            local v58
            v57, v58 = v55(v56, v57)
            if v57 == nil then
                break
            end
            v58:Destroy()
        end
        vu34[p53] = nil
    end
end)
v24()
