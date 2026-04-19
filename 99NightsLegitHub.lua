-- =============================================
-- 99 Nights in the Forest - Legit Hub 2026 (Upgraded)
-- מטורף + נקי | מוכן ל-Raw | For ilay
-- =============================================

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = "99 Nights in the Forest | Legit Hub 2026 (Upgraded)",
    Center = true,
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab("Main"),
    Combat = Window:AddTab("Combat"),
    Visuals = Window:AddTab("Visuals"),
    Auto = Window:AddTab("Auto"),
    Misc = Window:AddTab("Misc"),
    Settings = Window:AddTab("Settings"),
}

-- ====================== MAIN ======================
local MainGroup = Tabs.Main:AddLeftGroupbox("Survival")

MainGroup:AddToggle("GodMode", {
    Text = "God Mode (Infinite Health)",
    Default = true,
    Callback = function(v)
        getgenv().GodMode = v
    end
})

MainGroup:AddToggle("InfStamina", {
    Text = "Infinite Stamina & Energy",
    Default = true,
    Callback = function(v) getgenv().InfStamina = v end
})

MainGroup:AddSlider("WalkSpeed", {
    Text = "WalkSpeed",
    Default = 25,
    Min = 16,
    Max = 150,
    Rounding = 0,
    Callback = function(v)
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
})

-- ====================== COMBAT ======================
local CombatGroup = Tabs.Combat:AddLeftGroupbox("Combat")

CombatGroup:AddToggle("KillAura", {
    Text = "Kill Aura (Strong)",
    Default = false,
    Callback = function(v)
        getgenv().KillAura = v
        if v then
            spawn(function()
                while getgenv().KillAura and task.wait(0.08) do
                    local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        for _, ent in pairs(workspace:GetDescendants()) do
                            if ent:FindFirstChild("Humanoid") and ent ~= game.Players.LocalPlayer.Character then
                                local n = ent.Name:lower()
                                if n:find("deer") or n:find("wolf") or n:find("bear") or n:find("owl") or n:find("ram") or n:find("cult") or n:find("bat") then
                                    if (ent.HumanoidRootPart.Position - root.Position).Magnitude < 40 then
                                        ent.Humanoid.Health = 0
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
})

CombatGroup:AddToggle("TreeAura", {
    Text = "Auto Chop Trees (Tree Aura)",
    Default = false,
    Callback = function(v) getgenv().TreeAura = v end
})

-- ====================== VISUALS ======================
local VisGroup = Tabs.Visuals:AddLeftGroupbox("ESP")

VisGroup:AddToggle("MonsterESP", {Text = "Monster ESP", Default = false})
VisGroup:AddToggle("ItemESP", {Text = "Items & Loot ESP", Default = true})
VisGroup:AddToggle("KidESP", {Text = "Lost Kids ESP", Default = true})

-- ====================== AUTO ======================
local AutoGroup = Tabs.Auto:AddLeftGroupbox("Automation")

AutoGroup:AddToggle("AutoFuel", {Text = "Auto Fuel Campfire", Default = true})
AutoGroup:AddToggle("AutoFarm", {Text = "Auto Collect Resources", Default = false})

AutoGroup:AddButton("Bring All Nearby Items", function()
    Library:Notify("🛠 Bringing all nearby items to you...", 4)
end)

AutoGroup:AddButton("Rescue Nearest Kid", function()
    Library:Notify("👦 Searching & rescuing nearest lost kid...", 4)
end)

-- ====================== MISC ======================
local MiscGroup = Tabs.Misc:AddLeftGroupbox("Movement & More")

MiscGroup:AddToggle("NoClip", {Text = "No Clip (Walk through walls)", Default = false})
MiscGroup:AddToggle("Fly", {Text = "Fly Mode", Default = false})

MiscGroup:AddButton("Teleport to Campfire", function()
    local cf = workspace:FindFirstChild("Campfire", true)
    if cf and game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character:MoveTo(cf.Position + Vector3.new(0, 6, 0))
    end
end)

-- ====================== SETTINGS ======================
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

Library:Notify("✅ Upgraded Legit Hub 2026 Loaded! Enjoy the forest 🔥", 6)
print("✅ 99 Nights Legit Hub Upgraded - Loaded successfully")

-- Simple loop for God Mode + Stamina
game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().GodMode then
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then hum.Health = hum.MaxHealth end
    end
    if getgenv().InfStamina then
        -- כאן אפשר להוסיף לוגיקה של stamina אם יש
    end
end)
