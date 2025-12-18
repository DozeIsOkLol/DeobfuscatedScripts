-- ts file was generated at discord.gg/25ms


local vu1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagessus/WindUI/main/main.lua"))()
local v2 = game:GetService("Players")
local vu3 = game:GetService("RunService")
local v4 = game:GetService("StarterGui")
game:GetService("TweenService")
local vu5 = game:GetService("UserInputService")
local vu6 = v2.LocalPlayer
v4:SetCore("SendNotification", {
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Ozen Hub - Loading",
    Text = "Premium Universal Script Hub initializing...",
    Duration = 4,
    Icon = "rbxthumb://type=AvatarHeadShot&id=" .. vu6.UserId .. "&w=150&h=150"
})
vu1.TransparencyValue = 0.1
local v7 = vu1
vu1.SetTheme(v7, "Dark")
local v8 = vu1
local vu9 = vu1.CreateWindow(v8, {
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Ozen Hub",
    Icon = "sparkles",
    Author = "25+ GAMES SUPPORTED",
    Folder = "OzenHub",
    Size = UDim2.fromOffset(650, 550),
    Theme = "Dark",
    HidePanelBackground = false,
    Acrylic = true,
    HideSearchBar = false,
    SideBarWidth = 220,
    BackgroundImage = "rbxassetid://9997192723",
    BackgroundImageTransparency = 0.8
})
local function vu14(p10, p11, p12, p13)
    vu1:Notify({
        Title = p10,
        Content = p11,
        Duration = p12 or 4,
        Icon = p13 or "check-circle"
    })
end
local function vu23(p15, pu16, p17, p18)
    vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Loading...", p15 .. " is being loaded...", 2)
    local v21, v22 = pcall(function()
        local v19 = game:HttpGet(pu16, true)
        if not v19 or v19 == "" then
            error("\226\157\140 Empty script content received")
        end
        local v20 = loadstring(v19)
        if not v20 then
            error("\226\157\140 Failed to compile script")
        end
        v20()
        return true
    end)
    if v21 then
        vu14("\226\156\133 " .. p15, "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 " .. p17 .. "\n\226\156\168 Successfully loaded for " .. p18, 5, "rocket")
    else
        vu14("\226\157\140 " .. p15, "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Failed to load: " .. tostring(v22), 6, "alert-triangle")
    end
end
local function v26(p24, pu25)
    p24:Button({
        Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Aham Hub Script",
        Desc = "Universal script for " .. pu25 .. " - 25+ games support",
        Icon = "cpu",
        Callback = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-AHAM-HUB-52379"))()
            vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Aham Hub", "Loaded Aham Hub for " .. pu25 .. "!", 4, "cpu")
        end
    })
    p24:Button({
        Title = "\226\154\161 YARHM Script",
        Desc = "Universal script for " .. pu25 .. " - All games support",
        Icon = "zap",
        Callback = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-YARHM-12403"))()
            vu14("\226\154\161 YARHM", "Loaded YARHM for " .. pu25 .. "!", 4, "zap")
        end
    })
end
local function v33(p27, pu28, pu29, pu30, pu31, p32)
    p27:Button({
        Title = p32 .. " " .. pu28,
        Desc = pu29,
        Icon = "external-link",
        Callback = function()
            vu23(pu28, pu30, pu29, pu31)
        end
    })
end
local v34 = vu9
local v35 = vu9.Tab(v34, {
    Icon = "home",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Home"
})
local v36 = vu9
local v37 = vu9.Tab(v36, {
    Icon = "trending-up",
    Title = "\226\173\144 Popular Games"
})
local v38 = vu9
local v39 = vu9.Tab(v38, {
    Icon = "swords",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\184\143 Murder Mystery 2"
})
local v40 = vu9
local v41 = vu9.Tab(v40, {
    Icon = "sword",
    Title = "\226\154\148\239\184\143 Blade Ball"
})
local v42 = vu9
local v43 = vu9.Tab(v42, {
    Icon = "bed",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\184\143 BedWars"
})
local v44 = vu9
local v45 = vu9.Tab(v44, {
    Icon = "brain",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Steal a Brainrot"
})
local v46 = vu9
local v47 = vu9.Tab(v46, {
    Icon = "trophy",
    Title = "\226\154\148\239\184\143 Rivals"
})
local v48 = vu9
local v49 = vu9.Tab(v48, {
    Icon = "target",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 HyperShot"
})
local v50 = vu9
local v51 = vu9.Tab(v50, {
    Icon = "sprout",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Grow a Garden"
})
local v52 = vu9
local v53 = vu9.Tab(v52, {
    Icon = "door-closed",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Doors"
})
local v54 = vu9
local v55 = vu9.Tab(v54, {
    Icon = "users",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Arise Crossover"
})
local v56 = vu9
local v57 = vu9.Tab(v56, {
    Icon = "crosshair",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Arsenal"
})
local v58 = vu9
local v59 = vu9.Tab(v58, {
    Icon = "ship",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Blox Fruits"
})
local v60 = vu9
local v61 = vu9.Tab(v60, {
    Icon = "castle",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Build ur Base"
})
local v62 = vu9
local v63 = vu9.Tab(v62, {
    Icon = "leaf",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Plants Vs Brainrots"
})
local v64 = vu9
local v65 = vu9.Tab(v64, {
    Icon = "fish",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Fish It!"
})
local v66 = vu9
local v67 = vu9.Tab(v66, {
    Icon = "city",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 BrookHavenRP"
})
local v68 = vu9
local v69 = vu9.Tab(v68, {
    Icon = "tree",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Cut Trees"
})
local v70 = vu9
local v71 = vu9.Tab(v70, {
    Icon = "gun",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Murderers VS Sheriffs"
})
local v72 = vu9
local v73 = vu9.Tab(v72, {
    Icon = "train",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Dead Rails"
})
local v74 = vu9
local v75 = vu9.Tab(v74, {
    Icon = "map-pin",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 DaHood"
})
local v76 = vu9
local v77 = vu9.Tab(v76, {
    Icon = "dragon",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Anime Eternal"
})
local v78 = vu9
local v79 = vu9.Tab(v78, {
    Icon = "skull",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Forsaken"
})
local v80 = vu9
local v81 = vu9.Tab(v80, {
    Icon = "heart",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Adopt Me!"
})
local v82 = vu9
local v83 = vu9.Tab(v82, {
    Icon = "pen-tool",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\184\143 Ink Game"
})
local v84 = vu9
local v85 = vu9.Tab(v84, {
    Icon = "fist",
    Title = "\226\156\139 The Strongest Battlegrounds"
})
local v86 = vu9
local v87 = vu9.Tab(v86, {
    Icon = "tree",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 99 Nights In The Forest"
})
local v88 = vu9
local v89 = vu9.Tab(v88, {
    Icon = "paw-print",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Pet Simulator 99"
})
local v90 = vu9
local v91 = vu9.Tab(v90, {
    Icon = "gamepad",
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Other Games"
})
local v92 = vu9
local v93 = vu9.Tab(v92, {
    Icon = "tool",
    Title = "\226\154\153\239\184\143 Tools"
})
local v94 = vu9
local v95 = vu9.Tab(v94, {
    Icon = "settings",
    Title = "\226\154\161 Settings"
})
v35:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Welcome to Ozen Hub",
    TextSize = 22
})
v35:Divider()
v35:Paragraph({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Ozen Hub - Universal Script Hub",
    Desc = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Premium scripts for your favorite games!\n\226\156\168 No keys required \226\128\162 Regular updates \226\128\162 Best performance"
})
v35:Paragraph({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 User Info",
    Desc = "Welcome, " .. vu6.Name .. "!\n\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Ready to enhance your gaming experience!"
})
v35:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Quick Stats",
    TextSize = 18
})
v35:Divider()
local vu96 = v35:Paragraph({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Loading statistics...",
    Desc = "Ozen Hub - Premium Performance"
})
spawn(function()
    while true do
        local v97 = math.round(1 / vu3.RenderStepped:Wait())
        local v98 = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
        local v99 = math.round(game:GetService("Stats"):GetMemoryUsageMbForTag(Enum.DeveloperMemoryType.Script))
        vu96:Set({
            Title = string.format("\226\154\161 %d FPS | \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 %d ms | \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 %d MB", v97, v98, v99),
            Desc = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Ozen Hub - Running Smoothly"
        })
        wait(2)
    end
end)
v35:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Quick Actions",
    TextSize = 18
})
v35:Divider()
v35:Button({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Join Discord",
    Desc = "Join our community for updates and support!",
    Icon = "users",
    Callback = function()
        setclipboard("https://discord.gg/pNfrgHeede")
        vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Discord", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Invite link copied to clipboard!", 4, "users")
    end
})
v35:Button({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Refresh Hub",
    Desc = "Reload the hub for latest updates",
    Icon = "refresh-cw",
    Callback = function()
        vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Refreshing", "Ozen Hub is reloading...", 3, "refresh-cw")
        wait(2)
        vu9:SelectTab(1)
    end
})
v37:Section({
    Title = "\226\173\144 Most Popular Scripts",
    TextSize = 20
})
v37:Divider()
v33(v37, "Infinite Yield", "Advanced admin commands with extensive features", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", "Universal", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v33(v37, "Orca Hub", "Universal script hub for multiple games", "https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua", "Universal", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v33(v37, "Dark Dex", "Powerful script explorer and decompiler", "https://raw.githubusercontent.com/infyiff/backup/main/dex.lua", "Universal", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v26(v37, "All Games")
v39:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\184\143 Murder Mystery 2 Scripts",
    TextSize = 18
})
v39:Divider()
v33(v39, "Soluna Hub", "Complete MM2 features - No Key Required", "https://soluna-script.vercel.app/murder-mystery-2.lua", "Murder Mystery 2", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v33(v39, "Admin Panel", "Admin commands and tools - No Key Required", "https://raw.githubusercontent.com/rblxscriptsdotnet/roblox-scripts/refs/heads/main/mm2adminpanelsource", "Murder Mystery 2", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\184\143")
v26(v39, "Murder Mystery 2")
v41:Section({
    Title = "\226\154\148\239\184\143 Blade Ball Scripts",
    TextSize = 18
})
v41:Divider()
v33(v41, "Blade Ball Bakugan", "Auto parry and prediction - No Key Required", "https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/refs/heads/main/PitbullHubX.lua", "Blade Ball", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v33(v41, "Blade Ball Laws Hub", "Advanced blade mechanics - No Key Required", "https://raw.githubusercontent.com/LawsHub/loader/refs/heads/main/loader.lua", "Blade Ball", "\226\154\150\239\184\143")
v26(v41, "Blade Ball")
v43:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\184\143 BedWars Scripts",
    TextSize = 18
})
v43:Divider()
v33(v43, "BedWars Rust Hub", "Complete BedWars features - No Key Required", "https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua", "BedWars", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v33(v43, "BedWars Vape V4", "Premium BedWars script with advanced features", "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", "BedWars", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v26(v43, "BedWars")
v45:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Steal a Brainrot Scripts",
    TextSize = 18
})
v45:Divider()
v45:Button({
    Title = "\226\152\130\239\184\143 Steal a Brainrot Umbrella",
    Desc = "Complete Brainrot script package - MOLYN Development",
    Icon = "umbrella",
    Callback = function()
        vu23("Brainrot Umbrella", "https://raw.githubusercontent.com/Atom1gg/Umbrella/refs/heads/main/Loader.lua", "Complete Brainrot script", "Steal a Brainrot")
    end
})
v45:Button({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 MOLYN Brainrot Script",
    Desc = "Keyless script for Steal a Brainrot",
    Icon = "zap",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/XDZB6xCY/raw"))()
        vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 MOLYN Brainrot", "Loaded MOLYN Brainrot script!", 4, "brain")
    end
})
v26(v45, "Steal a Brainrot")
v47:Section({
    Title = "\226\154\148\239\184\143 Rivals Scripts",
    TextSize = 18
})
v47:Divider()
v33(v47, "RIVALS Rise", "Advanced Rivals script with auto features", "https://raw.githubusercontent.com/ShadowBey01/SHWX-Team-Rise-Scripts/refs/heads/main/Games/Rise%20(Rivals).lua", "Rivals", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v26(v47, "Rivals")
v49:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 HyperShot Scripts",
    TextSize = 18
})
v49:Divider()
v26(v49, "HyperShot")
v51:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Grow a Garden Scripts",
    TextSize = 18
})
v51:Divider()
v33(v51, "Grow a Garden Soluna", "Auto farming and garden management", "https://soluna-script.vercel.app/grow-a-garden.lua", "Grow a Garden", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v26(v51, "Grow a Garden")
v53:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Doors Scripts",
    TextSize = 18
})
v53:Divider()
v33(v53, "DOORS Saturn Hub", "Complete Doors script with entity avoidance", "https://raw.githubusercontent.com/JScripter-Lua/Saturn_Hub_Products/refs/heads/main/Saturn_Hub_Doors.lua", "Doors", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v33(v53, "DOORS Velocity X", "Speed and survival features for Doors", "https://raw.githubusercontent.com/DasVelocity/VelocityX/refs/heads/main/VelocityX.lua", "Doors", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v26(v53, "Doors")
v55:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Arise Crossover Scripts",
    TextSize = 18
})
v55:Divider()
v26(v55, "Arise Crossover")
v57:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Arsenal Scripts",
    TextSize = 18
})
v57:Divider()
v33(v57, "Arsenal Vapa v2 Hub", "Aimbot and ESP for Arsenal", "https://raw.githubusercontent.com/Nickyangtpe/Vapa-v2/refs/heads/main/Vapav2-Arsenal.lua", "Arsenal", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v33(v57, "Arsenal Tbao Hub", "Complete Arsenal script package", "https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubArsenal", "Arsenal", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v26(v57, "Arsenal")
v59:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Blox Fruits Scripts",
    TextSize = 18
})
v59:Divider()
v33(v59, "Blox Fruits Hub", "Auto farm and boss fighting features", "https://raw.githubusercontent.com/farrelghibran/demon/main/source.app", "Blox Fruits", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v33(v59, "GoldenHUB Blox", "Premium Blox Fruits automation", "https://paste.myconan.net/489742.txt", "Blox Fruits", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v26(v59, "Blox Fruits")
v61:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Build ur Base Scripts",
    TextSize = 18
})
v61:Divider()
v26(v61, "Build ur Base")
v63:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Plants Vs Brainrots Scripts",
    TextSize = 18
})
v63:Divider()
v26(v63, "Plants Vs Brainrots")
v65:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Fish It! Scripts",
    TextSize = 18
})
v65:Divider()
v65:Button({
    Title = "\226\154\161 MOLYN Fish It Script",
    Desc = "Keyless fishing script - MOLYN Development",
    Icon = "fish",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/XDZB6xCY/raw"))()
        vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 MOLYN Fish It", "Loaded MOLYN Fish It script!", 4, "fish")
    end
})
v26(v65, "Fish It!")
v67:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 BrookHavenRP Scripts",
    TextSize = 18
})
v67:Divider()
v67:Button({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 MOLYN Brookhaven Script",
    Desc = "Keyless Brookhaven script - Credits: BRUTON",
    Icon = "city",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/XDZB6xCY/raw"))()
        vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\184\143 MOLYN Brookhaven", "Loaded MOLYN Brookhaven script!", 4, "city")
    end
})
v26(v67, "BrookHavenRP")
v69:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Cut Trees Scripts",
    TextSize = 18
})
v69:Divider()
v26(v69, "Cut Trees")
v71:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Murderers VS Sheriffs Duels Scripts",
    TextSize = 18
})
v71:Divider()
v26(v71, "Murderers VS Sheriffs")
v73:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Dead Rails Scripts",
    TextSize = 18
})
v73:Divider()
v73:Button({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 MOLYN Dead Rails Script",
    Desc = "Auto farm bonds - Credits: HANG/Tora",
    Icon = "dollar-sign",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/XDZB6xCY/raw"))()
        vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 MOLYN Dead Rails", "Loaded MOLYN Dead Rails script!", 4, "train")
    end
})
v26(v73, "Dead Rails")
v75:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 DaHood Scripts",
    TextSize = 18
})
v75:Divider()
v26(v75, "DaHood")
v77:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Anime Eternal Scripts",
    TextSize = 18
})
v77:Divider()
v26(v77, "Anime Eternal")
v79:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Forsaken Scripts",
    TextSize = 18
})
v79:Divider()
v26(v79, "Forsaken")
v81:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Adopt Me! Scripts",
    TextSize = 18
})
v81:Divider()
v26(v81, "Adopt Me!")
v83:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\184\143 Ink Game Scripts",
    TextSize = 18
})
v83:Divider()
v26(v83, "Ink Game")
v85:Section({
    Title = "\226\156\139 The Strongest Battlegrounds Scripts",
    TextSize = 18
})
v85:Divider()
v26(v85, "The Strongest Battlegrounds")
v87:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 99 Nights In The Forest Scripts",
    TextSize = 18
})
v87:Divider()
v87:Button({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 MOLYN 99 Nights Script",
    Desc = "Survival script for 99 Nights",
    Icon = "moon",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/XDZB6xCY/raw"))()
        vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 MOLYN 99 Nights", "Loaded MOLYN 99 Nights script!", 4, "tree")
    end
})
v26(v87, "99 Nights In The Forest")
v89:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Pet Simulator 99 Scripts",
    TextSize = 18
})
v89:Divider()
v26(v89, "Pet Simulator 99")
v91:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Other Popular Games",
    TextSize = 18
})
v91:Divider()
v33(v91, "99 Nights Vortex Hub", "Complete survival features - No Key Required", "https://api.luarmor.net/files/v3/loaders/80aed6b06a7e38e8260a1b82638ff65b.lua", "99 Nights", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v33(v91, "RIVALS Rise", "Advanced Rivals script with auto features", "https://raw.githubusercontent.com/ShadowBey01/SHWX-Team-Rise-Scripts/refs/heads/main/Games/Rise%20(Rivals).lua", "Rivals", "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189")
v93:Section({
    Title = "\226\154\153\239\184\143 Premium Tools",
    TextSize = 20
})
v93:Divider()
local vu100 = false
local vu101 = 50
local vu102 = nil
local vu103 = nil
v93:Toggle({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Flight System",
    Desc = "Toggle flying mode (WASD + Space/Shift)",
    Value = false,
    Callback = function(p104)
        if p104 then
            local v105 = vu6.Character
            if v105 then
                local v106 = v105:FindFirstChildOfClass("Humanoid")
                local v107 = v105:FindFirstChild("HumanoidRootPart")
                if v106 and v107 then
                    vu100 = true
                    vu102 = Instance.new("BodyVelocity")
                    vu102.Velocity = Vector3.new(0, 0, 0)
                    vu102.MaxForce = Vector3.new(100000, 100000, 100000)
                    vu102.Parent = v107
                    vu103 = Instance.new("BodyGyro")
                    vu103.MaxTorque = Vector3.new(100000, 100000, 100000)
                    vu103.CFrame = v107.CFrame
                    vu103.Parent = v107
                    v106.PlatformStand = true
                    vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Flight", "Flight activated! Use WASD + Space/Shift", 4, "rocket")
                end
            end
        else
            vu100 = false
            if vu102 then
                vu102:Destroy()
            end
            if vu103 then
                vu103:Destroy()
            end
            local v108 = vu6.Character
            local v109 = v108 and v108:FindFirstChildOfClass("Humanoid")
            if v109 then
                v109.PlatformStand = false
            end
            vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Flight", "Flight deactivated", 3, "landmark")
        end
    end
})
v93:Slider({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Flight Speed",
    Desc = "Adjust flying movement speed",
    Value = {
        Min = 20,
        Max = 200,
        Default = 50
    },
    Callback = function(p110)
        vu101 = p110
    end
})
local vu111 = false
v93:Toggle({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 NoClip Mode",
    Desc = "Walk through walls and objects",
    Value = false,
    Callback = function(p112)
        vu111 = p112
        vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 NoClip", p112 and "NoClip activated!" or "NoClip deactivated", 3, "ghost")
    end
})
local vu113 = 16
v93:Slider({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Walk Speed",
    Desc = "Adjust character movement speed",
    Value = {
        Min = 16,
        Max = 200,
        Default = 16
    },
    Callback = function(p114)
        vu113 = p114
        local v115 = vu6.Character
        if v115 then
            v115 = vu6.Character:FindFirstChildOfClass("Humanoid")
        end
        if v115 then
            v115.WalkSpeed = p114
        end
    end
})
local vu116 = 50
v93:Slider({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Jump Power",
    Desc = "Adjust character jump height",
    Value = {
        Min = 50,
        Max = 500,
        Default = 50
    },
    Callback = function(p117)
        vu116 = p117
        local v118 = vu6.Character
        if v118 then
            v118 = vu6.Character:FindFirstChildOfClass("Humanoid")
        end
        if v118 then
            v118.JumpPower = p117
        end
    end
})
local vu119 = false
v93:Toggle({
    Title = "\226\136\158 Infinite Jump",
    Desc = "Jump infinitely by holding spacebar",
    Value = false,
    Callback = function(p120)
        vu119 = p120
        vu14("\226\136\158 Jump", p120 and "Infinite jump activated!" or "Infinite jump deactivated", 3, "activity")
    end
})
vu3.RenderStepped:Connect(function()
    if vu100 and (vu102 and (vu103 and vu6.Character)) then
        local v121 = vu6.Character:FindFirstChild("HumanoidRootPart")
        local v122 = workspace.CurrentCamera
        if v121 and v122 then
            local v123 = Vector3.new(0, 0, 0)
            if vu5:IsKeyDown(Enum.KeyCode.W) then
                v123 = v123 + v122.CFrame.LookVector
            end
            if vu5:IsKeyDown(Enum.KeyCode.S) then
                v123 = v123 - v122.CFrame.LookVector
            end
            if vu5:IsKeyDown(Enum.KeyCode.A) then
                v123 = v123 - v122.CFrame.RightVector
            end
            if vu5:IsKeyDown(Enum.KeyCode.D) then
                v123 = v123 + v122.CFrame.RightVector
            end
            if vu5:IsKeyDown(Enum.KeyCode.Space) then
                v123 = v123 + Vector3.new(0, 1, 0)
            end
            if vu5:IsKeyDown(Enum.KeyCode.LeftShift) then
                v123 = v123 - Vector3.new(0, 1, 0)
            end
            vu102.Velocity = v123 * vu101
            vu103.CFrame = v122.CFrame
        end
    end
    if vu111 and vu6.Character then
        local v124, v125, v126 = pairs(vu6.Character:GetDescendants())
        while true do
            local v127
            v126, v127 = v124(v125, v126)
            if v126 == nil then
                break
            end
            if v127:IsA("BasePart") then
                v127.CanCollide = false
            end
        end
    end
end)
vu5.JumpRequest:Connect(function()
    local v128 = vu119 and vu6.Character and vu6.Character:FindFirstChildOfClass("Humanoid")
    if v128 then
        v128:ChangeState("Jumping")
    end
end)
vu6.CharacterAdded:Connect(function(p129)
    task.wait(1)
    local v130 = p129:FindFirstChildOfClass("Humanoid")
    if v130 then
        v130.WalkSpeed = vu113
        v130.JumpPower = vu116
    end
    if vu100 then
        task.wait(2)
    end
end)
v95:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 UI Customization",
    TextSize = 20
})
v95:Divider()
v95:Dropdown({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 UI Theme",
    Desc = "Change the interface theme and colors",
    Values = {
        "Dark \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189",
        "Light \226\152\128\239\184\143",
        "Darker \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189",
        "Luna \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189",
        "Aqua \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189",
        "Purple \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189",
        "Red \226\157\164\239\184\143"
    },
    Value = "Dark \239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189",
    Callback = function(p131)
        vu1:SetTheme((string.gsub(p131, " [%p%w]*$", "")))
        vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Theme", "UI theme set to: " .. p131, 3, "palette")
    end
})
v95:Slider({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 UI Transparency",
    Desc = "Adjust window transparency level",
    Value = {
        Min = 0,
        Max = 1,
        Default = 0.1,
        Step = 0.05
    },
    Callback = function(p132)
        vu1.TransparencyValue = p132
        vu9:ToggleTransparency(p132 > 0)
    end
})
v95:Keybind({
    Title = "\226\140\168\239\184\143 UI Toggle Key",
    Desc = "Key to show/hide the interface",
    Value = "RightControl",
    Callback = function(p133)
        vu9:SetToggleKey(Enum.KeyCode[p133])
        vu14("\226\140\168\239\184\143 Keybind", "UI toggle key set to: " .. p133, 3, "keyboard")
    end
})
v95:Section({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Configuration",
    TextSize = 18
})
v95:Divider()
local vu134 = "ozen_hub"
v95:Input({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Config Name",
    Desc = "Name for saving/loading settings",
    Value = vu134,
    Callback = function(p135)
        vu134 = p135 or "ozen_hub"
    end
})
v95:Button({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Save Configuration",
    Desc = "Save all current settings and preferences",
    Icon = "save",
    Callback = function()
        local v136 = {
            WalkSpeed = vu113,
            JumpPower = vu116,
            FlySpeed = vu101,
            Theme = "Dark",
            Transparency = 0.1
        }
        if writefile then
            writefile(vu134 .. "_config.json", game:GetService("HttpService"):JSONEncode(v136))
            vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Saved", "Configuration saved successfully!", 3, "save")
        else
            vu14("\226\157\140 Error", "Your executor doesn\'t support file writing", 4, "alert-triangle")
        end
    end
})
v95:Button({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Load Configuration",
    Desc = "Load saved settings and preferences",
    Icon = "folder",
    Callback = function()
        if readfile and isfile(vu134 .. "_config.json") then
            local v137 = game:GetService("HttpService"):JSONDecode(readfile(vu134 .. "_config.json"))
            if v137.WalkSpeed then
                vu113 = v137.WalkSpeed
                local v138 = vu6.Character
                if v138 then
                    v138 = vu6.Character:FindFirstChildOfClass("Humanoid")
                end
                if v138 then
                    v138.WalkSpeed = vu113
                end
            end
            vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Loaded", "Configuration loaded successfully!", 3, "folder")
        else
            vu14("\226\157\140 Error", "No saved configuration found", 4, "alert-triangle")
        end
    end
})
v95:Button({
    Title = "\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Reset Everything",
    Desc = "Reset all settings to default values",
    Icon = "refresh-cw",
    Callback = function()
        vu1:SetTheme("Dark")
        vu1.TransparencyValue = 0.1
        vu113 = 16
        vu116 = 50
        vu101 = 50
        local v139 = vu6.Character
        if v139 then
            v139 = vu6.Character:FindFirstChildOfClass("Humanoid")
        end
        if v139 then
            v139.WalkSpeed = 16
            v139.JumpPower = 50
        end
        vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Reset", "All settings restored to default!", 3, "refresh-cw")
    end
})
local v140 = vu9
vu9.SelectTab(v140, 1)
local v141 = vu9
vu9.UnlockAll(v141)
local v142 = vu9
vu9.OnClose(v142, function()
    vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Ozen Hub", "UI hidden! Press RightControl to reopen.", 3, "eye-off")
end)
local v143 = vu9
vu9.OnOpen(v143, function()
    vu14("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Ozen Hub - Ready!", "Premium Universal Script Hub loaded!\n\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Enjoy enhanced gaming!", 5, "sparkles")
end)
vu6.CharacterAdded:Connect(function(p144)
    task.wait(1)
    local v145 = p144:FindFirstChildOfClass("Humanoid")
    if v145 then
        v145.WalkSpeed = vu113
        v145.JumpPower = vu116
    end
end)
wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebulla-Softworks/Luna-Interface/refs/heads/main/source.lua"))()
setclipboard("https://discord.gg/pNfrgHeede")
print("\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189\239\191\189 Ozen Hub - Premium Universal Script Hub Loaded Successfully!")
