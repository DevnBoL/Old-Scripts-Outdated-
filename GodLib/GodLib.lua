--[[

---//==================================================\\---
--|| > About Library									||--
---\===================================================//---

	Library:		GodLib
	Version:		1.10
	Author:			Devn
	
	Forum Thread:	http://www.forum.botoflegends.com/

---//==================================================\\---
--|| > Changelog										||--
---\===================================================//---

	Version 0.01:
		- Initial library release.
	
	Version 1.00:
		- Library re-write.
		
	Version 1.01:
		- Added some champions to priority table.
		- Fixed error from unknown variable name reading recommended priority.
		- Added support for ScriptStatus.
		
	Version 1.02:
		- Changed auto-updater to check for original file name on server (no more Latest.lua).
		
	Version 1.03:
		- Small re-write for public release (API can be found on forum thread).
		
	Version 1.04:
		- Fixed ScriptStatus.
		- Added Player class.
		
	Version 1.05:
		- Added support for range changing spells.
		
	Version 1.06:
		- Added anti-gapcloser support to callbacks class.
		- Added "IsEvading()" function for Evadee.
		
	Version 1.07:
		- Added more global functions.
		- Added evading support for FGE.
		- Added "Player.IsAttacking" variable to avoid cancelling autos (requires SxOrb).
		- Added SAC detection to SxOrbWalk.
		
	Version 1.08:
		- Added auto-interrupter support to callbacks class.
		- Added "GetAlliesInRange(range, from)" function.
		
	Version 1.09:
		- Fixed a small bug causing SpellData:InRange(unit) to include the spells width on all spells (only circular now).

	Version 1.10:
		- Added functions to disable/enable attack/movement (supports SxOrb and SAC).
		
--]]

---//==================================================\\---
--|| > Initialization									||--
---\===================================================//---

GodLib					= {
	__Library 			= {
		Version			= "1.09",
		Update			= {
			Host		= "raw.github.com",
			Path		= "DevnBoL/Scripts/master/GodLib",
			Version		= "Current.version",
			Script		= "GodLib.lua",
		},
	},
	Update				= {
		Host			= nil,
		Path			= "",
		Version			= nil,
		Script			= nil,
	},
	Script				= {
		Variables		= nil,
		ChampionName	= myHero.charName,
		Name			= "Untitled",
		Version			= "0.01",
		Date			= "Not Released",
		Key				= nil,
	},
	Print				= {
		Title			= nil,
		Colors			= {
			Title		= "8183F7",
			Info		= "BEF781",
			Warning		= "F781BE",
			Error		= "F78183",
			Debug		= "81BEF7",
		},
	},
	RequiredLibraries	= { },
}

AddLoadCallback(function()

	-- Public script variables.
	ScriptName								= GodLib.Script.Name
	ScriptVersion							= GodLib.Script.Version
	ScriptDate								= GodLib.Script.Date
	
	-- Update GodLib variables.
	GodLib.Script.Variables					= GodLib.Script.Variables or GodLib.Script.Name
	GodLib.Print.Title						= GodLib.Print.Title or GodLib.Script.Name

	-- Public user variables.
	AutoUpdate								= _G[Format("{1}_AutoUpdate", GodLib.Script.Variables)] or false
	EnableDebugMode							= _G[Format("{1}_EnableDebugMode", GodLib.Script.Variables)] or false

	-- Default required libraries.
	GodLib.RequiredLibraries["SourceLib"]	= "https://raw.githubusercontent.com/gbilbao/Bilbao/master/BoL1/Common/SourceLib.lua"
	GodLib.RequiredLibraries["VPrediction"]	= "https://raw.githubusercontent.com/Ralphlol/BoLGit/master/VPrediction.lua"
	
end)

---//==================================================\\---
--|| > Misc. Variables									||--
---\===================================================//---

AddLoadCallback(function()

	__SpellData			= {
		Prediction		= nil,
		Ids				= {
			[_Q]		= "Q",
			[_W]		= "W",
			[_E]		= "E",
			[_R]		= "R",
		}
	}

	MessageType			= {
		["Info"]		= GodLib.Print.Colors.Info,
		["Warning"]		= GodLib.Print.Colors.Warning,
		["Error"]		= GodLib.Print.Colors.Error,
		["Debug"]		= GodLib.Print.Colors.Debug,
	}

	GapcloserSpells		= {
		["AatroxQ"]              = "Aatrox",
		["AkaliShadowDance"]     = "Akali",
		["Headbutt"]             = "Alistar",
		["FioraQ"]               = "Fiora",
		["DianaTeleport"]        = "Diana",
		["EliseSpiderQCast"]     = "Elise",
		["FizzPiercingStrike"]   = "Fizz",
		["GragasE"]              = "Gragas",
		["HecarimUlt"]           = "Hecarim",
		["JarvanIVDragonStrike"] = "JarvanIV",
		["IreliaGatotsu"]        = "Irelia",
		["JaxLeapStrike"]        = "Jax",
		["KhazixE"]              = "Khazix",
		["khazixelong"]          = "Khazix",
		["LeblancSlide"]         = "LeBlanc",
		["LeblancSlideM"]        = "LeBlanc",
		["BlindMonkQTwo"]        = "LeeSin",
		["LeonaZenithBlade"]     = "Leona",
		["UFSlash"]              = "Malphite",
		["Pantheon_LeapBash"]    = "Pantheon",
		["PoppyHeroicCharge"]    = "Poppy",
		["RenektonSliceAndDice"] = "Renekton",
		["RivenTriCleave"]       = "Riven",
		["SejuaniArcticAssault"] = "Sejuani",
		["slashCast"]            = "Tryndamere",
		["ViQ"]                  = "Vi",
		["MonkeyKingNimbus"]     = "MonkeyKing",
		["XenZhaoSweep"]         = "XinZhao",
		["YasuoDashWrapper"]     = "Yasuo",
}
	
	InterruptableSpells	= {
		["KatarinaR"]					= { charName = "Katarina",		DangerLevel = 5, MaxDuration = 2.5, CanMove = false },
		["Meditate"]					= { charName = "MasterYi",		DangerLevel = 1, MaxDuration = 2.5, CanMove = false },
		["Drain"]						= { charName = "FiddleSticks", 	DangerLevel = 3, MaxDuration = 2.5, CanMove = false },
		["Crowstorm"]					= { charName = "FiddleSticks",	DangerLevel = 5, MaxDuration = 2.5, CanMove = false },
		["GalioIdolOfDurand"]			= { charName = "Galio",			DangerLevel = 5, MaxDuration = 2.5, CanMove = false },
		["MissFortuneBulletTime"]		= { charName = "MissFortune",	DangerLevel = 5, MaxDuration = 2.5, CanMove = false },
		["VelkozR"]						= { charName = "Velkoz",		DangerLevel = 5, MaxDuration = 2.5, CanMove = false },
		["InfiniteDuress"]				= { charName = "Warwick",		DangerLevel = 5, MaxDuration = 2.5, CanMove = false },
		["AbsoluteZero"]				= { charName = "Nunu",			DangerLevel = 4, MaxDuration = 2.5, CanMove = false },
		["ShenStandUnited"]				= { charName = "Shen",			DangerLevel = 3, MaxDuration = 2.5, CanMove = false },
		["FallenOne"]					= { charName = "Karthus",		DangerLevel = 5, MaxDuration = 2.5, CanMove = false },
		["AlZaharNetherGrasp"]			= { charName = "Malzahar",		DangerLevel = 5, MaxDuration = 2.5, CanMove = false },
		["Pantheon_GrandSkyfall_Jump"]	= { charName = "Pantheon",		DangerLevel = 5, MaxDuration = 2.5, CanMove = false },
	}
	
end)

---//==================================================\\---
--|| > Misc. Functions									||--
---\===================================================//---

function PrintLocal(text, type)

	type = type or MessageType.Info

	if ((type == MessageType.Debug) and not EnableDebugMode) then
		return
	end

	PrintChat(Format("<font color=\"#{1}\">{2}:</font> <font color=\"#{3}\">{4}</font>", GodLib.Print.Colors.Title, GodLib.Print.Title, type, text))
	
end

function Format(string, ...)

	return string:Format(...)

end

function IsValid(target, range, from)

	if (not target) then
		return false
	end

	from = from or myHero

	if (ValidTarget(target)) then
		if (not range or (GetDistance(target, from) <= range)) then
			if (not (UnitHasBuff(target, "UndyingRage") and (target.health == 1)) and not UnitHasBuff(target, "JudicatorIntervention")) then
				return true
			end
		end
	end
	
	return false

end

function UnitHasBuff(unit, name, loose)

	for i = 1, unit.buffCount do
        local buff = unit:getBuff(i)
		if (buff.valid and BuffIsValid(buff)) then
			if (not loose) then
				if (buff.name:Equals(name)) then
					return true
				end
			elseif (buff.name:ToLower():find(name:ToLower())) then
				return true
			end
		end
    end
	
    return false

end

function GetEnemiesInRange(range, from)

	from			= from or myHero
	local enemies 	= { }
	
	for _, enemy in ipairs(GetEnemyHeroes()) do
		if (InRange(enemy, range, from)) then
			table.insert(enemies, enemy)
		end
	end
	
	return enemies

end

function GetAlliesInRange(range, from)

	from			= from or myHero
	local allies 	= { }
	
	for _, ally in ipairs(GetAllyHeroes()) do
		if (InRange(ally, range, from)) then
			table.insert(allies, ally)
		end
	end
	
	return allies

end

function InRange(unit, range, from)

	from = from or myHero

	return (GetDistance(unit, from) <= range)

end

function HaveEnoughMana(percent, unit)

	unit = unit or myHero
	return ((unit.mana / unit.maxMana) >= (percent / 100))

end

function IsFleeing(unit, range, from, distance)

	from 			= from or myHero
	distance		= distance or 0

	local position	= Prediction:GetPredictedPos(unit, 0.1)
	
	if (position and (GetDistance(position, from) > (GetDistance(unit, from) + distance)) and (GetDistance(unit, from) >= range)) then
		return true
	end
	
	return false

end

function IsFacing(unit, from)

	if (not unit) then
		return false
	end

	from			= from or myHero
	
	local waypoints	= GetWayPoints(unit)
	local path		= waypoints[#waypoints]
	
	if (path and (GetDistance(path, from) < GetDistance(unit, from))) then
		return true
	end
	
	return false

end

function HealthLowerThenPercent(percent, unit)

	unit = unit or myHero
	return ((unit.health / unit.maxHealth) >= (percent / 100))

end

function IsAlly(unit)

	return (unit.team == myHero.team)

end

function IsEnemy(unit)

	return (not IsAlly(unit))

end

function IsEvading()

	-- Evadee
	if (_G.Evadeee_Loaded and _G.Evading) then
		return true
	end
	
	-- FGE
	if (_G.evade) then
		return
	end
	
	return false

end

function GetAllHeroes()

	local heroes = { }
	
	for i = 1, heroManager.iCount do
        table.insert(heroes, heroManager:GetHero(i))
	end
	
	return heroes

end

function GetWayPoints(unit)

	if (not unit) then
		return { }
	end
	
	local waypoints	= { unit }
	
	if (unit.hasMovePath) then
		for i = unit.pathIndex, unit.pathCount do
			local path = unit:GetPath(i)
			if (path) then
				waypoints[#waypoints + 1] = path
			end
		end
	end
	
	return waypoints

end

---//==================================================\\---
--|| > String Class										||--
---\===================================================//---

function string.Format(string, ...)

	local arguments = { ... }
	
	for index = 1, #arguments do
		string = string:gsub("{"..tostring(index).."}", tostring(arguments[index]))
	end
	
	return string

end

function string.Equals(string, value, exact)

	if (not exact) then
		string 	= string:ToLower():Trim()
		value 	= value:ToLower():Trim()
	end

	return (string == value)

end

function string.Trim(string)

	return string:Replace("^%s*(.-)%s*$", "%1")

end

function string.Split(string, value)

	local results = { }
	
	for result in string:Match(Format("([^{1}]+)", value)) do
		table.insert(results, result)
	end
	
	return results

end

function string.Starts(string, start)

	return (string:sub(1, start:len()) == start)
   
end

function string.UrlEncode(string)

	return string:gsub("\n", "\r\n"):gsub("([^%w %-%_%.%~])", function(c)
		return string.format("%%%02X", string.byte(c))
	end):gsub(" ", "+")

end

function string.ToLower(string)

	return string:lower()

end

function string.ToUpper(string)

	return string:upper()

end

function string.Replace(string, replace, value)

	return string:gsub(replace, value)

end

function string.Match(string, value)

	return string:gmatch(value)

end

function string.IsEmpty(string)

	return (not string or (#string:Trim() == 0))

end

---//==================================================\\---
--|| > Callbacks Class									||--
---\===================================================//---

class("Callbacks")

function Callbacks:__init()

	self.__Callbacks = { }

	self:Bind("Initialize", function() self:__OnInitialize() end)

end

function Callbacks:__OnInitialize()

	AddTickCallback(function() self:Call("Tick") end)
	AddExitCallback(function() self:Call("Exit") end)
	AddUnloadCallback(function() self:Call("Unload") end)
	
	AddAnimationCallback(function(unit, animation) self:Call("Animation", unit, animation) end)
	
	AddChatCallback(function(text) self:Call("SendChat", text) end)
	AddRecvChatCallback(function(username, text) self:Call("RecieveChat", username, text) end)
	
	AddProcessSpellCallback(function(unit, spell) self:Call("ProcessSpell", unit, spell) end)
	
	AddCreateObjCallback(function(object) self:Call("CreateObject", object) end)
	AddUpdateObjCallback(function(object) self:Call("UpdateObject", object) end)
	AddDeleteObjCallback(function(object) self:Call("DeleteObject", object) end)
	
	if (SxOrb) then
		SxOrb:RegisterBeforeAttackCallback(function(target) self:Call("BeforeAttack", target) end)
		SxOrb:RegisterOnAttackCallback(function(target) self:Call("Attack", target) end)
		SxOrb:RegisterAfterAttackCallback(function(target) self:Call("AfterAttack", target) end)
	end
	
	if (VIP_USER) then
		AddSendPacketCallback(function(packet) self:Call("SendPacket", packet) end)
		AddRecvPacketCallback(function(packet) self:Call("RecvPacket", packet) end)
	end
	
end

function Callbacks:Bind(name, callback)

	if (not self.__Callbacks[name]) then
		self.__Callbacks[name] = { }
	end
	
	table.insert(self.__Callbacks[name], callback)

end

function Callbacks:Call(name, ...)

	if (self.__Callbacks[name]) then
		for i = 1, #self.__Callbacks[name] do
			self.__Callbacks[name][i](table.unpack({ ... }))
		end
	end

end

Callbacks = Callbacks()

---//==================================================\\---
--|| > ScriptManager Class								||--
---\===================================================//---

class("ScriptManager")

function ScriptManager:__init()

	AddLoadCallback(function() self:__OnLoad() end)

end

function ScriptManager:__SafeLink(url)

	return Format("{1}?rand={2}", url, math.random(1, 10000))

end

function ScriptManager:__OnLoad()

	if (not self:__CheckLatestLibraryVersion()) then
		return
	end

	if (not self:__CheckLatestScriptVersion()) then
		return
	end

	if (not self:__LoadRequiredLibraries()) then
		return
	end
	
	self:__LoadScript()
	
end

function ScriptManager:__CheckLatestLibraryVersion()

	local latest = self:GetWebResult(GodLib.__Library.Update.Host, Format("/{1}/{2}", GodLib.__Library.Update.Path, GodLib.__Library.Update.Version))
	
	if (latest and (tonumber(latest) > tonumber(GodLib.__Library.Version))) then
		DownloadFile(self:__SafeLink(Format("https://{1}/{2}/{3}", GodLib.__Library.Update.Host, GodLib.__Library.Update.Path, GodLib.__Library.Update.Script)), Format("{1}GodLib.lua", LIB_PATH:gsub("\\", "/")), function()
			PrintLocal(Format("Updated GodLib to v{1}! Please reload script (double F9).", latest))
		end)
		PrintLocal("New GodLib version available, updating...")
		return false
	end
	
	return true

end

function ScriptManager:__CheckLatestScriptVersion()

	if (GodLib.Script.Name:Equals("Untitled") or GodLib.Script.Date:Equals("Not Released")) then
		return true
	end

	local latest = self:GetWebResult(GodLib.Update.Host, Format("/{1}/{2}", GodLib.Update.Path, GodLib.Update.Version))
	
	if (latest and (tonumber(latest) > tonumber(GodLib.Script.Version))) then
		DownloadFile(self:__SafeLink(Format("https://{1}/{2}/{3}", GodLib.Update.Host, GodLib.Update.Path, GodLib.Update.Script)), Format("{1}{2}.lua", SCRIPT_PATH:gsub("\\", "/"), FILE_NAME), function()
			PrintLocal(Format("Updated to v{1}! Please reload script (double F9).", latest))
		end)
		PrintLocal("New version available, updating...")
		return false
	end
	
	return true

end

function ScriptManager:__LoadRequiredLibraries()

	local missing	= false
	local downloads	= 0
	
	for library, url in pairs(GodLib.RequiredLibraries) do
		local path = Format("{1}{2}.lua", LIB_PATH, library)
		if (not FileExist(path)) then
			missing = true
			downloads = downloads + 1
			DownloadFile(url, path, function()
				downloads = downloads - 1
				if (downloads == 0) then
					PrintLocal("Required libraries download successfully! Please reload script (double F9).")
				end
			end)
		end
	end
	
	if (missing) then
		PrintLocal("Downloading required libraries, please wait...")
		return false
	end
	
	for library, _ in pairs(GodLib.RequiredLibraries) do
		require(library)
	end
	
	return true

end

function ScriptManager:__SetupScriptStatus()

	if (not GodLib.Script.Key) then
		return
	end
	
	assert(load(Base64Decode("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"), nil, "bt", _ENV))()
	ScriptStatus(GodLib.Script.Key) 

end

function ScriptManager:__CheckForSAC()

	if (_G.AutoCarry) then
		FoundSAC = true
		Callbacks:Call("FoundSAC")
	elseif (_G.Reborn_Loaded) then
		DelayAction(function()
			self:__CheckForSAC()
		end, 5)
	end

end

function ScriptManager:__LoadScript()

	self:__SetupScriptStatus()

	Callbacks:Call("Overrides")
	Callbacks:Call("Initialize")
	
	self:__CheckForSAC()

end

function ScriptManager:GetWebResult(host, path)

	local result = GetWebResult(host, self:__SafeLink(path))
	
	if (result and (#result > 0)) then
		if (host:Equals("raw.github.com") or host:Equals("raw.githubusercontent")) then
			if (not result:Equals("Not Found")) then
				return result:sub(1, #result - 1)
			end
		else
			return result
		end
	end
	
	return nil

end

function ScriptManager:GetAsyncWebResult(host, path, callback)

	GetAsyncWebResult(host, self:__SafeLink(path), function(result)
		if (result and (#result > 0)) then
			if (host:Equals("raw.github.com") or host:Equals("raw.githubusercontent")) then
				if (not result:Equals("Not Found")) then
					callback(result:sub(1, #result - 1))
				end
			else
				callback(result)
			end
		end
	end)

end

ScriptManager = ScriptManager()

---//==================================================\\---
--|| > DrawManager Class								||--
---\===================================================//---

class("DrawManager")

function DrawManager:__init()

	self.Colors			= { }

	self.__Config		= nil
	
	self.__ColorValues	= {
		[01]			= { Name = "White",       Value = ARGB(255, 255, 255, 255) },
		[02]			= { Name = "Light Blue",  Value = ARGB(255, 128, 192, 255) },
		[03]			= { Name = "Blue",        Value = ARGB(255, 0, 0, 255) },
		[04]			= { Name = "Dark Blue",   Value = ARGB(255, 0, 0, 128) },
		[05]			= { Name = "Yellow",      Value = ARGB(255, 255, 255, 0) },
		[06]			= { Name = "Lime",        Value = ARGB(255, 128, 255, 0) },
		[07]			= { Name = "Light Green", Value = ARGB(255, 128, 255, 128) },
		[08]			= { Name = "Green",       Value = ARGB(255, 0, 255, 0) },
		[09]			= { Name = "Dark Green",  Value = ARGB(255, 0, 128, 0) },
		[10]			= { Name = "Magenta",     Value = ARGB(255, 255, 0, 255) },
		[11]			= { Name = "Red",         Value = ARGB(255, 255, 0, 0) },
		[12]			= { Name = "Dark Red",    Value = ARGB(255, 128, 0, 0) },
		[13]			= { Name = "Cyan",        Value = ARGB(255, 0, 255, 255) },
		[14]			= { Name = "Gray",        Value = ARGB(255, 128, 128, 128) },
		[15]			= { Name = "Brown",       Value = ARGB(255, 96, 48, 0) },
		[16]			= { Name = "Orange",      Value = ARGB(255, 255, 128, 0) },
		[17]			= { Name = "Purple",      Value = ARGB(255, 192, 0, 255) },
	}

	for i = 1, #self.__ColorValues do
		table.insert(self.Colors, self.__ColorValues[i].Name)
	end

end

function DrawManager:__ParseColor(color)
	
	if (type(color) == "string") then
		color = self:GetColorIndex(color)
	end

	if (type(color) == "number") then
		color = self:GetColor(color)
	end

	return color

end

function DrawManager:__LowFPSDrawCircle(x, y, z, range, color)

	local v1	= Vector(x, y, z)
	local v2	= Vector(cameraPos.x, cameraPos.y, cameraPos.z)
	
	local tPos	= v1 - (v1 - v2):normalized() * range
	local sPos	= WorldToScreen(D3DXVECTOR3(tPos.x, tPos.y, tPos.z))
	
	if (OnScreen({ x = sPos.x, y = sPos.y }, { x = sPos.x, y = sPos.y })) then
	
		local width 		= self.__Config.Width
		local chordlength	= self.__Config.Quality
		local quality		= math.max(8, math.round(180 / math.deg(math.asin(chordlength / (2 * range)))))
		
		quality 			= 2 * math.pi / quality
		range 				= range * 0.92
		
		local points 		= { }
		
		for theta = 0, (2 * math.pi + quality), quality do
			local point = WorldToScreen(D3DXVECTOR3(x + range * math.cos(theta), y, z - range * math.sin(theta)))
			points[#points + 1] = D3DXVECTOR2(point.x, point.y)
		end
		
		DrawLines2(points, width, color)
		
	end

end

function DrawManager:__OnDraw()

	if (not self.__Config or self.__Config.Disabled) then
		return
	end

	Callbacks:Call("Draw")

end

function DrawManager:LoadToMenu(config)

	config:Toggle("Disabled", "Disable all Drawing", false)
	config:Separator()
	config:Toggle("LowFPS", "Use Low FPS Drawing", false)
	config:Slider("Width", "Circle Width", 1, 1, 10)
	config:Slider("Quality", "Circle Quality", 75, 75, 500)
	
	self.__Config = config

end

function DrawManager:GetColor(index)

	if (type(index) == "number") then
		if (self.__ColorValues[index]) then
			return self.__ColorValues[index].Value
		else
			return index
		end
	elseif (type(index) == "string") then
		return self.__ColorValues[self:GetColorIndex(index)].Value
	end

end

function DrawManager:GetColorIndex(name)

	for index, color in ipairs(self.__ColorValues) do
		if (color.Name:Equals(name)) then
			return index
		end
	end

end

function DrawManager:DrawCircle(x, y, z, range, color)

	color = self:__ParseColor(color)

	if (self.__Config and self.__Config.LowFPS) then
		self:__LowFPSDrawCircle(x, y, z, range, color)
	else
		DrawCircle(x, y, z, range, color)
	end

end

function DrawManager:DrawCircleAt(vector, range, color)

	self:DrawCircle(vector.x, vector.y, vector.z, range, color)

end

function DrawManager:DrawText(text, size, x, y, color)

	DrawText(text, size, x, y, self:__ParseColor(color))
	
end

function DrawManager:DrawTextWithBorder(text, size, x, y, color, border)

	color 	= self:__ParseColor(color)
	border	= border or ARGB(255, 0, 0, 0)

	self:DrawText(text, size, x + 1, y, border)
	self:DrawText(text, size, x - 1, y, border)
	self:DrawText(text, size, x, y - 1, border)
	self:DrawText(text, size, x, y + 1, border)
	
	self:DrawText(text, size, x, y, color)

end

function DrawManager:DrawLine(points, width, color)

	local width	= width or 1
	local color	= (color and self:__ParseColor(color)) or ARGB(255, 0, 0, 0)

	DrawLines2(points, width, color)

end

function DrawManager:DrawCircleMinimap(x, y, z, radius, color, width, quality)

	color = self:__ParseColor(color)
	
	DrawCircleMinimap(x, y, z, radius, width, color, quality)

end

function DrawManager:DrawCircleMinimapAt(vector, radius, color, width, quality)

	self:DrawCircleMinimap(vector.x, vector.y, vector.z, radius, color, width, quality)

end

DrawManager = DrawManager()

---//==================================================\\---
--|| > TickManager Class								||--
---\===================================================//---

class("TickManager")

function TickManager:__init()

	self.__Config		= nil
	self.__Callbacks	= { }
	
	self:Add("Draw", "Draw Refresh Rate", 100, nil)
	
	Callbacks:Bind("Initialize", function() self:__OnInitialize() end)

end

function TickManager:__OnInitialize()
	
	Callbacks:Bind("Tick", function() self:__OnTick() end)
	AddDrawCallback(function() self:__OnDraw() end)

end

function TickManager:__OnTick()

	if (self.__Config and self.__Config.Reset) then
		DelayAction(function()
			self:ResetValues()
			self.__Config.Reset = false
		end, 0.1)
		return
	end

	for name, data in pairs(self.__Callbacks) do
		if (self.__Config) then
			data.TicksPerSecond = self.__Config[Format("Callback{1}", name)]
		end
		if (data.Callback and (not self.__Config or not self.__Config.Enabled or self:IsReady(name))) then
			data:Callback()
		end
	end

end

function TickManager:__OnDraw()

	if (not self.__Config or not self.__Config.Enabled or self:IsReady("Draw")) then
		DrawManager:__OnDraw()
	end

end

function TickManager:Add(name, title, default, callback)

	self.__Callbacks[name]	= {
		Title				= title,
		Default				= default,
		TicksPerSecond		= default,
		LastClock			= 0,
		Callback			= callback,
	}

end

function TickManager:LoadToMenu(config)

	config:Toggle("Enabled", "Enable Tick Manager", false)
	config:Toggle("Reset", "Reset TPS Values", false)
	config:Separator()
	config:Note("Value equals Ticks/Second (TPS).")
	config:Note("Recommended draw refresh rate is 80.")
	config:Separator()
	
	for name, data in pairs(self.__Callbacks) do
		config:Slider(Format("Callback{1}", name), data.Title, data.Default, 1, 500)
	end
	
	config.Reset	= false
	self.__Config	= config

end

function TickManager:IsReady(name)

	local timer		= GetGameTimer()
	local data		= self.__Callbacks[name]
	
	if (timer <= (data.LastClock + (1 / data.TicksPerSecond))) then
		return false
	end
	
	data.LastClock	= timer
	return true

end

function TickManager:ResetValues()
	
	for name, data in pairs(self.__Callbacks) do
		self.__Config[Format("Callback{1}", name)] = data.Default
	end
	
	self.__Config:save()

end

TickManager = TickManager()

---//==================================================\\---
--|| > PriorityManager Class							||--
---\===================================================//---

class("PriorityManager")

function PriorityManager:__init()

	self.EnemyCount			= #GetEnemyHeroes()
	
	self.__PriorityTable	= {
		["ADC"]				= { "Ashe", "Caitlyn", "Corki", "Draven", "Ezreal", "Graves", "Jayce", "Jinx", "KogMaw", "Lucian", "MasterYi", "MissFortune", "Pantheon", "Quinn", "Shaco", "Sivir", "Talon","Tryndamere", "Tristana", "Twitch", "Urgot", "Varus", "Vayne", "Yasuo","Zed" },
		["APC"]				= { "Annie", "Ahri", "Akali", "Anivia", "Annie", "Brand", "Cassiopeia", "Diana", "Evelynn", "FiddleSticks", "Fizz", "Gragas", "Heimerdinger", "Karthus", "Kassadin", "Katarina", "Kayle", "Kennen", "Leblanc", "Lissandra", "Lux", "Malzahar", "Mordekaiser", "Morgana", "Nidalee", "Orianna", "Ryze", "Sion", "Swain", "Syndra", "Teemo", "TwistedFate", "Veigar", "Viktor", "Vladimir", "Xerath", "Ziggs", "Zyra" },
		["Support"]			= { "Alistar", "Blitzcrank", "Janna", "Karma", "Leona", "Lulu", "Nami", "Nunu", "Sona", "Soraka", "Taric", "Thresh", "Zilean", "Braum" },
		["Bruiser"]			= { "Aatrox", "Darius", "Elise", "Fiora", "Gangplank", "Garen", "Gnar", "Irelia", "JarvanIV", "Jax", "Khazix", "LeeSin", "Nocturne", "Olaf", "Poppy", "Renekton", "Rengar", "Riven", "Rumble", "Shyvana", "Trundle", "Udyr", "Vi", "MonkeyKing", "XinZhao" },
		["Tank"]			= { "Amumu", "Chogath", "DrMundo", "Galio", "Hecarim", "Malphite", "Maokai", "Nasus", "Rammus", "Sejuani", "Nautilus", "Shen", "Singed", "Skarner", "Volibear", "Warwick", "Yorick", "Zac" }
	}
	
	self.__PriorityOrder	= {
		[1]					= { 5, 5, 5, 5, 5 },
        [2]					= { 5, 5, 4, 4, 4 },
        [3]					= { 5, 5, 4, 3, 3 },
		[4]					= { 5, 4, 3, 2, 2 },
        [5]					= { 5, 4, 3, 2, 1 },
    }
	
	self.__PriorityIndex	= {
		["ADC"]				= 1,
		["APC"]				= 2,
		["Support"]			= 3,
		["Bruiser"]			= 4,
		["Tank"]			= 5,
	}

end

function PriorityManager:GetRecommendedPriority(target)

	if (table.contains(self.__PriorityTable.ADC, target.charName)) then
		return self.__PriorityOrder[self.EnemyCount][self.__PriorityIndex.ADC]
	end

	if (table.contains(self.__PriorityTable.APC, target.charName)) then
		return self.__PriorityOrder[self.EnemyCount][self.__PriorityIndex.APC]
	end

	if (table.contains(self.__PriorityTable.Support, target.charName)) then
		return self.__PriorityOrder[self.EnemyCount][self.__PriorityIndex.Support]
	end

	if (table.contains(self.__PriorityTable.Bruiser, target.charName)) then
		return self.__PriorityOrder[self.EnemyCount][self.__PriorityIndex.Bruiser]
	end

	if (table.contains(self.__PriorityTable.Tank, target.charName)) then
		return self.__PriorityOrder[self.EnemyCount][self.__PriorityIndex.Tank]
	end
	
	PrintLocal(Format("Could not find enemy in priority table: {1}", target.charName), MessageType.Warning)
	return 1

end

PriorityManager = PriorityManager()

---//==================================================\\---
--|| > Player Class										||--
---\===================================================//---

class("Player")

function Player:__init()

	Callbacks:Bind("Initialize", function() self:__OnInitialize() end)

end

function Player:__OnInitialize()

	if (SxOrb) then
	
		self.IsAttacking = false
		
		Callbacks:Bind("Attack", function() self.IsAttacking = true end)
		Callbacks:Bind("AfterAttack", function() self.IsAttacking = false end)
		
	end

end

function Player:GetCooldownReduction()

	return (myHero.cdr * -1)

end

function Player:GetLevel()

	return myHero.level

end

function Player:DisableAttacks()

	if (SxOrb) then
		SxOrb:DisableAttacks()
	end
	
	if (FoundSAC) then
		_G.AutoCarry.MyHero:AttacksEnabled(false)
	end

end

function Player:EnableAttacks()

	if (SxOrb) then
		SxOrb:EnableAttacks()
	end

	if (FoundSAC) then
		_G.AutoCarry.MyHero:AttacksEnabled(true)
	end

end

function Player:DisableMovement()

	if (SxOrb) then
		SxOrb:DisableMove()
	end

	if (FoundSAC) then
		_G.AutoCarry.MyHero:MovementEnabled(false)
	end

end

function Player:EnableMovement()

	if (SxOrb) then
		SxOrb:EnableMove()
	end
	
	if (FoundSAC) then
		_G.AutoCarry.MyHero:MovementEnabled(true)
	end

end

Player = Player()

---//==================================================\\---
--|| > VisualDebugger Class								||--
---\===================================================//---

class "VisualDebugger"

function VisualDebugger:__init()

	self.__Config	= nil
	self.__Groups	= { }

end

function VisualDebugger:Group(name, text)

	self.__Groups[name] = { Text = text, Variables = { } }

end

function VisualDebugger:Variable(group, text, result)

	if (self.__Groups[group]) then
		table.insert(self.__Groups[group].Variables, { Text = text, Result = result, Value = "" })
	end

end

function VisualDebugger:LoadToMenu(config)

	local groupFound = false
	for name, group in pairs(self.__Groups) do
		groupFound = true
		local name = Format("Group{1}", name)
		config:Menu(name, Format("Group: {1}", group.Text))
		local variableFound = false
		for i = 1, #group.Variables do
			variableFound = true
			local variable = group.Variables[i]
			config[name]:Toggle(Format("Variable{1}", i), variable.Text, true)
		end
		if (not variableFound) then
			config:Note("No debug variables found.")
		end
		config[name]:Separator()
		config[name]:Toggle("Enabled", "Group Enabled", true)
	end
	if (not groupFound) then
		config:Note("No debug groups found.")
	end
	
	config:Separator()
	config:Toggle("Enabled", "Debugger Enabled", false)
	config:Note("Updates as fast as draw TPS.")
	config:Separator()
	config:Slider("PositionX", "Horizontal Alignment (X)", 75, 0, 2000)
	config:Slider("PositionY", "Vertical Alignment (Y)", 75, 0, 2000)
	config:Separator()
	config:Slider("Size", "Text Size", 15, 10, 30)
	config:DropDown("Color", "Text Color", 1, DrawManager.Colors)
	
	self.__Config = config

	Callbacks:Bind("Draw", function() self:__OnDraw() end)

end

function VisualDebugger:__OnDraw()

	if (not self.__Config.Enabled) then
		return
	end

	local posX 	= self.__Config.PositionX
	local posY 	= self.__Config.PositionY
	local size 	= self.__Config.Size
	local color	= self.__Config.Color
	
	for name, group in pairs(self.__Groups) do
		local name = Format("Group{1}", name)
		if (self.__Config[name].Enabled) then
			DrawManager:DrawText(Format("---------- {1} ----------", group.Text), size, posX, posY, color)
			posY = posY + size
			for i = 1, #group.Variables do
				local var = Format("Variable{1}", i)
				local variable = group.Variables[i]
				if (self.__Config[name][var]) then
					local value = nil
					if (type(variable.Result) == "function") then
						value = variable:Result()
					else
						value = variable.Result
					end
					if (type(value) == "table") then
						variable.Value = table.tostring(value)
					else
						variable.Value = tostring(value)
					end
					DrawManager:DrawText(Format("{1} = {2}", variable.Text, variable.Value), size, posX, posY, color)
					posY = posY + size
				end
			end
			posY = posY + size
		end
	end

end

---//==================================================\\---
--|| > MenuConfig Class									||--
---\===================================================//---

function MenuConfig(name, title)
	
	return scriptConfig(title, name)

end

function scriptConfig:Menu(name, title)

	self:addSubMenu(title, name)

end

function scriptConfig:Separator()

	self:addParam("nil", "-------------------------------------------------------------------", SCRIPT_PARAM_INFO, "")

end

function scriptConfig:Info(info, value)

	local name = Format("Info{1}", info:gsub(" ", ""))

	if (type(value) ~= "string") then
		value = tostring(value)
	end
	
	self:addParam(name, Format("{1}:", info), SCRIPT_PARAM_INFO, value)

end

function scriptConfig:Note(note)

	self:addParam("nil", Format("Note: {1}", note), SCRIPT_PARAM_INFO, "")

end

function scriptConfig:Toggle(name, title, default, force)

	self:addParam(name, title, SCRIPT_PARAM_ONOFF, default)
	
	if (force ~= nil) then
		self[name] = default
	end

end

function scriptConfig:DropDown(name, title, default, list, force)

	self:addParam(name, Format("{1}:", title), SCRIPT_PARAM_LIST, default, list)
	
	if (force ~= nil) then
		self[name] = default
	end

end

function scriptConfig:Slider(name, title, default, mininum, maximum, force)

	self:addParam(name, Format("{1}:", title), SCRIPT_PARAM_SLICE, default, mininum, maximum)
	
	if (force ~= nil) then
		self[name] = default
	end

end

function scriptConfig:KeyBinding(name, title, default, key, force)

	if (type(key) == "string") then
		key = string.byte(key)
	end

	self:addParam(name, title, SCRIPT_PARAM_ONKEYDOWN, default, key)
	
	if (force ~= nil) then
		self[name] = default
	end

end

function scriptConfig:KeyToggle(name, title, default, key, force)

	if (type(key == "string")) then
		key = string.byte(key)
	end

	self:addParam(name, title, SCRIPT_PARAM_ONKEYTOGGLE, default, key)
	
	if (force ~= nil) then
		self[name] = default
	end

end

---//==================================================\\---
--|| > SpellData Class									||--
---\===================================================//---

class("SpellData")

function SpellData:__init(key, range, name, id)

	self.Key		= key
	self.Range		= range or 0
	self.Name		= name
	
	self.Type		= nil
	self.Width		= 0
	self.Delay		= 0
	self.Speed		= 0
	self.Collision	= false
	
	self.__Id		= id or __SpellData.Ids[self.Key]
	self.__Base		= Spell(self.Key, 0)
	
	self:SetRange(self:GetRange())

end

function SpellData:GetRange()

	if (type(self.Range) == "function") then
		return self.Range(myHero.level)
	elseif (type(self.Range) == "table") then
		return self.Range[myHero.level]
	else
		return self.Range
	end

end

function SpellData:GetMaxRange()

	if (self.Type == SKILLSHOT_CIRCULAR) then
		return self:GetRange() + self.Width
	else
		return self:GetRange()
	end

end

function SpellData:SetRange(range)

	self.__Base:SetRange(range)
	
	return self

end

function SpellData:SetSkillshot(type, width, delay, speed, collision)

	if (not __SpellData.Prediction) then
		__SpellData.Prediction = VPrediction()
	end

	self.Type		= type
	self.Width		= width or 0
	self.Delay		= delay or 0
	self.Speed		= speed or 0
	self.Collision	= collision or false

	self.__Base:SetSkillshot(__SpellData.Prediction, type, width, delay, speed, collision)
	
	return self

end

function SpellData:SetAOE(use, radius, targets)

	self.__Base:SetAOE(use, radius, targets)
	
	return self

end

function SpellData:SetSourcePosition(position)

	self.__Base:SetSourcePosition(position)
	return self

end

function SpellData:IsReady()
	
	return self.__Base:IsReady()

end

function SpellData:InRange(target)
	
	self:SetRange(self:GetMaxRange())
	return self.__Base:IsInRange(target)

end

function SpellData:Cast(param1, param2)
	
	self:SetRange(self:GetRange())
	return self.__Base:Cast(param1, param2)

end

function SpellData:CastAt(position)

	return self:Cast(position.x, position.z)

end

function SpellData:CastIfImmobile(target)
	
	self:SetRange(self:GetRange())
	return self.__Base:CastIfImmobile(target)

end

function SpellData:GetPrediction(target)
	
	self:SetRange(self:GetRange())
	return self.__Base:GetPrediction(target)

end

function SpellData:IsValid(target)

	return (IsValid(target) and self:InRange(target))

end

function SpellData:WillKill(unit)

	return (getDmg(self.__Id, unit, myHero) >= unit.health)

end

function SpellData:GetLevel()

	return myHero:GetSpellData(self.Key).level

end

function SpellData:GetCooldown()

	return myHero:GetSpellData(self.Key).cd

end

function SpellData:GetCurrentCooldown()

	return myHero:GetSpellData(self.Key).currentCd

end

function SpellData:GetCost()

	return myHero:GetSpellData(self.Key).mana

end

function SpellData:GetName()

	return myHero:GetSpellData(self.Key).name

end

function SpellData:HaveEnoughMana()

	return (myHero.mana >= self:GetCost())

end

---//==================================================\\---
--|| > Override Functions								||--
---\===================================================//---

Callbacks:Bind("Overrides", function()

	function OnGainBuff(unit, buff)
	
		Callbacks:Call("GainBuff", unit, buff)
	
	end
	
	function OnLoseBuff(unit, buff)
	
		Callbacks:Call("LoseBuff", unit, buff)
	
	end

	function SimpleTS:IsValid(target, range, _)
	
		return IsValid(target, math.sqrt(range))

	end

	function SimpleTS:LoadToMenu(config)
	
		config:Menu("STS", "Enemy Priorities")
	
		local modelist	= { }
		for _, mode in ipairs(STS_AVAILABLE_MODES) do
			table.insert(modelist, mode.name)
		end
		
		config:Separator()
		config:DropDown("mode", "Targetting Mode", 1, modelist)
		config.mode 	= Selector.mode.id
		
		config:Separator()
		config:Toggle("Selected", "Focus Selected Target", true)
		
		config:Separator()
		config:Toggle("Recommended", "Recommended Priorities", true)
		config:Note("Requires reload.")
		GetSave(ScriptName).RecommendedPriorities = config.Recommended
		
		local oneEnemy 	= false
		for _, enemy in ipairs(GetEnemyHeroes()) do
			oneEnemy = true
			config.STS:Slider(enemy.charName, enemy.charName, 1, 1, 5)
			DelayAction(function()
				if (GetSave(ScriptName).RecommendedPriorities) then
					config.STS[enemy.charName] = PriorityManager:GetRecommendedPriority(enemy)
				end
			end)
		end
		if (oneEnemy) then
			config.STS:Separator()
			config.STS:Note("5 is highest priority")
		else
			config.STS:Note("No enemies found!")
		end
		
		self.menu 	= config
		STS_MENU 	= self.menu
	
	end
	
	function AntiGapcloser:__init()
	
		self.__ActiveSpells	= { }
	
	end
	
	function AntiGapcloser:__OnProcessSpell(unit, spell)
	
		if (not self.__Config.Enabled) then
			return
		end
		
		if (IsEnemy(unit) and GapcloserSpells[spell.name]) then
			if (self.__Config[spell.name:gsub("_", "")]) then
				local add 		= false
				local startPos	= nil
				local endPos	= nil
				if (spell.target and spell.target.isMe) then
					add			= true
					startPos	= Vector(unit.visionPos)
					endPos		= myHero
				elseif (not spell.target) then
					local endPos1	= (Vector(unit.visionPos) + 300 * (Vector(spell.endPos) - Vector(unit.visionPos))):normalized()
					local endPos2	= (Vector(unit.visionPos) + 100 * (Vector(spell.endPos) - Vector(unit.visionPos))):normalized()
					if ((GetDistance(myHero.visionPos, unit.visionPos) > GetDistance(myHero.visionPos, endPos1)) or (GetDistance(myHero.visionPos, unit.visionPos) > GetDistance(myHero.visionPos, endPos2))) then
						add = true
					end
				end
				if (add) then
					local data	= {
						unit		= unit,
						spell		= spell.name,
						startT		= GetTickCount(),
						endT		= GetTickCount() + 1,
						startPos	= startPos,
						endPos		= endPos,
					}
					table.insert(self.__ActiveSpells, data)
					Callbacks:Call("GapcloserSpell", data.unit, data)
				end
			end
		end
	
	end
	
	function AntiGapcloser:__OnTick()
	
		for i = #self.__ActiveSpells, 1, -1 do
			if ((self.__ActiveSpells[i].endT - GetTickCount()) > 0) then
				Callbacks:Call("GapcloserSpell", self.__ActiveSpells[i].unit, self.__ActiveSpells[i])
			else
				table.remove(self.__ActiveSpells, i)
			end
		end
	
	end
	
	function AntiGapcloser:LoadToMenu(config)
	
		local spellAdded	= false
		local charNames		= { }
		
		for _, enemy in ipairs(GetEnemyHeroes()) do
			table.insert(charNames, enemy.charName)
		end
		
		config:Toggle("Enabled", "Enabled", true)
		config:Separator()
		
		for spellName, charName in pairs(GapcloserSpells) do
			if (table.contains(charNames, charName)) then
				config:Toggle(spellName:gsub("_", ""), Format("{1} - {2}", charName, spellName), true)
				spellAdded = true
			end
		end
	
		if (not spellAdded) then
			config:Note("No spell available to interrupt.")
		end
		
		self.__Config		= config
		
		TickManager:Add("AntiGapcloser", "AntiGapcloser Tick Rate", 500, function() self:__OnTick() end)
		Callbacks:Bind("ProcessSpell", function(unit, spell) self:__OnProcessSpell(unit, spell) end)
	
	end
	
	function Interrupter:__init()
	
		self.__ActiveSpells	= { }
	
	end
	
	function Interrupter:__OnProcessSpell(unit, spell)
	
		if (not self.__Config.Enabled) then
			return
		end
		
		if (IsEnemy(unit) and InterruptableSpells[spell.name]) then
			local spellData = InterruptableSpells[spell.name]
			if (self.__Config[spell.name:gsub("_", "")]) then
				local data		= {
					unit		= unit,
					DangerLevel	= spellData.DangerLevel,
					endT		= GetTickCount() + spellData.MaxDuration,
					CanMove		= spellData.CanMove,
				}
				table.insert(self.__ActiveSpells, data)
				Callbacks:Call("InterruptableSpell", data.unit, data)
			end
		end
	
	end
	
	function Interrupter:__OnTick()
	
		for i = #self.__ActiveSpells, 1, -1 do
			local data = self.__ActiveSpells[i]
			if (data.endT - GetTickCount() > 0) then
				Callbacks:Call("InterruptableSpell", data.unit, data)
			else
				table.remove(self.__ActiveSpells, i)
			end
		end
	
	end
	
	function Interrupter:LoadToMenu(config)
	
		local spellAdded	= false
		local charNames		= { }
		
		for _, enemy in ipairs(GetEnemyHeroes()) do
			table.insert(charNames, enemy.charName)
		end
		
		config:Toggle("Enabled", "Enabled", true)
		config:Separator()
		
		for spellName, data in pairs(InterruptableSpells) do
			if (table.contains(charNames, data.charName)) then
				config:Toggle(spellName:gsub("_", ""), Format("{1} - {2}", data.charName, spellName), true)
				spellAdded = true
			end
		end
	
		if (not spellAdded) then
			config:Note("No spell available to interrupt.")
		end
		
		self.__Config		= config
		
		TickManager:Add("Interrupter", "Interrupter Tick Rate", 500, function() self:__OnTick() end)
		Callbacks:Bind("ProcessSpell", function(unit, spell) self:__OnProcessSpell(unit, spell) end)
	
	end
	
	if (SxOrb) then

		function SxOrbWalk:LoadToMenu(config, keys, selector)
		
			if (myHero.range == 0.5) then
				DelayAction(function()
				  self:LoadToMenu(config)
				end)
				return
			end
			
			if (self.LoadedToMenu) then
				return
			end
			
			config:Menu("General", "Settings: General")
			if ((keys == nil) or keys) then
				config:Menu("Keys", "Settings: Keys")
			end
			config:Menu("Farm", "Settings: Farming")
			config:Menu("Mastery", "Settings: Masteries")
			config:Menu("Draw", "Settings: Drawing")
			
			config.General:Toggle("Enabled", "OrbWalker Enabled", true)
			config.General:Separator()
			config.General:Toggle("StopMove", "Stop Move When Mouse Above Hero", false)
			config.General:Slider("StopMoveSlider", "Range to Stop Move", 100, 50, 500)
			
			if ((keys == nil) or keys) then
				config.Keys:KeyBinding("Fight", "Auto-Carry Mode", false, 32)
				config.Keys:KeyBinding("Harass", "Mixed Mode", false, "C")
				config.Keys:KeyBinding("LaneClear", "Lane-Clear Mode", false, "X")
				config.Keys:KeyBinding("LastHit", "Last-Hit Mode", false, "V")
			else
				self.NoMenuKeys = true
			end
			
			config.Farm:Toggle("FarmOverHarass", "Focus Farm Over Harass", true)
			config.Farm:Separator()
			config.Farm:Slider("ExtraDelay", "Extra Delay to Last-Hit", 0, 0, 150)
			
			config.Mastery:Toggle("Butcher", "Butcher", true)
			config.Mastery:Toggle("ArcaneBlade", "Arcane Blade", true)
			config.Mastery:Toggle("Havoc", "Havoc", true)
			config.Mastery:Slider("DevastatingStrikes", "Devastating Strikes", 0, 0, 3)
			
			config.Draw:Toggle("EnemyAARange", "Draw Enemy Auto-Attack Range", true)
			config.Draw:Separator()
			config.Draw:Toggle("MinionCircle", "Draw Last-Hit Circe Around Minions", true)
			config.Draw:Toggle("MinionLine", "Draw Last-Hit Line on Minions", true)
			
			config:Separator()
			
			config:Info("Author", "Aroc")
			config:Info("Name", "SxOrbWalk")
			config:Info("Version", self.Version)
			
			config.Mastery.Butcher 				= false
			config.Mastery.ArcaneBlade 			= false
			config.Mastery.Havoc 				= false
			config.Mastery.DevastatingStrikes	= 0
			
			if ((selector == nil) or selector) then
				self.TS 		= TargetSelector(TARGET_LESS_CAST_PRIORITY, self:GetMyRange(), DAMAGE_PHYSICAL, false)
				config:addTS(self.TS)
			else
				self.NoSelector	= true
				self.TS 		= { range = 0, target = nil }
			end
			
			self.SxOrbMenu						= config
			
			if (not _G.SxOrbMenu) then
				_G.SxOrbMenu 		= self.SxOrbMenu
				_G.SxOrbMenu.Mode	= { }
				TickManager:Add("SxOrb", "Orbwalker Tick Rate", 100, function()
					self:Tick()
					if (not self.NoSelector) then
						self.TS:update()
					end
					self:CalcKillableMinion()
					self:CleanMinionAttacks()
					self:HotKeyCallback()
					self.Minions:update()
					self.OwnMinions:update()
					self.LaneClearMinions:update()
					self.JungleMinions:update()
					self.OtherMinions:update()
				end)
				Callbacks:Bind("Draw", function()
					self:Draw()
				end)
				Callbacks:Bind("ProcessSpell", function(unit, spell)
					self:OnMinionAttack(unit, spell)
					self:OnSelfAction(unit, spell)
				end)
				Callbacks:Bind("RecvPacket", function(packet)
					self:RecvAACancel(packet)
				end)
				Callbacks:Bind("CreateObj", function(object)
					self:BonusDamageObj(object)
					self:OnCreateObj(object)
				end)
				Callbacks:Bind("DeleteObj", function(object)
					self:OnDeleteObj(object)
				end)
				Callbacks:Bind("FoundSAC", function()
					self.SxOrbMenu.General.Enabled = false
					table.insert(self.SxOrbMenu.General._param, 2, {
						var		= "nil",
						text	= "Note: SAC has been found!",
						pType	= SCRIPT_PARAM_INFO,
					})
					PrintLocal("Sida's Auto Carry found! Disabled SxOrbWalk.")
				end)
			end

		end
		
		function SxOrbWalk:GetMyRange()
		
			return myHero.range + GetDistance(myHero.minBBox) - 20
		  
		end
		
	end
		
end)
