-- SannHub GUI
local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AntiAFKBtn = Instance.new("TextButton")
local CloseBtn = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "SannHub"

Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.Size = UDim2.new(0, 250, 0, 150)
Main.Position = UDim2.new(0.5, -125, 0.5, -75)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

Title.Parent = Main
Title.Text = "SANN HUB"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextSize = 20
Instance.new("UICorner", Title)

AntiAFKBtn.Parent = Main
AntiAFKBtn.Text = "Anti AFK: OFF"
AntiAFKBtn.Size = UDim2.new(0.9, 0, 0, 40)
AntiAFKBtn.Position = UDim2.new(0.05, 0, 0, 50)
AntiAFKBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
AntiAFKBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", AntiAFKBtn)

CloseBtn.Parent = Main
CloseBtn.Text = "X"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", CloseBtn)

local afkOn = false
AntiAFKBtn.MouseButton1Click:Connect(function()
    afkOn = not afkOn
    if afkOn then
        AntiAFKBtn.Text = "Anti AFK: ON"
        AntiAFKBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
    else
        AntiAFKBtn.Text = "Anti AFK: OFF"
        AntiAFKBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end
end)

-- Anti AFK Logic
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    if afkOn then
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("SannHub GUI Loaded!")
