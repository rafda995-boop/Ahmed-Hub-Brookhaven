local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

if napoleonLoaded then
	return
end

pcall(function()
	getgenv().napoleonLoaded = true
end)

-- 1. تعريف مفتاحك الخاص
local MyKey = "ZERO3MK"

-- 2. نظام تحقق محلي (لإصلاح خطأ api المتوقف)
local api = {}
api.check_key = function(input_key)
    if input_key == MyKey then
        return {code = "KEY_VALID"}
    else
        return {code = "KEY_INCORRECT"}
    end
end
api.load_script = function() 
    print("Ahmed Hub Activated!") 
end

local repo = "https://raw.githubusercontent.com/raydjs/Obsidian/main/"
local discord_link = "discord.gg/bWzCFPk83g"
local Library = nil

-- تحميل المكتبة الرسومية
while true do
	task.wait()
	local success, data = pcall(function()
		return loadstring(game:HttpGet(repo .. "Library.lua"))()
	end)

	if success then
		Library = data
		break
	end
end

local ID = game.GameId
local keyFile = "Ahmed_Hub_Key.txt"

-- دالة تشغيل السكربت
local function execute(keys)
	Library:Unload()
    -- هنا يتم تشغيل مميزات الهب
    Library:Notify("تم تشغيل Ahmed Hub بنجاح!", 4)
end

local function getKey()
	if isfile(keyFile) then
		return readfile(keyFile)
	end
end

local key = getKey()
local status = api.check_key(key or "")

if status.code == "KEY_VALID" then
	Library:Notify("تم التحقق من المفتاح المحفوظ", 4)
	execute(key)
	return
end

-- إنشاء واجهة المفتاح
local Window = Library:CreateWindow({
	Title = "Ahmed Hub | ZERO3MK",
	Footer = discord_link,
	Icon = 105747086514734,
	NotifySide = "Right",
})

local Tabs = {
	Key = Window:AddKeyTab("Key System"),
}

Tabs.Key:AddLabel({
	Text = "أدخل المفتاح: ZERO3MK",
	DoesWrap = true,
	Size = 16,
})

Tabs.Key:AddKeyBox(function(_, ReceivedKey)
	local result = api.check_key(ReceivedKey)
	
	if result.code == "KEY_VALID" then
		writefile(keyFile, ReceivedKey)
		Library:Notify("المفتاح صحيح!", 4)
		task.wait(1)
		execute(ReceivedKey)
	else
		Library:Notify("المفتاح غير صحيح! جرب ZERO3MK", 4)
	end
end)

Tabs.Key:AddButton({
	Text = "Rejoin Server",
	Func = function()
		TeleportService:Teleport(game.PlaceId)
	end,
})
	elseif typeof(games) == "string" then
		api.load_script()
	end
end

local function forceDel(name)
      pcall(function()
         delfile(name or keyFile)
	  end)
end

forceDel("NapoleonHub")

if status.code == "KEY_VALID" then
	script_key = script_key or key
	Library:Unload()
	Library:Notify("Key is valid", 4)

	execute(script_key)
	return
else
	forceDel()
end

local Window = Library:CreateWindow({
	Title = "Napoleon Hub",
	Footer = discord_link,
	Icon = 105747086514734,
	NotifySide = "Right",
	ShowCustomCursor = false,
	MobileButtonsSide = "Left",
})

local Tabs = {
	Key = Window:AddKeyTab("Key System"),
}

Tabs.Key:AddLabel({
	Text = "Enter Key Here",
	DoesWrap = true,
	Size = 16,
})

Tabs.Key:AddKeyBox(function(_, ReceivedKey)
    -- التحقق من المفتاح الخاص بك ZERO3MK
    if ReceivedKey == MyKey then
        Library:Notify("المفتاح صحيح! أهلاً بك يا Ahmed", 4)
        writefile(keyFile, ReceivedKey) -- حفظ المفتاح لعدم إدخاله مرة أخرى
        task.wait(1)
        execute(ReceivedKey) -- تشغيل السكربت
    else
        -- إذا كان المفتاح خطأ
        Library:Notify("المفتاح الذي أدخلته غير صحيح!", 4)
    end
end)

Tabs.Key:AddButton({
	Text = "Get Key (Linkvertise)",
	Func = function()
		setclipboard("https://ads.luarmor.net/get_key?for=hubKey-bbTFbWlaffcB")
		Library:Notify({
			Title = "Linkvertise has been copied!",
			Description = "Complete the link to get Key.",
		}, 4)
	end,
})

Tabs.Key:AddButton({
	Text = "Get Key (Lootlab)",
	Func = function()
		setclipboard("https://ads.luarmor.net/get_key?for=lootLab-KHgdrTasHCWU")
		Library:Notify({
			Title = "LootLab has been copied!",
			Description = "Complete the link to get Key.",
		}, 4)
	end,
})

Tabs.Key:AddButton({
	Text = "Join Discord",
	Func = function()
		setclipboard(discord_link)
		Library:Notify("Discord Link has been copied", 4)
	end,
})

Tabs.Key:AddButton({
	Text = "Rejoin Server",
	Func = function()
		TeleportService:Teleport(game.PlaceId)
		Library:Notify("Rejoining ...", 4)
	end,
})
