-- [[ AHMED HUB - COMPLETE FIXED VERSION ]] --
-- NAME: AHMED HUB
-- KEY: VRV

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

-- 1. صنع الواجهة (The Design)
local gui = Instance.new("ScreenGui")
gui.Name = "AhmedKeySystem"
gui.Parent = CoreGui

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 300, 0, 200)
keyFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
keyFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
keyFrame.Parent = gui

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 50)
keyTitle.Text = "AHMED HUB | ENTER KEY"
keyTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
keyTitle.BackgroundTransparency = 1
keyTitle.Parent = keyFrame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0, 260, 0, 40)
keyBox.Position = UDim2.new(0, 20, 0, 70)
keyBox.PlaceholderText = "Enter Key Here..."
keyBox.Text = ""
keyBox.Parent = keyFrame

local confirmKey = Instance.new("TextButton")
confirmKey.Size = UDim2.new(0, 260, 0, 40)
confirmKey.Position = UDim2.new(0, 20, 0, 130)
confirmKey.Text = "Confirm Key"
confirmKey.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
confirmKey.TextColor3 = Color3.white
confirmKey.Parent = keyFrame

-- 2. نظام التحقق (The Logic)
confirmKey.MouseButton1Click:Connect(function()
    if keyBox.Text == "VRV" then
        gui:Destroy()
        -- تشغيل سكربت Brookhaven الأصلي
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ook314745-svg/Brooki/refs/heads/main/obf_WUARKU60mdiDwIr4jcGVFs223sri6G0cPUtZ19JSap24AK6Js9gpiNVrCEghjCQ2.lua.txt"))()
    else
        confirmKey.Text = "WRONG KEY! TRY: VRV"
        task.wait(2)
        confirmKey.Text = "Confirm Key"
    end
end)
