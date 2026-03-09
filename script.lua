--[[ 
    MODIFIED BY: Ahmed (Taraf69788)
    TELEGRAM: @A_K_8_H
    CLAN: VOID
    ACCESS CODE: انور
]]

local AccessCode = "انور"

-- دالة تشغيل السكربت وتعديل الواجهة تلقائياً
local function RunAhmedScript()
    -- تحميل السكربت الأصلي
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-JR-by-malik-131257"))()

    -- انتظار تحميل الواجهة لتعديل الاسم برمجياً
    task.spawn(function()
        while true do
            for _, v in pairs(game.CoreGui:GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    -- استبدال اسم malik بـ أحمد في أي مكان يظهر فيه
                    if string.find(v.Text, "malik") then
                        v.Text = string.gsub(v.Text, "malik", "أحمد")
                    end
                end
            end
            task.wait(2) -- فحص دوري للتأكد من بقاء الاسم الجديد
        end
    end)

    -- إرسال إشعار التأكيد
    game.StarterGui:SetCore("SendNotification", {
        Title = "تم التفعيل بنجاح";
        Text = "بواسطة أحمد | كلان void";
        Duration = 5;
    })
end

-- واجهة طلب الرمز (محمية)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 300, 0, 160)
Main.Position = UDim2.new(0.5, -150, 0.5, -80)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.Active = true
Main.Draggable = true

local Title = Instance.new("TextLabel", Main)
Title.Text = "أدخل الرمز للتشغيل (أحمد)"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(150, 0, 0)

local Input = Instance.new("TextBox", Main)
Input.PlaceholderText = "الرمز هنا..."
Input.Size = UDim2.new(0.8, 0, 0, 35)
Input.Position = UDim2.new(0.1, 0, 0.4, 0)

local Btn = Instance.new("TextButton", Main)
Btn.Text = "تشغيل كلان void"
Btn.Size = UDim2.new(0.6, 0, 0, 35)
Btn.Position = UDim2.new(0.2, 0, 0.75, 0)
Btn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)

Btn.MouseButton1Click:Connect(function()
    if Input.Text == AccessCode then
        ScreenGui:Destroy()
        RunAhmedScript()
    else
        Input.Text = ""
        Input.PlaceholderText = "الرمز خطأ!"
    end
end)
