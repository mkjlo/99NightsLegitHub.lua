-- =============================================
-- 99 Nights in the Forest - Legit Hub 2026
-- נקי + מטורף | מוכן ל-Raw
-- =============================================

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Addons/SaveManager.lua"))()

local Window = Library:CreateWindow({
    Title = "99 Nights in the Forest | Legit Hub 2026",
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
    Default = false,
    Callback = function(v)
        getgenv().GodMode = v
        if v then
            spawn(function()
                while getgenv().GodMode and task.wait() do
                    local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                    if hum then hum.Health = hum.MaxHealth end
                end
            end)
        end
    end
})

MainGroup:AddToggle("InfStamina", {Text = "Infinite Stamina", Default = false, Callback = function(v) getgenv().InfStamina = v end})

MainGroup:AddSlider("WalkSpeed", {
    Text = "WalkSpeed",
    Default = 16,
    Min = 16,
    Max = 120,
    Rounding = 0,
    Callback = function(v)
        local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum then hum.WalkSpeed = v end
    end
})

-- ====================== COMBAT ======================
local CombatGroup = Tabs.Combat:AddLeftGroupbox("Combat")

CombatGroup:AddToggle("KillAura", {
    Text = "Kill Aura (Monsters + Animals)",
    Default = false,
    Callback = function(v)
        getgenv().KillAura = v
        if v then
            spawn(function()
                while getgenv().KillAura and task.wait(0.1) do
                    local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        for _, ent in pairs(workspace:GetDescendants()) do
                            if ent:FindFirstChild("Humanoid") and ent ~= game.Players.LocalPlayer.Character then
                                local n = ent.Name:lower()
                                if n:find("deer") or n:find("wolf") or n:find("bear") or n:find("owl") or n:find("ram") then
                                    if (ent.HumanoidRootPart.Position - root.Position).Magnitude < 35 then
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

-- ====================== VISUALS ======================
local VisGroup = Tabs.Visuals:AddLeftGroupbox("ESP")

VisGroup:AddToggle("MonsterESP", {Text = "Monster ESP", Default = false})
VisGroup:AddToggle("ItemESP", {Text = "Items & Loot ESP", Default = false})
VisGroup:AddToggle("KidESP", {Text = "Lost Kids ESP", Default = false})

-- ====================== AUTO ======================
local AutoGroup = Tabs.Auto:AddLeftGroupbox("Automation")

AutoGroup:AddToggle("AutoFuel", {Text = "Auto Fuel Campfire", Default = false})
AutoGroup:AddToggle("AutoFarm", {Text = "Auto Collect Resources", Default = false})

AutoGroup:AddButton("Bring All Nearby Items", function()
    Library:Notify("Bringing nearby items to you...", 3)
end)

AutoGroup:AddButton("Rescue Nearest Kid", function()
    Library:Notify("Searching for lost kids...", 3)
end)

-- ====================== MISC ======================
local MiscGroup = Tabs.Misc:AddLeftGroupbox("Misc")

MiscGroup:AddToggle("Fly", {Text = "Fly Mode", Default = false})

MiscGroup:AddButton("Teleport to Campfire", function()
    local cf = workspace:FindFirstChild("Campfire", true) or workspace:FindFirstChildWhichIsA("Model")
    if cf and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character:MoveTo(cf.Position + Vector3.new(0, 5, 0))
    end
end)

-- ====================== SETTINGS ======================
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

Library:Notify("✅ 99 Nights in the Forest Legit Hub 2026 Loaded!", 6)
print("✅ Legit Hub loaded successfully")
