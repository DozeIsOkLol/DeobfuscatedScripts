--[[
 .____                  ________ ___.    _____                           __
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|
         \/          \/         \/    \/                \/     \/     \/
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib
Needs fixing
]]--
local VapaV2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Library = VapaV2:CreateLib("Vapa v2 - Arsenal", "DarkTheme")
local Combat = Library:NewTab("Combat")
local CombatSection = Combat:NewSection("Aimbot")
local Visuals = Library:NewTab("Visuals")
local VisualsSection = Visuals:NewSection("ESP")
local FOVSection = Visuals:NewSection("FOV")
local Other = Library:NewTab("Other")
local HitBoxSection = Other:NewSection("HitBox")
local WeaponSection = Other:NewSection("Weapon")
local PlayerSection = Other:NewSection("Player")
local TeleportSection = Other:NewSection("Teleport")
local Movement = Library:NewTab("Movenent")
local MovementSection = Movement:NewSection("Speed")
local FlySection = Movement:NewSection("Fly")
local TPSection = Movement:NewSection("Click TP")
local Misc = Library:NewTab("Misc")
local MiscSection = Misc:NewSection("GUI")
local Info = Library:NewTab("Info")
local InfoSection = Info:NewSection("Author")
local Aimgin = Library:NewTab("Aiming")
local AimginSection = Aimgin:NewSection("Aimbot_TeamCheck")
local Aimbot_TeamCheck = false
AimginSection:NewToggle("Aimbot_Draw_FOV", "Aimbot_Draw_FOV", (function(v)
	Aimbot_Draw_FOV = v
end))
AimginSection:NewSlider("Aimbot_FOV_Radius", "Aimbot_FOV_Radius", 250, 0, (function(v)
	Aimbot_FOV_Radius = v
end))
AimginSection:NewColorPicker("Aimbot_FOV_Color", "Aimbot_FOV_Color", Color3.fromRGB(255, 0, 0), (function(v)
	Aimbot_FOV_Color = v
end))
AimginSection:NewDropdown("Aimbot_AimPart", "Aimbot_AimPart", {
	"Head",
	"Body"
}, (function(v)
	Aimbot_AimPart = v
end))
CombatSection:NewToggle("WallCheck", "WallCheck", (function(v)
	WallCheck = v
end))
VisualsSection:NewToggle("ShowHealth", "ShowHealth", (function(v)
	ShowHealth = v
end))
VisualsSection:NewToggle("ShowTracers", "ShowTracers", (function(v)
	TracersThickness = v
end))
VisualsSection:NewSlider("TracersThickness", "TracersThickness", 1, 0, (function(v)
	TracersThickness = v
end))
VisualsSection:NewToggle("ShowNameTag", "ShowNameTag", (function(v)
	NameTagSize = v
end))
VisualsSection:NewSlider("NameTagSize", "NameTagSize", 14, 0, (function(v)
	NameTagSize = v
end))
Other:NewToggle("SoftAim", "SoftAim", (function(v)
	SoftAim = v
end))
HitBoxSection:NewSlider("HitBoxSize", "HitBoxSize", 4, 0, (function(v)
	HitBoxSize = v
end))
WeaponSection:NewToggle("Noclip", "Noclip", (function(v)
	Noclip = v
end))
Movement:NewSlider("FlySpeed", "FlySpeed", 10, 0, (function(v)
	FlySpeed = v
end))
MovementSection:NewToggle("CustomWalk", "CustomWalk", (function(v)
	CustomWalk = v
end))
MovementSection:NewSlider("CustomWalkSpeed", "CustomWalkSpeed", 16, 0, (function(v)
	CustomWalkSpeed = v
end))
MovementSection:NewDropdown("WalkSpeedMode", "WalkSpeedMode", {
	"None",
	"BHop"
}, (function(v)
	WalkSpeedMode = v
end))
PlayerSection:NewToggle("CustomJumpPower", "CustomJumpPower", (function(v)
	CustomJumpEnabled = v
end))
PlayerSection:NewSlider("infJump", "infJump", 50, 0, (function(v)
	infJump = v
end))
Movement:NewToggle("airWalk", "airWalk", (function(v)
	airWalk = v
end))
Movement:NewSlider("airWalkHeight", "airWalkHeight", 0, 0, (function(v)
	airWalkHeight = v
end))
TPSection:NewToggle("clickTP", "clickTP", (function(v)
	clickTP = v
end))
MiscSection:NewToggle("killAll", "killAll", (function(v)
	killAll = v
end))
MiscSection:NewToggle("Movementtrajectory", "Movementtrajectory", (function(v)
	Movementtrajectory = v
end))
MiscSection:NewToggle("Rotationbot", "Rotationbot", (function(v)
	Rotationbot = v
end))
MiscSection:NewSlider("RotationSpeed", "RotationSpeed", 10, 0, (function(v)
	RotationSpeed = v
end))
Aimbot_AimPart = "Body"
local Drawing = VapaV2.Drawing
local FovCircle = Drawing.new("Circle")
FovCircle.Visible = false
FovCircle.Radius = Aimbot_FOV_Radius
FovCircle.Color = Aimbot_FOV_Color
FovCircle.Thickness = 1
FovCircle.Filled = false
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect((function(input, gameProcessed)
	if gameProcessed then
		return
	end
end))
UserInputService.InputEnded:Connect((function(input, gameProcessed)
end))
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local workspace = game:GetService("workspace")
local CurrentCamera = workspace.CurrentCamera
local HumanoidRootPart = LocalPlayer.Character.HumanoidRootPart
Aimbot_AimPart = "RightFoot"
Aimgin:NewToggle("Aimbot", "Toggle Aimbot", (function(v)
	Aimbot = v
end))
Aimgin:NewToggle("Team Check", "Toggle Team Check", (function(v)
	Aimbot_TeamCheck = v
end))
RunService.RenderStepped:Connect((function()
	if Aimbot then
		local Target
		local Distance = 9999
		for i, v in ipairs(Players:GetPlayers()) do
			if v ~= LocalPlayer then
				local Character = v.Character
				if Character and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Humanoid") then
					local Humanoid = Character:FindFirstChild("Humanoid")
					if Humanoid.Health > 0 then
						local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
						local PlayerGui = v:FindFirstChild("PlayerGui")
						local IsOnScreen, Position = CurrentCamera:WorldToViewportPoint(HumanoidRootPart.Position)
						if IsOnScreen then
							local Magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude
							if Magnitude < Aimbot_FOV_Radius and Magnitude < Distance then
								if Aimbot_TeamCheck then
									if LocalPlayer.Team ~= v.Team then
										Distance = Magnitude
										Target = v
									end
								else
									Distance = Magnitude
									Target = v
								end
							end
						end
					end
				end
			end
		end
		if Aimbot and Target and UserInputService:IsKeyDown(Enum.KeyCode.X) then
			CurrentCamera.CFrame = CFrame.new(CurrentCamera.CFrame.Position, Target.Character[Aimbot_AimPart].Position)
		end
	end
end))
RunService.RenderStepped:Connect((function()
	if WallCheck then
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
		raycastParams.FilterDescendantsInstances = {
			LocalPlayer.Character
		}
		local raycastResult = workspace:Raycast(CurrentCamera.CFrame.Position, (Target.Character[Aimbot_AimPart].Position - CurrentCamera.CFrame.Position).Unit * 1000, raycastParams)
		if raycastResult and raycastResult.Instance and raycastResult.Instance:IsDescendantOf(Target.Character) then
			CurrentCamera.CFrame = CFrame.new(CurrentCamera.CFrame.Position, Target.Character[Aimbot_AimPart].Position)
		end
	end
end))
RunService.Heartbeat:Connect((function()
	if ShowHealth then
		for i, v in ipairs(Players:GetPlayers()) do
			if v ~= LocalPlayer then
				local Character = v.Character
				if Character and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Humanoid") and not Character:FindFirstChild("HealthDisplay") then
					local BillboardGui = Instance.new("BillboardGui")
					BillboardGui.Name = "HealthDisplay"
					BillboardGui.Parent = Character
					BillboardGui.Size = UDim2.new(1, 0, 1, 0)
					BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
					local TextLabel = Instance.new("TextLabel")
					TextLabel.Parent = BillboardGui
					TextLabel.Size = UDim2.new(1, 0, 1, 0)
					TextLabel.BackgroundTransparency = 1
					TextLabel.Text = tostring(math.floor(Character.Humanoid.Health))
					TextLabel.TextColor3 = Color3.new(1, 1, 1)
					TextLabel.TextSize = 14
					Character.Humanoid:GetPropertyChangedSignal("Health"):Connect((function()
						TextLabel.Text = tostring(math.floor(Character.Humanoid.Health))
					end))
				end
			end
		end
	end
end))
local TweenService = game:GetService("TweenService")
Movementtrajectory = false
Rotationbot = false
RotationSpeed = 10
local targetRotation = 0
local character = LocalPlayer.Character
local rootPart = character and character:FindFirstChild("HumanoidRootPart")
local humanoid = character and character:FindFirstChild("Humanoid")
local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.Parent = nil
BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
BodyVelocity.Velocity = Vector3.new(0, 0, 0)
local lighting = game:GetService("Lighting")
local originalAmbient = lighting.Ambient
local originalOutdoorAmbient = lighting.OutdoorAmbient
NightVision = false
MiscSection:NewToggle("Movement trajectory", "Toggle Movement trajectory", (function(v)
	Movementtrajectory = v
end))
MiscSection:NewToggle("Rotation bot", "Toggle Rotation bot", (function(v)
	Rotationbot = v
end))
MiscSection:NewSlider("Rotation Speed", "Change Rotation Speed", 10, 0, (function(v)
	RotationSpeed = v
end))
RunService.RenderStepped:Connect((function()
	FovCircle.Visible = Aimbot and Aimbot_Draw_FOV
	FovCircle.Radius = Aimbot_FOV_Radius
	FovCircle.Color = Aimbot_FOV_Color
	FovCircle.Position = Vector2.new(Mouse.X, Mouse.Y)
end))
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local workspace = game:GetService("workspace")
local Camera = workspace.CurrentCamera
MiscSection:NewButton("Hide GUI", "Hide GUI", (function()
	Library:Toggle()
end))
InfoSection:NewTextBox("Author", "Author", "BriefBason#1117 (Discord)")
InfoSection:NewTextBox("UI Lirary: Kavo", "UI Lirary: Kavo", "ENJOY :)")
VisualsSection:NewToggle("Movement trajectory", "Toggle Movement trajectory", (function(v)
	Movementtrajectory = v
end))
VisualsSection:NewToggle("Rotation bot", "Toggle Rotation bot", (function(v)
	Rotationbot = v
end))
VisualsSection:NewSlider("Rotation Speed", "Change Rotation Speed", 10, 0, (function(v)
	RotationSpeed = v
end))
VisualsSection:NewToggle("Night Vision", "Toggle night vision", (function(v)
	NightVision = v
end))
RunService.Heartbeat:Connect((function(step)
	if Rotationbot then
		targetRotation = targetRotation + RotationSpeed * step
		if rootPart then
			rootPart.CFrame = CFrame.new(rootPart.Position) * CFrame.Angles(0, math.rad(targetRotation), 0)
		end
	end
end))
RunService.RenderStepped:Connect((function()
	if NightVision then
		lighting.Ambient = Color3.new(1, 1, 1)
		lighting.OutdoorAmbient = Color3.new(1, 1, 1)
	else
		lighting.Ambient = originalAmbient
		lighting.OutdoorAmbient = originalOutdoorAmbient
	end
end))
WeaponSection:NewToggle("Unlimited Ammo", "Enables unlimited ammo", (function(v)
	UnlimitedAmmo = v
end))
WeaponSection:NewToggle("No Recoil", "Disables recoil", (function(v)
	NoRecoil = v
end))
WeaponSection:NewToggle("Rapid Fire", "Enables rapid fire", (function(v)
	RapidFire = v
end))
WeaponSection:NewToggle("Auto Gun", "Enables automatic firing", (function(v)
	AutoGun = v
end))
WeaponSection:NewToggle("Noclip", "Toggle Noclip", (function(v)
	Noclip = v
end))
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local player = Players.LocalPlayer
coroutine.wrap((function()
	while true do
		wait()
		if UnlimitedAmmo then
			local equippedWeapon = character:FindFirstChildOfClass("Tool")
			if equippedWeapon and equippedWeapon:FindFirstChild("Variables") and equippedWeapon.Variables:FindFirstChild("gun") then
				equippedWeapon.Variables.gun.Value = math.huge
			end
		end
	end
end))()
local originalCFrame
RunService.RenderStepped:Connect((function()
	local camera = workspace.CurrentCamera
	if NoRecoil then
		if not originalCFrame then
			originalCFrame = camera.CFrame
		end
		camera.CFrame = originalCFrame
	else
		originalCFrame = nil
	end
end))
local UserInputService = game:GetService("UserInputService")
local isFiring = false
UserInputService.InputBegan:Connect((function(input, gameProcessed)
	if RapidFire and not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
		isFiring = true
		while isFiring do
			game:GetService("VirtualUser"):ClickButton1(Vector2.new())
			wait(0.1)
		end
	end
end))
UserInputService.InputEnded:Connect((function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		isFiring = false
	end
end))
coroutine.wrap((function()
	while true do
		wait()
		if AutoGun then
			local equippedWeapon = character:FindFirstChildOfClass("Tool")
			if equippedWeapon then
				equippedWeapon:Activate()
			end
		end
	end
end))()
local noclipEnabled = false
local noclipConnection
local function setNoclipState(enabled)
	noclipEnabled = enabled
	if noclipEnabled then
		noclipConnection = RunService.Stepped:Connect((function()
			for _, part in ipairs(character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = false
				end
			end
		end))
	elseif noclipConnection then
		noclipConnection:Disconnect()
		noclipConnection = nil
	end
end
MovementSection:NewToggle("Fly", "Toggle Fly", (function(v)
	Fly = v
end))
MovementSection:NewSlider("FlySpeed", "Change Fly Speed", 100, 0, (function(v)
	FlySpeed = v
end))
MovementSection:NewToggle("WalkSpeed", "Toggle Custom Walk", (function(v)
	CustomWalk = v
end))
MovementSection:NewSlider("WalkSpeed", "Change Custom WalkSpeed", 16, 0, (function(v)
	CustomWalkSpeed = v
end))
MovementSection:NewDropdown("WalkSpeedMode", "WalkSpeedMode", {
	"None",
	"BHop"
}, (function(v)
	WalkSpeedMode = v
end))
PlayerSection:NewToggle("CustomJumpPower", "Toggle Custom JumpPower", (function(v)
	CustomJumpEnabled = v
end))
PlayerSection:NewSlider("CustomJumpPower", "Change Custom JumpPower", 50, 0, (function(v)
	CustomJumpPower = v
end))
MovementSection:NewToggle("infJump", "Toggle infJump", (function(v)
	infJump = v
end))
MovementSection:NewToggle("airWalk", "Toggle airWalk", (function(v)
	airWalk = v
end))
MovementSection:NewSlider("airWalkHeight", "airWalkHeight", 0, 0, (function(v)
	airWalkHeight = v
end))
TPSection:NewToggle("clickTP", "Toggle clickTP", (function(v)
	clickTP = v
end))
MiscSection:NewToggle("killAll", "Toggle killAll", (function(v)
	killAll = v
end))
coroutine.wrap((function()
	while wait() do
		pcall((function()
			if killAll then
				for i, v in ipairs(Players:GetChildren()) do
					if v ~= LocalPlayer then
						local character = v.Character
						if character and character:FindFirstChild("Humanoid") then
							character.Humanoid.Health = 0
						end
					end
				end
			end
		end))
	end
end))()
local UserInputService = game:GetService("UserInputService")
local flyEnabled = false
local flyUp = false
local flyDown = false
local flyForward = false
local flyBackward = false
local flyLeft = false
local flyRight = false
local flyVelocity = Vector3.new(0, 0, 0)
UserInputService.InputBegan:Connect((function(input)
	if input.KeyCode == Enum.KeyCode.W then
		flyForward = true
	elseif input.KeyCode == Enum.KeyCode.S then
		flyBackward = true
	elseif input.KeyCode == Enum.KeyCode.A then
		flyLeft = true
	elseif input.KeyCode == Enum.KeyCode.D then
		flyRight = true
	elseif input.KeyCode == Enum.KeyCode.Space then
		flyUp = true
	elseif input.KeyCode == Enum.KeyCode.LeftControl then
		flyDown = true
	end
end))
UserInputService.InputEnded:Connect((function(input)
	if input.KeyCode == Enum.KeyCode.W then
		flyForward = false
	elseif input.KeyCode == Enum.KeyCode.S then
		flyBackward = false
	elseif input.KeyCode == Enum.KeyCode.A then
		flyLeft = false
	elseif input.KeyCode == Enum.KeyCode.D then
		flyRight = false
	elseif input.KeyCode == Enum.KeyCode.Space then
		flyUp = false
	elseif input.KeyCode == Enum.KeyCode.LeftControl then
		flyDown = false
	end
end))
RunService.Heartbeat:Connect((function()
	if flyEnabled then
		local direction = Vector3.new()
		if flyForward then
			direction = direction + Camera.CFrame.LookVector
		end
		if flyBackward then
			direction = direction - Camera.CFrame.LookVector
		end
		if flyLeft then
			direction = direction - Camera.CFrame.RightVector
		end
		if flyRight then
			direction = direction + Camera.CFrame.RightVector
		end
		if flyUp then
			direction = direction + Vector3.new(0, 1, 0)
		end
		if flyDown then
			direction = direction - Vector3.new(0, 1, 0)
		end
		flyVelocity = direction.Unit * FlySpeed
		if character and character:FindFirstChild("HumanoidRootPart") then
			character.HumanoidRootPart.Velocity = flyVelocity
		end
	end
end))
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local originalWalkSpeed = humanoid.WalkSpeed
local originalJumpPower = humanoid.JumpPower
RunService.Heartbeat:Connect((function()
	if CustomWalk then
		humanoid.WalkSpeed = CustomWalkSpeed
	else
		humanoid.WalkSpeed = originalWalkSpeed
	end
	if WalkSpeedMode == "BHop" and humanoid:GetState() == Enum.HumanoidStateType.Running then
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end))
RunService.Heartbeat:Connect((function()
	if CustomJumpEnabled then
		humanoid.JumpPower = CustomJumpPower
	else
		humanoid.JumpPower = originalJumpPower
	end
end))
local isJumping = false
local function onJumpRequest()
	if infJump and humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then
		isJumping = true
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		isJumping = false
	end
end
humanoid.Jumping:Connect(onJumpRequest)
local airWalkConnection
local function setAirWalk(enabled)
	if enabled then
		airWalkConnection = RunService.Stepped:Connect((function()
			if humanoid:GetState() == Enum.HumanoidStateType.Freefall then
				local rootPart = character:FindFirstChild("HumanoidRootPart")
				if rootPart then
					rootPart.Velocity = Vector3.new(rootPart.Velocity.X, airWalkHeight, rootPart.Velocity.Z)
				end
			end
		end))
	elseif airWalkConnection then
		airWalkConnection:Disconnect()
		airWalkConnection = nil
	end
end
local Mouse = player:GetMouse()
Mouse.Button1Down:Connect((function()
	if clickTP then
		local hit = Mouse.Hit
		if hit then
			character:SetPrimaryPartCFrame(hit)
		end
	end
end))
for i, v in ipairs(workspace:GetDescendants()) do
	if v:IsA("BasePart") and v.Name == "HitBox" then
		v.Size = Vector3.new(HitBoxSize, HitBoxSize, HitBoxSize)
	end
end
local UserInputService = game:GetService("UserInputService")
local Keybind = Enum.KeyCode.P
local function onInputBegan(input)
	if input.KeyCode == Keybind then
		VapaV2:Toggle()
	end
end
UserInputService.InputBegan:Connect(onInputBegan)
