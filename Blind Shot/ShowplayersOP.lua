--[[
    Original Script: Blind Shot Show players OP
    Source: https://scriptblox.com/script/Blind-Shot-Show-players-OP-75953
    Author: Succuh (https://scriptblox.com/u/Succuh)
	Cracked by: SouljaWitchSrc

    This script shows where players are facing/show invisible players
	(Head Laser, Head Box, Show Players)

    -- Refactored for readability --
]]

--// Services //--
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local coreGui = game:GetService("CoreGui")

--// Local Player & Camera //--
local localPlayer = playersService.LocalPlayer
local camera = workspace.CurrentCamera

--// Configuration Settings //--
local settings = {
    laserLength = 55,
    laserWidth = 0.25,
    laserGlow = 0.75,
    laserColor = Color3.fromRGB(255, 0, 0),
    headBoxColor = Color3.fromRGB(255, 0, 255),
    revealColor = Color3.fromRGB(255, 0, 255),
    boxTransparency = 0
}

--// Feature Toggles //--
local toggles = {
    laser = false,
    headBox = false,
    reveal = false
}

--// Main GUI Setup //--
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "BlindShot OP Refactored"
-- Attempt to parent to CoreGui, otherwise fallback to PlayerGui
pcall(function()
    mainGui.Parent = coreGui
end)
if not mainGui.Parent then
    mainGui.Parent = localPlayer:WaitForChild("PlayerGui")
end

--// Main Window Frame //--
local mainFrame = Instance.new("ImageLabel")
mainFrame.Parent = mainGui
mainFrame.Size = UDim2.new(0, 250, 0, 220)
mainFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
mainFrame.Image = ""
mainFrame.ScaleType = Enum.ScaleType.Slice

--// Title Bar //--
local titleBar = Instance.new("Frame")
titleBar.Parent = mainFrame
titleBar.Size = UDim2.new(1, 0, 0, 25)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
titleBar.BackgroundTransparency = 0.5

local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = titleBar
titleLabel.Size = UDim2.new(0.8, 0, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.Code
titleLabel.TextSize = 14
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Text = "KUPALZ ESP"

--// Minimize/Maximize Button //--
local minimizeButton = Instance.new("TextButton")
minimizeButton.Parent = titleBar
minimizeButton.Size = UDim2.new(0.15, 0, 1, 0)
minimizeButton.Position = UDim2.new(0.85, 0, 0, 0)
minimizeButton.Text = "-"
minimizeButton.Font = Enum.Font.Code
minimizeButton.TextSize = 18
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
minimizeButton.BackgroundTransparency = 0.5
minimizeButton.TextColor3 = Color3.new(1, 1, 1)

--// Options Container Frame //--
local optionsContainer = Instance.new("Frame")
optionsContainer.Parent = mainFrame
optionsContainer.Position = UDim2.new(0, 0, 0, 30)
optionsContainer.Size = UDim2.new(1, 0, 1, -30)
optionsContainer.BackgroundTransparency = 1

--// Function to create a toggle button //--
local function createToggleButton(buttonText, index, toggleKey, callback)
    local button = Instance.new("TextButton")
    button.Parent = optionsContainer
    button.Size = UDim2.new(0.9, 0, 0, 30)
    button.Position = UDim2.new(0.05, 0, 0.05 + index * 0.22, 0)
    button.Font = Enum.Font.Code
    button.TextSize = 14
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundTransparency = 0.3

    local function updateButtonState()
        button.Text = buttonText .. ": " .. (toggles[toggleKey] and "ON" or "OFF")
        button.BackgroundColor3 = toggles[toggleKey] and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(50, 50, 50)
    end

    updateButtonState() -- Set initial state

    button.MouseButton1Click:Connect(function()
        toggles[toggleKey] = not toggles[toggleKey]
        updateButtonState()
        if callback then
            callback()
        end
    end)
    return button
end

--// Function to reveal invisible players //--
local function revealInvisiblePlayers()
    if toggles.reveal then
        local revealRemote = replicatedStorage:FindFirstChild("invisivel")
        if revealRemote then
            revealRemote:FireServer(false)
        else
            warn("'invisivel' remote event is missing in ReplicatedStorage")
        end
    end
end

-- Create the buttons
createToggleButton("HEAD LASER", 0, "laser")
createToggleButton("HEAD BOX", 1, "headBox")
createToggleButton("SHOW PLAYERS", 2, "reveal", revealInvisiblePlayers)

--// GUI Dragging Logic //--
local isDragging = false
local dragStart
local frameStart

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStart = input.Position
        frameStart = mainFrame.Position
    end
end)

userInputService.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(frameStart.X.Scale, frameStart.X.Offset + delta.X, frameStart.Y.Scale, frameStart.Y.Offset + delta.Y)
    end
end)

userInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

--// GUI Minimize/Maximize Logic //--
local isMinimized = false
minimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        optionsContainer.Visible = false
        minimizeButton.Text = "+"
        mainFrame:TweenSize(UDim2.new(0, 250, 0, 25), "Out", "Quad", 0.25, true)
    else
        mainFrame:TweenSize(UDim2.new(0, 250, 0, 220), "Out", "Quad", 0.25, true)
        task.delay(0.15, function()
            optionsContainer.Visible = true
        end)
        minimizeButton.Text = "-"
    end
end)

--// Visuals Management //--
local visualsFolder = Instance.new("Folder")
visualsFolder.Name = "KupalzVisuals"
visualsFolder.Parent = camera

local playerVisuals = {}
local offscreenCFrame = CFrame.new(0, -9999, 0)

-- Function to create visual elements for a player
local function createVisualsForPlayer(player)
    local attachment0 = Instance.new("Attachment", visualsFolder)
    local attachment1 = Instance.new("Attachment", visualsFolder)

    local beam = Instance.new("Beam")
    beam.Attachment0 = attachment0
    beam.Attachment1 = attachment1
    beam.Width0 = settings.laserWidth
    beam.Width1 = settings.laserWidth
    beam.Color = ColorSequence.new(settings.laserColor)
    beam.LightEmission = settings.laserGlow
    beam.FaceCamera = true
    beam.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(1, 1)
    })
    beam.Parent = visualsFolder

    local headBoxPart = Instance.new("Part")
    headBoxPart.Anchored = true
    headBoxPart.CanCollide = false
    headBoxPart.Material = Enum.Material.Neon
    headBoxPart.Size = Vector3.new(1.3, 1.3, 1.3)
    headBoxPart.Color = settings.headBoxColor
    headBoxPart.Transparency = settings.boxTransparency
    headBoxPart.CastShadow = false
    headBoxPart.CFrame = offscreenCFrame
    headBoxPart.Parent = visualsFolder

    return {
        beamAttachment0 = attachment0,
        beamAttachment1 = attachment1,
        beam = beam,
        box = headBoxPart
    }
end

--// Main Render Loop //--
runService.RenderStepped:Connect(function()
    for _, player in ipairs(playersService:GetPlayers()) do
        if player ~= localPlayer then
            -- Create visuals for the player if they don't exist
            if not playerVisuals[player] then
                playerVisuals[player] = createVisualsForPlayer(player)
            end

            local visuals = playerVisuals[player]
            local character = player.Character
            local head = character and character:FindFirstChild("Head")

            if head then
                -- Update laser
                if toggles.laser then
                    visuals.beamAttachment0.WorldPosition = head.Position
                    visuals.beamAttachment1.WorldPosition = head.Position + head.CFrame.LookVector * settings.laserLength
                    visuals.beam.Enabled = true
                else
                    visuals.beam.Enabled = false
                end

                -- Update head box
                if toggles.headBox then
                    visuals.box.CFrame = head.CFrame
                else
                    visuals.box.CFrame = offscreenCFrame
                end

                -- Update player visibility (reveal)
                if toggles.reveal then
                    for _, part in ipairs(character:GetChildren()) do
                        if part:IsA("BasePart") and part.Transparency > 0.5 then
                            part.Transparency = 0
                            part.Material = Enum.Material.ForceField
                            part.Color = settings.revealColor
                        end
                    end
                end
            else
                -- Hide visuals if player has no head/character
                visuals.beam.Enabled = false
                visuals.box.CFrame = offscreenCFrame
            end
        end
    end
end)

--// Player Removal Cleanup //--
playersService.PlayerRemoving:Connect(function(player)
    local visuals = playerVisuals[player]
    if visuals then
        -- Destroy all visual parts associated with the player
        for _, visualPart in pairs(visuals) do
            visualPart:Destroy()
        end
        playerVisuals[player] = nil -- Remove from the table
    end
end)

-- Initial call to reveal players if the option is on by default
revealInvisiblePlayers()
