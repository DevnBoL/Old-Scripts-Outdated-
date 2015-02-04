--[[

---//==================================================\\---
--|| > About Script										||--
---\===================================================//---

	Script:			Blitzcrank - The Great Golem God
	Version:		1.02
	Script Date:	2015-02-04
	Author:			Devn

---//==================================================\\---
--|| > Changelog										||--
---\===================================================//---

	Version 1.00:
		- Initial script release.
		
	Version 1.01:
		- Fixed Q skillshot for collision.
		
	Version 1.02:
		- Fixed Q skillshot width.

--]]

---//==================================================\\---
--|| > User Variables									||--
---\===================================================//---

_G.BlitzcrankGod_AutoUpdate			= true
_G.BlitzcrankGod_EnableDebugMode	= false

---//==================================================\\---
--|| > Initialization									||--
---\===================================================//---

-- Champion check.
if (myHero.charName ~= "Blitzcrank") then return end

-- Load GodLib.
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
if (not GodLib) then return end

-- Update variables.
GodLib.Update.Host			= "raw.github.com"
GodLib.Update.Path			= "DevnBoL/Scripts/master/Blitzcrank"
GodLib.Update.Version		= "Current.version"
GodLib.Update.Script		= "Blitzcrank - The Great Golem God.lua"

-- Script variables.
GodLib.Script.Variables		= "BlitzcrankGod"
GodLib.Script.Name 			= "Blitzcrank - The Great Golem God"
GodLib.Script.Version		= "1.02"
GodLib.Script.Date			= "2015-02-04"

-- Required libraries.
GodLib.RequiredLibraries	= {
	["SxOrbWalk"]			= "https://raw.githubusercontent.com/Superx321/BoL/master/common/SxOrbWalk.lua",
}

---//==================================================\\---
--|| > Callback Handlers								||--
---\===================================================//---

Callbacks:Bind("Initialize", function()

	SetupVariables()
	SetupDebugger()
	SetupConfig()
	
	PrintLocal(Format("Script v{1} loaded successfully!", ScriptVersion))

	ScriptManager:GetAsyncWebResult(GodLib.Update.Host, Format("/{1}/{2}", GodLib.Update.Path, "Message.txt"), function(message)
		PrintLocal(message)
	end)

end)

Callbacks:Bind("Draw", function()

	if (not myHero.dead) then
		OnDrawRanges(Config.Drawing)
	end

end)

Callbacks:Bind("InterruptableSpell", function(unit, data)

	if (ValidTarget(unit)) then
		if (Spells[_E]:IsReady() and Config.Interrupter.UseE and SxOrb:CanAttack() and InRange(unit, SxOrb:GetMyRange())) then
			Spells[_E]:Cast()
			SxOrb:MyAttack(unit)
		elseif (Spells[_Q]:IsReady() and Config.Interrupter.UseQ and Spells[_Q]:InRange(unit) and (data.DangerLevel >= Config.Interrupter.MinDangerLevelQ)) then
			Spells[_Q]:Cast(unit)
		elseif (Spells[_R]:IsReady() and Config.Interrupter.UseR and Spells[_R]:InRange(unit) and (data.DangerLevel >= Config.Interrupter.MinDangerLevelR)) then
			Spells[_R]:Cast()
		end
	end

end)

Callbacks:Bind("AfterAttack", function(target)

	if (ValidTarget(target) and Spells[_E]:IsReady() and (Config.Combo.E.Use > 1)) then
		if ((CurrentTarget == target) or (Config.Combo.E.Use == 3)) then
			Spells[_E]:Cast()
			SxOrb:MyAttack(target)
		end
	end

end)

---//==================================================\\---
--|| > Script Setup										||--
---\===================================================//---

function SetupVariables()
	
	Spells			= {
		[_Q]		= SpellData(_Q, 900, "Rocket Grab"),
		[_W]		= SpellData(_W, nil, "Overdrive"),
		[_E]		= SpellData(_E, nil, "Power Fist"),
		[_R]		= SpellData(_R, 600, "Static Field"),
	}
	
	CurrentTarget	= nil
	
	Config			= MenuConfig("BlitzcrankGod", ScriptName)
	Selector		= SimpleTS(STS_LESS_CAST_PHYSICAL)
	Interrupter		= Interrupter()
	
	Spells[_Q]:SetSkillshot(SKILLSHOT_LINEAR, 80, 0.25, 1800, true)
	
	TickManager:Add("Combo", "Combo Mode", 500, function() OnComboMode(Config.Combo) end)
	TickManager:Add("Harass", "Harass Mode", 500, function() OnHarassMode(Config.Harass) end)
	TickManager:Add("Killsteal", "Killsteal", 500, function() OnKillsteal(Config.Killstealing) end)
	TickManager:Add("UpdateTarget", "Update Current Target", 100, OnUpdateTarget)
	
end

function SetupDebugger()

	if (not EnableDebugMode) then
		return
	end
	
	Debugger = VisualDebugger()

	Debugger:Group("Spells", "Hero Spells")
	Debugger:Variable("Spells", Format("{1} (Q)", Spells[_Q].Name), function() return Spells[_Q]:IsReady() end)
	Debugger:Variable("Spells", Format("{1} (W)", Spells[_W].Name), function() return Spells[_W]:IsReady() end)
	Debugger:Variable("Spells", Format("{1} (E)", Spells[_E].Name), function() return Spells[_E]:IsReady() end)
	Debugger:Variable("Spells", Format("{1} (R)", Spells[_R].Name), function() return Spells[_R]:IsReady() end)

	Debugger:Group("Misc", "Misc Variables")
	Debugger:Variable("Misc", "Current Target", function() return (CurrentTarget and CurrentTarget.charName or "No target") end)
	Debugger:Variable("Misc", "Is Attacking", function() return Player.IsAttacking end)
	Debugger:Variable("Misc", "Is Evading", function() return IsEvading() end)
	
end

function SetupConfig()

	Config:Menu("Orbwalker", "Settings: Orbwalker")
	Config:Menu("Selector", "Settings: Target Selector")
	Config:Menu("Combo", "Settings: Combo Mode")
	Config:Menu("Harass", "Settings: Harass Mode")
	Config:Menu("Killstealing", "Settings: Killstealing")
	Config:Menu("Interrupter", "Settings: Auto-Interrupter")
	Config:Menu("Drawing", "Settings: Drawing")
	Config:Menu("TickManager", "Settings: Tick Manager")
	Config:Separator()
	Config:Info("Version", ScriptVersion)
	Config:Info("Build Date", ScriptDate)
	Config:Info("Author", "Devn")
	
	SxOrb:LoadToMenu(Config.Orbwalker)
	Selector:LoadToMenu(Config.Selector)
	SetupConfig_Combo(Config.Combo)
	SetupConfig_Harass(Config.Harass)
	SetupConfig_Killstealing(Config.Killstealing)
	SetupConfig_Interrupter(Config.Interrupter)
	SetupConfig_Drawing(Config.Drawing)
	TickManager:LoadToMenu(Config.TickManager)
	
	if (EnableDebugMode) then
		Config:Menu("Debugger", "Settings: Visual Debugger")
		Debugger:LoadToMenu(Config.Debugger)
	end

end

---//==================================================\\---
--|| > Config Setup										||--
---\===================================================//---

function SetupConfig_Combo(config)
	
	config:Menu("Q", Format("Spell: {1} (Q)", Spells[_Q].Name))
	config:Menu("W", Format("Spell: {1} (W)", Spells[_W].Name))
	config:Menu("E", Format("Spell: {1} (E)", Spells[_E].Name))
	config:Menu("R", Format("Spell: {1} (R)", Spells[_R].Name))
	
	config.Q:Toggle("Use", "Use Spell", true)
	config.Q:Separator()
	config.Q:Slider("MinMana", "Minimum Mana", 0, 0, 100)
	config.Q:Separator()
	config.Q:Slider("MinRange", "Minimum Distance to Grab", 250, 0, Spells[_Q].Range)
	config.Q:Slider("MaxRange", "Maximum Distance to Grab", Spells[_Q].Range, 0, Spells[_Q].Range)
	config.Q:Separator()
	for _, enemy in ipairs(GetEnemyHeroes()) do
		config.Q:Toggle(Format("Ignore{1}", enemy.charName), Format("Don't Grab {1}", enemy.charName), (PriorityManager:GetRecommendedPriority(enemy) < 3))
	end
	config.Q:Separator()
	config.Q:Slider("IgnoreRange", "Range to Check for Grabable", 1500, 0, 2000)
	config.Q:Toggle("IgnoreToggle", "Grab All if no Grabable Target", true)
	
	config.W:Toggle("Use", "Use Spell", true)
	config.W:Separator()
	config.W:Slider("MinMana", "Minimum Mana", 20, 0, 100)
	config.W:Separator()
	config.W:Slider("MinRange", "Minimum Range of Target", 0, 0, 1000)
	config.W:Slider("MaxRange", "Maximum Range of Target", 1000, Spells[_Q].Range, 2000)
	
	config.E:DropDown("Use", "Use Spell", 2, { "Disabled", "On Grab Target", "Always" })
	config.E:Separator()
	config.E:Slider("MinMana", "Minimum Mana", 0, 0, 100)
	
	config.R:Toggle("Use", "Use Spell", true)
	config.R:Separator()
	config.R:Slider("MinMana", "Minimum Mana", 0, 0, 100)
	config.R:Separator()
	config.R:Slider("MinEnemies", "Minimum Enemies to Hit", 2, 1, 5)
	
	config:Separator()
	config:KeyBinding("Active", "Combo Mode Active", false, 32)
	
end

function SetupConfig_Harass(config)
	
	config:Menu("Q", Format("Spell: {1} (Q)", Spells[_Q].Name))
	config:Menu("E", Format("Spell: {1} (E)", Spells[_E].Name))
	
	config.Q:Toggle("Use", "Use Spell", true)
	config.Q:Separator()
	config.Q:Slider("MinMana", "Minimum Mana", 0, 0, 100)
	config.Q:Separator()
	config.Q:Slider("MinRange", "Minimum Distance to Grab", 250, 0, Spells[_Q].Range)
	config.Q:Slider("MaxRange", "Maximum Distance to Grab", Spells[_Q].Range, 0, Spells[_Q].Range)
	config.Q:Separator()
	for _, enemy in ipairs(GetEnemyHeroes()) do
		config.Q:Toggle(Format("Ignore{1}", enemy.charName), Format("Don't Grab {1}", enemy.charName), (PriorityManager:GetRecommendedPriority(enemy) < 4))
	end
	config.Q:Separator()
	config.Q:Slider("IgnoreRange", "Range to Grab All Targets", 1500, 0, 2000)
	config.Q:Note("Only if no grab target within range.")
	
	config.E:DropDown("Use", "Use Spell", 2, { "Disabled", "On Grab Target", "Always" })
	config.E:Separator()
	config.E:Slider("MinMana", "Minimum Mana", 0, 0, 100)
	
	config:Separator()
	config:KeyBinding("Active", "Harass Mode Active", false, "T")

end

function SetupConfig_Killstealing(config)

	config:Toggle("Enable", "Enable Killstealing", true)
	config:Separator()
	config:Toggle("NoAllies", "Only if no Allies in Range", true)
	config:Slider("AllyRange", "Range to Search for Allies", 1000, 0, 2000)
	config:Separator()
	config:Toggle("UseQ", Format("Use {1} (Q)", Spells[_Q].Name), true)
	config:Toggle("UseR", Format("Use {1} (R)", Spells[_R].Name), true)

end

function SetupConfig_Interrupter(config)

	Interrupter:LoadToMenu(config)
	config:Separator()
	config:Toggle("UseQ", Format("Use {1} (Q)", Spells[_Q].Name), true)
	config:Slider("MinDangerLevelQ", "Minimum Danger Level", 1, 1, 5)
	config:Separator()
	config:Toggle("UseE", Format("Use {1} (E)", Spells[_E].Name), true)
	config:Separator()
	config:Toggle("UseR", Format("Use {1} (R)", Spells[_R].Name), true)
	config:Slider("MinDangerLevelR", "Minimum Danger Level", 3, 1, 5)

end

function SetupConfig_Drawing(config)

	DrawManager:LoadToMenu(config)
	config:Separator()
	config:Toggle("AA", "Draw Auto-Attack Range", true)
	config:DropDown("AAColor", "Range Color", 1, DrawManager.Colors)
	config:Separator()
	config:Toggle("Q", Format("Draw {1} (Q)", Spells[_Q].Name), true)
	config:DropDown("QColor", "Range Color", 1, DrawManager.Colors)
	config:Separator()
	config:Toggle("R", Format("Draw {1} (R)", Spells[_R].Name), true)
	config:DropDown("RColor", "Range Color", 1, DrawManager.Colors)
	
end

---//==================================================\\---
--|| > Main Callback Handlers							||--
---\===================================================//---

function OnComboMode(config)

	if (myHero.dead or IsEvading() or Player.IsAttacking or not config.Active) then
		return
	end

	if (Spells[_Q]:IsReady() and config.Q.Use and HaveEnoughMana(config.Q.MinMana) and Spells[_Q]:IsValid(CurrentTarget)) then
		if (not InRange(CurrentTarget, config.Q.MinRange) and InRange(CurrentTarget, config.Q.MaxRange)) then
			if (config.Q[Format("Ignore{1}", CurrentTarget.hash)]) then
				if (config.Q.IgnoreToggle) then
					local target = Selector:GetTarget(config.Q.IgnoreRange)
					if (not target or (target == CurrentTarget)) then
						Spells[_Q]:Cast(CurrentTarget)
					end
				end
			else
				Spells[_Q]:Cast(CurrentTarget)
			end
		end
	end
	
	if (Spells[_E]:IsReady() and (config.E.Use > 1) and HaveEnoughMana(config.E.MinMana)) then
		if (CurrentTarget and UnitHasBuff(CurrentTarget, "RocketGrab")) then
			Spells[_E]:Cast()
			SxOrb:MyAttack(CurrentTarget)
		elseif (config.E.Use == 2) then
			local target = Selector:GetTarget(SxOrb:GetMyRange())
			if (IsValid(target)) then
				Spells[_E]:Cast()
				SxOrb:MyAttack(target)
			end
		end
	end
	
	if (CurrentTarget and Spells[_W]:IsReady() and config.W.Use and HaveEnoughMana(config.W.MinMana) and not InRange(CurrentTarget, config.W.MinRange) and InRange(CurrentTarget, config.W.MaxRange)) then
		Spells[_W]:Cast()
	end
	
	if (Spells[_R]:IsReady() and config.R.Use and HaveEnoughMana(config.R.MinMana) and (#GetEnemiesInRange(Spells[_R].Range) >= config.R.MinEnemies)) then
		Spells[_R]:Cast()
	end
	
end

function OnHarassMode(config)

	if (myHero.dead or IsEvading() or Player.IsAttacking or not config.Active) then
		return
	end

	if (Spells[_Q]:IsReady() and config.Q.Use and HaveEnoughMana(config.Q.MinMana) and Spells[_Q]:IsValid(CurrentTarget)) then
		if (not InRange(CurrentTarget, config.Q.MinRange) and InRange(CurrentTarget, config.Q.MaxRange)) then
			if (config.Q[Format("Ignore{1}", CurrentTarget.hash)]) then
				if (config.Q.IgnoreToggle) then
					if (not Selector:GetTarget(config.Q.IgnoreRange)) then
						Spells[_Q]:Cast(CurrentTarget)
					end
				end
			else
				Spells[_Q]:Cast(CurrentTarget)
			end
		end
	end
	
	if (Spells[_E]:IsReady() and (config.E.Use > 1) and HaveEnoughMana(config.E.MinMana)) then
		if (CurrentTarget and UnitHasBuff(CurrentTarget, "RocketGrab")) then
			Spells[_E]:Cast()
			SxOrb:MyAttack(CurrentTarget)
		elseif (config.E.Use == 2) then
			local target = Selector:GetTarget(SxOrb:GetMyRange())
			if (IsValid(target)) then
				Spells[_E]:Cast()
				SxOrb:MyAttack(target)
			end
		end
	end
	
end

function OnKillsteal(config)

	if (not config.Enable) then
		return
	end
	
	if (config.NoAllies and (#GetAlliesInRange(config.AllyRange) > 0)) then
		return
	end
	
	for _, enemy in ipairs(GetEnemyHeroes()) do
		if (IsValid(enemy, Spells[_Q].Range)) then
			if (Spells[_Q]:IsReady() and config.UseQ and Spells[_Q]:InRange(enemy) and Spells[_Q]:WillKill(enemy)) then
				Spells[_Q]:Cast(enemy)
			end
			if (Spells[_R]:IsReady() and config.UseR and Spells[_R]:InRange(enemy) and Spells[_R]:WillKill(enemy)) then
				Spells[_R]:Cast(enemy)
			end
		end
	end

end

function OnDrawRanges(config)

	if (config.AA) then
		DrawManager:DrawCircleAt(myHero, SxOrb:GetMyRange(), config.AAColor)
	end

	if (config.Q) then
		DrawManager:DrawCircleAt(myHero, Spells[_Q].Range, config.QColor)
	end

	if (config.R) then
		DrawManager:DrawCircleAt(myHero, Spells[_R].Range, config.RColor)
	end
	
end

---//==================================================\\---
--|| > Misc Callback Handlers							||--
---\===================================================//---

function OnUpdateTarget()

	CurrentTarget = Selector:GetTarget(Spells[_Q].Range)

end
