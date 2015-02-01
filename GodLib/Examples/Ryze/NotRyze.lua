--[[

---//==================================================\\---
--|| > About Script										||--
---\===================================================//---

	Script:			GodLib Example Script
	Version:		0.01
	Script Date:	2015-01-30
	Author:			Devn

--]]

-- Temporary Anti-AFK
function OnTick()
	if (not ANTI_AFK or (ANTI_AFK <= GetGameTimer())) then
		ANTI_AFK = GetGameTimer() + 40
		local position = myHero + (Vector(mousePos) - myHero):normalized() * 250
		myHero:MoveTo(position.x, position.z)
	end
end

---//==================================================\\---
--|| > User Variables									||--
---\===================================================//---

-- Public user variables.
_G.NotRyze_AutoUpdate			= true
_G.NotRyze_EnableDebugMode		= false

---//==================================================\\---
--|| > Initialization									||--
---\===================================================//---

-- Champion check.
if (not myHero.charName == "Ryze") then return end

-- Load GodLib.
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
if (not GodLib) then return end

-- Update variables.
GodLib.Update.Host				= "raw.github.com"								-- The host used to check update files. Not required, will not update without it.
GodLib.Update.Path				= "DevnBoL/Scripts/master/GodLib/Examples/Ryze"	-- The path to where update files are checked from. Leave empty if no path is needed.
GodLib.Update.Version			= "Current.version"								-- Path to the version file. Not required, will not update without it. Ex. of version file: 0.01
GodLib.Update.Script			= "NotRyze.lua"									-- Path to the script file. Not required, will not update without it.

-- Script variables.
GodLib.Script.Variables			= "NotRyze"										-- Used to locate user variables above. Not required, will use script name if not set.
GodLib.Script.Champion			= "Ryze"										-- Used to display champion names properly. Not required. Ex: Kog'Maw
GodLib.Script.Name 				= "NotRyze"										-- Anything characters can be entered here.
GodLib.Script.Version			= "0.01"										-- For simplicity it is recommended you keep the format (0.00).
GodLib.Script.Date				= "2015-01-31"									-- Not required but helps people know how updated your script is.

-- Print variables.
GodLib.Print.Title				= "Example Ryze Script"							-- Changes the title text used when printing messages. Not required, will use script name if not set.
GodLib.Print.Colors.Title		= "8183F7"										-- Changes the title color used when printing messages. Not required.
GodLib.Print.Colors.Info		= "BEF781"										-- Changes the "Info" message color used when printing messages. Not required.
GodLib.Print.Colors.Warning		= "F781BE"										-- Changes the "Warning" message color used when printing messages. Not required.
GodLib.Print.Colors.Error		= "F78183"										-- Changes the "Error" message color used when printing messages. Not required.
GodLib.Print.Colors.Debug		= "81BEF7"										-- Changes the "Debug" message color used when printing messages. Not required.

-- Required libraries.
GodLib.RequiredLibraries		= {												-- For the default loaded libraries please refer the forum thread.
	["SxOrbWalk"]				= "https://raw.githubusercontent.com/Superx321/BoL/master/common/SxOrbWalk.lua",
}

---//==================================================\\---
--|| > Callback Handlers								||--
---\===================================================//---

Callbacks:Bind("Initialize", function()											-- For a list of all callbacks please refer to the forum thread.

	SetupVariables()
	SetupDebugger()
	SetupConfig()
	
	PrintLocal(Format("Script v{1} loaded successfully!", ScriptVersion))	-- For more global functions please refer to the forum thread.

	ScriptManager:GetAsyncWebResult(GodLib.Update.Host, Format("/{1}/{2}", GodLib.Update.Path, "Message.txt"), function(message)
		PrintLocal(message)
	end)
	
end)

Callbacks:Bind("Draw", function()

	if (not myHero.dead) then													-- Recommended for script readability.
		--OnDrawRanges(Config.Drawing)
	end

end)

---//==================================================\\---
--|| > Script Setup										||--
---\===================================================//---

function SetupVariables()
	
	Spells			= {
		[_Q]		= SpellData(_Q, 625, "Overload"),							-- Spell name is not required but makes for easy access.
		[_W]		= SpellData(_W, 600, "Rune Prison"),
		[_E]		= SpellData(_E, 600, "Spell Flux"),
		[_R]		= SpellData(_R, nil, "Desperate Power"),					-- It is recommended to use nil if spell has no range for SpellData to properly handle casting.
	}
	
	CurrentTarget	= nil
	
	Config			= MenuConfig("NotRyze", ScriptName)							-- For more global variables please refer to forum thread.
	Selector		= SimpleTS(STS_LESS_CAST)
	
	TickManager:Add("Combo", "Combo Mode", 100, function() OnComboMode(Config.Combo) end)
	TickManager:Add("Killsteal", "Killsteal", 100, function() OnKillsteal(Config.Killstealing) end)
	TickManager:Add("UpdateTarget", "Update Current Target", 100, OnUpdateTarget)
	
end

function SetupDebugger()

	if (not EnableDebugMode) then
		return
	end

	Debugger = VisualDebugger()
	
	Debugger:Group("Variables", "Variables")
	Debugger:Variable("Variables", "Current Target", function() return (CurrentTarget and CurrentTarget.charName or "No target") end)

	Debugger:Group("Spells", "Hero Spells")
	Debugger:Variable("Spells", Format("{1} (Q)", Spells[_Q].Name), function() return Spells[_Q]:IsReady() end)
	Debugger:Variable("Spells", Format("{1} (W)", Spells[_W].Name), function() return Spells[_W]:IsReady() end)
	Debugger:Variable("Spells", Format("{1} (E)", Spells[_E].Name), function() return Spells[_E]:IsReady() end)
	Debugger:Variable("Spells", Format("{1} (R)", Spells[_R].Name), function() return Spells[_R]:IsReady() end)

end

function SetupConfig()

	Config:Menu("Orbwalker", "Settings: Orbwalker")
	Config:Menu("Selector", "Settings: Target Selector")
	Config:Menu("Combo", "Settings: Combo Mode")
	Config:Menu("Killstealing", "Settings: Killstealing")
	Config:Menu("Drawing", "Settings: Drawing")
	Config:Menu("TickManager", "Settings: Tick Manager")
	Config:Separator()
	Config:Info("Version", ScriptVersion)
	Config:Info("Build Date", ScriptDate)
	Config:Info("Author", "Devn")
	
	SxOrb:LoadToMenu(Config.Orbwalker, true, false)							-- For more custom functions please refer to the forum thread.
	Selector:LoadToMenu(Config.Selector)
	SetupConfig_Combo(Config.Combo)
	SetupConfig_Killstealing(Config.Killstealing)
	SetupConfig_Drawing(Config.Drawing)
	TickManager:LoadToMenu(Config.TickManager)
	
	if (EnableDebugMode) then												-- Recommended so that if user doesn't want enabled it wont add it to menu.
		Config:Menu("Debugger", "Settings: Visual Debugger")
		Debugger:LoadToMenu(Config.Debugger)
	end

end

---//==================================================\\---
--|| > Config Setup										||--
---\===================================================//---

function SetupConfig_Combo(config)
	
	config:KeyBinding("Active", "Combo Mode Active", false, 32)
	config:Separator()
	config:Toggle("UseQ", Format("Use {1} (Q)", Spells[_Q].Name), true)
	config:Toggle("UseW", Format("Use {1} (W)", Spells[_W].Name), true)
	config:Toggle("UseE", Format("Use {1} (E)", Spells[_E].Name), true)
	config:Toggle("UseR", Format("Use {1} (R)", Spells[_R].Name), true)
	
end

function SetupConfig_Killstealing(config)
	
	config:Toggle("Enabled", "Enable Killstealing", true)
	config:Separator()
	config:Toggle("UseQ", Format("Use {1} (Q)", Spells[_Q].Name), true)

end

function SetupConfig_Drawing(config)

	DrawManager:LoadToMenu(config)											-- Needed to load LFC config and other drawing stuff.
	config:Separator()
	config:Toggle("Q", Format("Draw {1} (Q) Range", Spells[_Q].Name), true)
	config:DropDown("QColor", "Range Color", DrawManager:GetColorIndex("Red"), DrawManager.Colors)

end

---//==================================================\\---
--|| > Main Callback Handlers							||--
---\===================================================//---

function OnComboMode(config)

	if (myHero.dead or not config.Active or not IsValid(CurrentTarget)) then
		return
	end
	
	if (Spells[_R]:IsReady() and config.UseR and Spells[_W]:InRange(CurrentTarget)) then
		Spells[_R]:Cast()
	end
	
	if (Spells[_W]:IsReady() and config.UseW and Spells[_W]:InRange(CurrentTarget)) then
		Spells[_W]:Cast(CurrentTarget)
	end
	
	if (Spells[_Q]:IsReady() and config.UseQ and Spells[_Q]:InRange(CurrentTarget)) then
		Spells[_Q]:Cast(CurrentTarget)
	end
	
	if (Spells[_E]:IsReady() and config.UseE and Spells[_E]:InRange(CurrentTarget)) then
		Spells[_E]:Cast(CurrentTarget)
	end
	
end

function OnKillsteal(config)

	if (not config.Enable) then
		return
	end
	
	if (Spells[_Q]:IsReady() and config.UseQ) then
		for _, enemy in ipairs(GetEnemyHeroes()) do
			if (enemy and Spells[_Q]:IsValid(enemy) and Spells[_Q]:WillKill(enemy)) then
				Spells[_Q]:Cast(CurrentTarget)
				break
			end
		end
	end

end

function OnDrawRanges(config)

	if (config.Q) then
		DrawManager:DrawCircleAt(myHero, Spells[_Q].Range, config.QColor)
	end
	
end

---//==================================================\\---
--|| > Misc Callback Handlers							||--
---\===================================================//---

function OnUpdateTarget()
	
	CurrentTarget = Selector:GetTarget(Spells[_Q].Range)

end

---//==================================================\\---
--|| > Override Functions								||--
---\===================================================//---

Callbacks:Bind("Overrides", function()											-- Allows user to override global functions. Not required.

	--[[
	function SxOrb:GetTarget(range)
	
		return ((self:ValidTarget(CurrentTarget, range) and CurrentTarget) or Selector:GetTarget(Player:GetRange()))
	
	end
	--]]

end)
