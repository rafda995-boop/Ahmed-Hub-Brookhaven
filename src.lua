
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

if napoleonLoaded then
	return
end

pcall(function()
	getgenv().napoleonLoaded = true
end)

local MyKey = "ZERO3MK"

--local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()

local repo = "https://raw.githubusercontent.com/raydjs/Obsidian/main/"
local discord_link = "discord.gg/bWzCFPk83g"
local Library = nil

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

local games = if ID == 6931042565
	then
		-- // Volleyball legends
		if old then "5138fff8319f430c56ea6057569cb188" else "10231c45388ada5c77add5a7583a2b19"
	elseif ID == 7018190066 then "6cb8843504e7bbaf2c12ad7fe51d8e60"
	elseif ID == 6945584306 then "d48f6f73e12d8c126f3075f73224ea83"
	elseif ID == 1054526971 then "2e637d8f45504b786dccd6c6478e468f"
	elseif ID == 7028566528 then "1a62600f4eb00c2c17432239329aafde"
	elseif ID == 7436755782 then "5c69b7f5635528c1340e14f2d413b1b7"
	elseif ID == 3808081382 then "05d562929f3d52b114f10e5bc3802f40"
	elseif ID == 6770632849 then "37f3259776b4c4be8de391ad3837246a"
	elseif ID == 6925303818 then "477873fe2ae1822f60b28042e95c81b1"
	elseif ID == 7008097940 then "ac8df4db983c4c2b9169f993c89f294f"
	elseif ID == 847722000 then "bebee6367bd678c0c955c20cbae5f75d"
	elseif ID == 7744159391 then "6a69cfade8203344c5ebb69f775b7648"
	elseif ID == 807930589 then "b009f7183f25cec3b3b919a081cba964"
	elseif ID == 3876150506 then "3386f605d299ca3ad8d22abd6b0cec99"
	elseif ID == 187796008 then "c9faedbfe2b2f9ce56ceeaa5c26b0ec9"
	elseif ID == 7750955984 then "2a8e130d12f1c6f9b73f6fe7daa0795b"
	else nil

		-- Free Ones.
if ID == 7709344486 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/027807675820bcf0cb839befa89d9d3c.lua"))()
elseif ID == 4658598196 then
	run_on_actor(
    getactors()[1],
    'loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b0734c1956ab711253af6e6465d13d2f.lua"))()'
)
	Library:Unload()
end

if games == nil then
	return
end

api.script_id = if typeof(games) == "function" then select(1, games()) else games

-- // Anti Afk (ifyld)
local gcn = getconnections or get_signal_cons

if gcn then
	for i, v in gcn(Players.LocalPlayer.Idled) do
		if v["Disable"] then
			v["Disable"](v)
		elseif v["Disconnect"] then
			v["Disconnect"](v)
		end
	end
else
	local VirtualUser = cloneref(game:GetService("VirtualUser"))
	Players.LocalPlayer.Idled:Connect(function()
		VirtualUser:CaptureController()
		VirtualUser:ClickButton2(Vector2.new())
	end)
end

local keyFile = "NAPOLEON_IS_THE_GREATEST_KEY.txt"

local function getKey()
	if isfile(keyFile) then
		return readfile(keyFile)
	end
end

local key = getKey()

local status = api.check_key(script_key or key)

local function execute(keys)
	Library:Unload()
	if typeof(games) == "function" then
		select(2, games())(keys)
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
