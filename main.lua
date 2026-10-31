-- Anti AFK - Blox Fruits / all game
getgenv().AntiAFK = true

local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

player.Idled:Connect(function()
    if getgenv().AntiAFK then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        print("[AntiAFK] Anti-AFK is running,")
    end
end)
