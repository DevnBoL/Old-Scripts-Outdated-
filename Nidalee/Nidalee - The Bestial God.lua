--[[

---//==================================================\\---
--|| > About Script										||--
---\===================================================//---

	Script:			Nidalee - The Bestial God
	Version:		1.03
	Script Date:	2015-02-06
	Author:			Devn

---//==================================================\\---
--|| > Changelog										||--
---\===================================================//---

	Version 1.00:
		- Initial script release.
		
	Version 1.01:
		- Changed around pounce logic for combo mode.
		- Changed form swapping logic for combo mode.
		- Fixed killstealing during cougar mode.
		- Add key for ScriptStatus.net.
		
	Version 1.02:
		- Updated to use new GodLib.
		
	Version 1.03:
		- Added auto-attack check (won't cancel AA to cast spells).
		- Added evading check (won't attempt to cast spells while using Evadee or FGE).
		- Fixed pounce range checking.
		- Added lane clear mode.
		- Added jungle clear mode.
		- Added auto-heal.
		- Added PermaShow menu.

--]]

---//==================================================\\---
--|| > User Variables									||--
---\===================================================//---

_G.NidaleeGod_AutoUpdate			= false
_G.NidaleeGod_EnableDebugMode		= true

---//==================================================\\---
--|| > Initialization									||--
---\===================================================//---

-- Champion check.
if (myHero.charName ~= "Nidalee") then return end

-- Load GodLib.
assert(load(Base64Decode("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"), nil, "bt", _ENV))()
if (not GodLib) then return end

-- Update variables.
GodLib.Update.Host				= "raw.github.com"
GodLib.Update.Path				= "DevnBoL/Scripts/master/Nidalee"
GodLib.Update.Version			= "Current.version"
GodLib.Update.Script			= "Nidalee - The Bestial God.lua"

-- Script variables.
GodLib.Script.Variables			= "NidaleeGod"
GodLib.Script.Name 				= "Nidalee - The Bestial God"
GodLib.Script.Version			= "1.03"
GodLib.Script.Date				= "2015-02-06"
GodLib.Script.Key				= "VILJJPJJIPN"

-- Required libraries.
GodLib.RequiredLibraries		= {
	["SxOrbWalk"]				= "https://raw.githubusercontent.com/Superx321/BoL/master/common/SxOrbWalk.lua",
	["CustomPermaShow"]			= "https://raw.githubusercontent.com/Superx321/BoL/master/common/CustomPermaShow.lua",
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

Callbacks:Bind("ProcessSpell", function(unit, spell)

	if (unit.isMe) then
		OnUpdateCooldowns(spell)
	end

end)

Callbacks:Bind("Draw", function()

	OnDrawPermaShow(Config.Drawing)

	if (not myHero.dead) then
		OnDrawRanges(Config.Drawing)
	end

end)

Callbacks:Bind("Attack", function(target)

	if (CougarForm and Config.Combo.Active and Config.Combo.UseQCougar and Spells.Cougar[_Q]:IsReady() and target and IsValid(target)) then
		Spells.Cougar[_Q]:Cast()
		SxOrb:MyAttack(target)
	end

end)

Callbacks:Bind("Tick", function()

	if (not CougarForm and not HumanRange) then
		DelayAction(function()
			HumanRange = SxOrb:GetMyRange()
		end)
	elseif (CougarForm and not CougarRange) then
		DelayAction(function()
			CougarRange = SxOrb:GetMyRange()
		end)
	end

end)

---//==================================================\\---
--|| > Script Setup										||--
---\===================================================//---

function SetupVariables()
	
	Spells			= {
		["Human"]	= {
			[_Q]	= SpellData(_Q, 1500, "Javelin Toss"),
			[_W]	= SpellData(_W, 900, "Bushwhack"),
			[_E]	= SpellData(_E, 650, "Primal Surge"),
		},
		["Cougar"]	= {
			[_Q]	= SpellData(_Q, 325, "Takedown", "QM"),
			[_W]	= SpellData(_W, 375, "Pounce", "WM"),
			[_E]	= SpellData(_E, 300, "Swipe", "EM"),
		},
		[_R]		= SpellData(_R, nil, "Aspect of the Cougar"),
	}

	Cooldowns		= {
		["Human"]	= {
			[_Q]	= 0,
			[_W]	= 0,
			[_E]	= 0,
		},
		["Cougar"]	= {
			[_Q]	= 0,
			[_W]	= 0,
			[_E]	= 0,
		},
	}
	
	SpellReady		= {
		["Human"]	= {
			[_Q]	= false,
			[_W]	= false,
			[_E]	= false,
		},
		["Cougar"]	= {
			[_Q]	= false,
			[_W]	= false,
			[_E]	= false,
		}
	}
	
	Minions			= {
		Enemy		= minionManager(MINION_ENEMY, Spells.Human[_Q].Range, myHero, MINION_SORT_HEALTH_ASC),
		Jungle		= minionManager(MINION_JUNGLE, Spells.Human[_Q].Range, myHero, MINION_SORT_MAXHEALTH_DEC),
	}
	
	CurrentTarget	= nil
	HumanRange		= nil
	CougarRange		= nil
	
	ExtendedPounce	= 760
	
	Config			= MenuConfig(GodLib.Script.Variables, ScriptName)
	Selector		= SimpleTS(STS_LESS_CAST_MAGIC)
	
	Spells.Human[_Q]:SetSkillshot(SKILLSHOT_LINEAR, 40, 0.5, 1300, true)
	Spells.Human[_W]:SetSkillshot(SKILLSHOT_CIRCULAR, 100, 0.5, 1500, false)
	
	Spells.Cougar[_W]:SetSkillshot(SKILLSHOT_CIRCULAR, 95, 0.5, 1500, false)
	Spells.Cougar[_E]:SetSkillshot(SKILLSHOT_CONE, 375, 0.5, 1500, false)
	
	OnUpdateCougarForm()
	
	TickManager:Add("Combo", "Combo Mode", 500, function() OnComboMode(Config.Combo) end)
	TickManager:Add("Harass", "Harass Mode", 500, function() OnHarassMode(Config.Harass) end)
	--TickManager:Add("LastHit", "Last Hit Mode", 500, function() OnLastHit(Config.LastHit) end)
	TickManager:Add("LaneClear", "Lane Clear Mode", 500, function() OnLaneClear(Config.LaneClear) end)
	TickManager:Add("JungleClear", "Jungle Clear Mode", 500, function() OnJungleClear(Config.JungleClear) end)
	TickManager:Add("AutoHeal", "Auto-Heal", 500, function() OnAutoHeal(Config.AutoHeal) end)
	TickManager:Add("Killsteal", "Killsteal", 500, function() OnKillsteal(Config.Killstealing) end)
	TickManager:Add("UpdateTarget", "Update Current Target", 500, OnUpdateTarget)
	TickManager:Add("UpdateCougarForm", "Update Cougar Form", 500, OnUpdateCougarForm)
	TickManager:Add("ProcessCooldowns", "Process Cooldowns", 500, OnProcessCooldowns)
	
end

function SetupDebugger()

	if (not EnableDebugMode) then
		return
	end
	
	Debugger = VisualDebugger()

	Debugger:Group("SpellsHuman", "Hero Spells (Human)")
	Debugger:Variable("SpellsHuman", Format("{1} (Q)", Spells.Human[_Q].Name), function() return (SpellReady.Human[_Q]) end)
	Debugger:Variable("SpellsHuman", Format("{1} (W)", Spells.Human[_W].Name), function() return (SpellReady.Human[_W]) end)
	Debugger:Variable("SpellsHuman", Format("{1} (E)", Spells.Human[_E].Name), function() return (SpellReady.Human[_E]) end)
	Debugger:Variable("SpellsHuman", Format("{1} (R)", Spells[_R].Name), function() return Spells[_R]:IsReady() end)

	Debugger:Group("SpellsCougar", "Hero Spells (Cougar)")
	Debugger:Variable("SpellsCougar", Format("{1} (Q)", Spells.Cougar[_Q].Name), function() return (SpellReady.Cougar[_Q]) end)
	Debugger:Variable("SpellsCougar", Format("{1} (W)", Spells.Cougar[_W].Name), function() return (SpellReady.Cougar[_W]) end)
	Debugger:Variable("SpellsCougar", Format("{1} (E)", Spells.Cougar[_E].Name), function() return (SpellReady.Cougar[_E]) end)

	Debugger:Group("Misc", "Misc Variables")
	Debugger:Variable("Misc", "Cougar Form", function() return CougarForm end)
	Debugger:Variable("Misc", "Is Attacking", function() return Player.IsAttacking end)
	Debugger:Variable("Misc", "Is Evading", function() return IsEvading() end)
	
end

function SetupConfig()

	Config:Menu("Orbwalker", "Settings: Orbwalker")
	Config:Menu("Selector", "Settings: Target Selector")
	Config:Menu("Combo", "Settings: Combo Mode")
	Config:Menu("Harass", "Settings: Harass Mode")
	--Config:Menu("LastHit", "Settings: Last Hit Mode")
	Config:Menu("LaneClear", "Settings: Lane Clear Mode")
	Config:Menu("JungleClear", "Settings: Jungle Clear Mode")
	Config:Menu("AutoHeal", "Settings: Auto-Heal")
	Config:Menu("Killstealing", "Settings: Killstealing")
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
	--SetupConfig_LastHit(Config.LastHit)
	SetupConfig_LaneClear(Config.LaneClear)
	SetupConfig_JungleClear(Config.JungleClear)
	SetupConfig_AutoHeal(Config.AutoHeal)
	SetupConfig_Killstealing(Config.Killstealing)
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
	
	config:KeyBinding("Active", "Combo Mode Active", false, 32)
	config:Separator()
	config:Toggle("UseQHuman", Format("Use {1} (Q)", Spells.Human[_Q].Name), true)
	config:Toggle("UseQCougar", Format("Use {1} (Q)", Spells.Cougar[_Q].Name), true)
	config:Separator()
	config:DropDown("UseWHuman", Format("Use {1} (W)", Spells.Human[_W].Name), 2, { "Always", "On Inmobile", "Disabled" })
	config:DropDown("UseWCougar", Format("Use {1} (W)", Spells.Cougar[_W].Name), 2, { "Always", "If out of AA Range", "Disabled" })
	config:Separator()
	config:Toggle("UseECougar", Format("Use {1} (E)", Spells.Cougar[_Q].Name), true)
	config:Separator()
	config:Toggle("UseR", Format("Use {1} (R)", Spells[_R].Name), true)
	
end

function SetupConfig_Harass(config)
	
	config:KeyBinding("Active", "Harass Mode Active", false, "T")
	config:Separator()
	config:Toggle("UseQHuman", Format("Use {1} (Q)", Spells.Human[_Q].Name), true)
	config:Slider("MinManaQHuman", "Minimum Mana", 35, 0, 100)

end

function SetupConfig_LastHit(config)

	config:Menu("Human", "Spells: Human Form")
	config:Menu("Cougar", "Spells: Cougar Form")
	
	config.Human:Toggle("UseQ", Format("Use {1} (Q)", Spells.Human[_Q].Name), true)
	config.Human:Slider("MinManaQ", "Minimum Mana Percent", 50, 0, 100)
	
	config.Cougar:Toggle("UseQ", Format("Use {1} (Q)", Spells.Cougar[_Q].Name), true)
	config.Cougar:Toggle("UseW", Format("Use {1} (W)", Spells.Cougar[_W].Name), true)
	config.Cougar:Toggle("UseE", Format("Use {1} (E)", Spells.Cougar[_E].Name), true)
	
	config:Separator()
	config:KeyBinding("Active", "Last Hit Mode Active", false, "Z")
	config:Separator()
	config:Toggle("UseR", Format("Use {1} (R)", Spells[_R].Name), false)

end

function SetupConfig_LaneClear(config)
	
	config:KeyBinding("Active", "Lane Clear Mode Active", false, "C")
	config:Separator()
	config:Toggle("UseQ", Format("Use {1} (Q)", Spells.Cougar[_Q].Name), true)
	config:Toggle("UseW", Format("Use {1} (W)", Spells.Cougar[_W].Name), true)
	config:Toggle("UseE", Format("Use {1} (E)", Spells.Cougar[_E].Name), true)
	config:Toggle("UseR", Format("Use {1} (R)", Spells[_R].Name), false)

end

function SetupConfig_JungleClear(config)

	config:Menu("Human", "Spells: Human Form")
	config:Menu("Cougar", "Spells: Cougar Form")
	
	config.Human:Toggle("UseQ", Format("Use {1} (Q)", Spells.Human[_Q].Name), true)
	config.Human:Slider("MinManaQ", "Minimum Mana Percent", 0, 0, 100)
	config.Human:Separator()
	config.Human:Toggle("UseW", Format("Use {1} (W)", Spells.Human[_W].Name), true)
	config.Human:Slider("MinManaW", "Minimum Mana Percent", 0, 0, 100)
	config.Human:Separator()
	config.Human:DropDown("UseE", Format("Use {1} (E)", Spells.Human[_E].Name), 1, { "If Have Blue Buff", "Always", "Disabled" })
	config.Human:Slider("MinManaE", "Minimum Mana Percent", 0, 0, 100)
	config.Human:Note("Only if doesn't have blue buff.")
	
	config.Cougar:Toggle("UseQ", Format("Use {1} (Q)", Spells.Cougar[_Q].Name), true)
	config.Cougar:Toggle("UseW", Format("Use {1} (W)", Spells.Cougar[_W].Name), true)
	config.Cougar:Toggle("UseE", Format("Use {1} (E)", Spells.Cougar[_E].Name), true)
	
	config:Separator()
	config:KeyBinding("Active", "Jungle Clear Mode Active", false, "X")
	config:Separator()
	config:Toggle("UseR", Format("Use {1} (R)", Spells[_R].Name), true)

end

function SetupConfig_AutoHeal(config)

	config:Menu("Allies", "Settings: Ally Heroes")
	
	local foundAlly = false
	local allies	= GetAllyHeroes()
	
	for i = 1, #allies do
		foundAlly	= true
		local ally	= allies[i]
		config:Toggle(Format("{1}Enabled", ally.charName), Format("Heal {1}", ally.charName), true)
		config:Slider(Format("{1}MinHealth", ally.charName), "Minimum Health Percent", 40, 0, 100)
		config:Slider(Format("{1}MinMana", ally.charName), "Minimum Mana Percent", 35, 0, 100)
		if (i < #allies) then
			config:Separator()
		end
	end
	
	if (not foundAlly) then
		config.Allies:Note("No ally heroes found.")
	end
	
	config:Separator()
	config:Toggle("Enabled", "Enable Auto-Healing", true)
	config:Separator()
	config:Toggle("Self", "Heal Self", true)
	config:Slider("MinHealth", "Minimum Health Percent", 50, 0, 100)
	config:Slider("MinMana", "Minimum Mana Percent", 30, 0, 100)

end

function SetupConfig_Killstealing(config)

	config:Toggle("Enable", "Enable Killstealing", true)
	config:Separator()
	config:Toggle("UseQHuman", Format("Use {1} (Q)", Spells.Human[_Q].Name), true)
	config:Toggle("AutoR", "Auto Switch Form to KS", true)

end

function SetupConfig_Drawing(config)

	DrawManager:LoadToMenu(config)
	config:Separator()
	config:Toggle("PermaShow", "Show Perma Show Menu", true)
	config:DropDown("PermaShowColor", "Perma Show Color", DrawManager:GetColorIndex("Dark Green"), DrawManager.Colors)
	config:Separator()
	config:Toggle("AA", "Draw Auto-Attack Range", true)
	config:DropDown("AAColor", "Range Color", 1, DrawManager.Colors)
	config:Separator()
	config:Toggle("Cooldowns", "Draw Opposite Form Cooldowns", true)
	config:DropDown("CooldownsColor", "Text Color", 1, DrawManager.Colors)
	config:Separator()
	config:Toggle("QRange", Format("Draw {1} (Q) Range", Spells.Human[_Q].Name), true)
	config:DropDown("QRangeColor", "Range Color", 1, DrawManager.Colors)
	
end

---//==================================================\\---
--|| > Main Callback Handlers							||--
---\===================================================//---

function OnComboMode(config)

	if (myHero.dead or not config.Active or IsEvading() or Player.IsAttacking or not IsValid(CurrentTarget, 1500)) then
		return
	end
	
	if (CougarForm) then
		if (Spells.Cougar[_Q]:IsReady() and config.UseQCougar and Spells.Cougar[_Q]:InRange(CurrentTarget)) then
			Spells.Cougar[_Q]:Cast()
			SxOrb:MyAttack(CurrentTarget)
		end
		if (Spells.Cougar[_W]:IsReady() and (config.UseWCougar < 3)) then
			if ((config.UseWCougar == 1) or ((config.UseWCougar == 2) and not InRange(CurrentTarget, SxOrb:GetMyRange()))) then
				if (InPounceRange(CurrentTarget)) then
					Spells.Cougar[_W]:CastAt(CurrentTarget)
				elseif (TargetHunted(CurrentTarget) and InRange(CurrentTarget, ExtendedPounce)) then
					Spells.Cougar[_W]:CastAt(CurrentTarget)
				end
			end
		end
		if (Spells.Cougar[_E]:IsReady() and config.UseECougar and Spells.Cougar[_E]:IsValid(CurrentTarget)) then
			Spells.Cougar[_E]:CastAt(CurrentTarget)
		end
		if (Spells[_R]:IsReady() and config.UseR) then
			if (SpellReady.Human[_Q]) then
				if (CurrentTarget.health <= CougarDamage(CurrentTarget) and InRange(CurrentTarget, (Spells.Cougar[_E].Range + Spells.Cougar[_W].Range))) then
					return
				end
				local _, hitchance, _ = Spells.Human[_Q]:GetPrediction(CurrentTarget)
				if (hitchance >= 2) then
					Spells[_R]:Cast()
				end
			end
			if (not Spells.Cougar[_Q]:IsReady() and not Spells.Cougar[_W]:IsReady() and not Spells.Cougar[_E]:IsReady() and not InPounceRange(CurrentTarget)) then
				Spells[_R]:Cast()
			end
		end
	else
		if (Spells.Human[_Q]:IsReady() and config.UseQHuman and Spells.Human[_Q]:IsValid(CurrentTarget)) then
			Spells.Human[_Q]:Cast(CurrentTarget)
		end
		if (Spells.Human[_W]:IsReady() and (config.UseWHuman < 3) and Spells.Human[_W]:InRange(CurrentTarget)) then
			if (config.UseWHuman == 1) then
				Spells.Human[_W]:Cast(CurrentTarget)
			elseif (config.UseWHuman == 2) then
				Spells.Human[_W]:CastIfImmobile(CurrentTarget)
			end
		end
		if (Spells[_R]:IsReady() and config.UseR) then
			local first = false
			local swap = false
			if (Spells.Human[_Q]:IsReady()) then
				local _, hitchance, _ = Spells.Human[_Q]:GetPrediction(CurrentTarget)
				if (hitchance < 2) then
					first = true
				end
			else
				first = true
			end
			if (first) then
				if (SpellReady.Cougar[_W]) then
					if (InPounceRange(CurrentTarget)) then
						swap = true
					elseif (TargetHunted(CurrentTarget) and InRange(CurrentTarget, ExtendedPounce)) then
						swap = true
					end
				end
				if (SpellReady.Cougar[_Q] and Spells.Cougar[_Q]:InRange(CurrentTarget)) then
					swap = true
				elseif (SpellReady.Cougar[_E] and Spells.Cougar[_E]:InRange(CurrentTarget)) then
					swap = true
				end
				if (swap) then
					Spells[_R]:Cast()
				end
			end
		end
	end
	
end

function OnHarassMode(config)

	if (myHero.dead or not config.Active or IsEvading() or Player.IsAttacking or not IsValid(CurrentTarget, 1500)) then
		return
	end
	
	if (not CougarForm and config.UseQHuman and Spells.Human[_Q]:IsReady() and HaveEnoughMana(config.MinManaQHuman)) then
		Spells.Human[_Q]:Cast(CurrentTarget)
	end

end

--[[ Disabled while I do some further testing, changes forms to late and misses creeps.
function OnLastHit(config)

	if (myHero.dead or not config.Active or IsEvading() or Player.IsAttacking) then
		return
	end
	
	Minions.Enemy:update()
	
	local function CheckMinion(minion)
		if (not CougarForm) then
			if (WillKill(minion, "AD") and SxOrb:CanAttack() and InRange(minion, SxOrb:GetMyRange())) then
				SxOrb:MyAttack(minion)
				return
			end
			if (config.Human.UseQ and Spells.Human[_Q]:IsReady() and Spells.Human[_Q]:InRange(minion) and HaveEnoughMana(config.Human.MinManaQ) and Spells.Human[_Q]:WillKill(minion) and Spells.Human[_Q]:WillHit(minion) and not InRange(minion, SxOrb:GetMyRange())) then
				Spells.Human[_Q]:Cast(minion)
				return
			end
			if (config.UseR and Spells[_R]:IsReady()) then
				if (config.Cougar.UseQ and SpellReady.Cougar[_Q] and Spells.Cougar[_Q]:InRange(minion) and Spells.Cougar[_Q]:WillKill(minion)) then
					Spells[_R]:Cast()
					return
				end
				if (config.Cougar.UseE and SpellReady.Cougar[_E] and Spells.Cougar[_E]:InRange(minion) and Spells.Cougar[_E]:WillKill(minion)) then
					Spells[_R]:Cast()
					return
				end
				if (config.Cougar.UseW and SpellReady.Cougar[_W] and InPounceRange(minion) and Spells.Cougar[_W]:WillKill(minion)) then
					Spells[_R]:Cast()
					return
				end
			end
		else
			if (WillKill(minion, "AD") and SxOrb:CanAttack() and InRange(minion, SxOrb:GetMyRange())) then
				SxOrb:MyAttack(minion)
				return
			end
			if (config.Cougar.UseQ and Spells.Cougar[_Q]:IsReady() and Spells.Cougar[_Q]:WillKill(minion) and Spells.Cougar[_Q]:InRange(minion)) then
				CastTakedown(minion)
				return
			end
			if (config.Cougar.UseE and Spells.Cougar[_E]:IsReady() and Spells.Cougar[_E]:WillKill(minion) and Spells.Cougar[_E]:InRange(minion)) then
				Spells.Cougar[_E]:CastAt(minion)
				return
			end
			if (config.Cougar.UseW and Spells.Cougar[_W]:IsReady() and Spells.Cougar[_W]:WillKill(minion) and InPounceRange(minion)) then
				Spells.Cougar[_W]:CastAt(minion)
				return
			end
			if (config.UseR and Spells[_R]:IsReady()) then
				if (not InRange(minion, SxOrb:GetMyRange()) and InRange(minion, HumanRange) and WillKill(minion, "AD") and SxOrb:CanAttack()) then
					Spells[_R]:Cast()
					return
				end
				if (config.Human.UseQ and SpellReady.Human[_Q] and HaveEnoughMana(config.Human.MinManaQ) and Spells.Human[_Q]:InRange(minion) and Spells.Human[_Q]:WillKill(minion) and Spells.Human[_Q]:WillHit(minion) and not InRange(minion, HumanRange)) then
					Spells.Human[_Q]:Cast(minion)
					return
				end
			end
		end
	end
	
	for i = 1, #Minions.Enemy.objects do
		CheckMinion(Minions.Enemy.objects[i])
	end
	
end
--]]

function OnLaneClear(config)

	if (myHero.dead or not config.Active or IsEvading() or Player.IsAttacking) then
		return
	end
	
	Minions.Enemy:update()
	
	if (#Minions.Enemy.objects == 0) then
		return
	end
	
	local function CheckMinion(minion)
		if (not CougarForm) then
			if (WillKill(minion, "AD") and SxOrb:CanAttack() and InRange(minion, SxOrb:GetMyRange())) then
				SxOrb:MyAttack(minion) --|> Should automatically attack the minion through lane clear mode.
				return
			end
			if (config.UseR and Spells[_R]:IsReady()) then
				if (config.UseW and SpellReady.Cougar[_W] and InPounceRange(minion)) then
					Spells[_R]:Cast()
					return
				end
				if (config.UseE and SpellReady.Cougar[_E] and Spells.Cougar[_E]:InRange(minion)) then
					Spells[_R]:Cast()
					return
				end
				if (config.UseQ and SpellReady.Cougar[_Q] and Spells.Cougar[_Q]:InRange(minion) and Spells.Cougar[_Q]:WillKill(minion)) then
					Spells[_R]:Cast()
					return
				end
			end
		else
			if (SxOrb:CanAttack() and WillKill(minion, "AD") and InRange(minion, SxOrb:GetMyRange())) then
				SxOrb:MyAttack(minion) --|> Should automatically attack minion through lane clear mode.
				return
			end
			if (config.UseW and Spells.Cougar[_W]:IsReady() and Spells.Cougar[_W]:WillKill(minion) and InPounceRange(minion)) then
				Spells.Cougar[_W]:CastAt(minion)
				return
			end
			if (config.UseE and Spells.Cougar[_E]:IsReady() and Spells.Cougar[_E]:WillKill(minion) and Spells.Cougar[_E]:InRange(minion)) then
				Spells.Cougar[_E]:Cast(minion)
				return
			end
			if (config.UseQ and Spells.Cougar[_Q]:IsReady() and Spells.Cougar[_Q]:WillKill(minion) and Spells.Cougar[_Q]:InRange(minion)) then
				CastTakedown(minion)
				return
			end
			if (SxOrb:CanAttack() and WillKill(minion, "AD") and config.UseR and Spells[_R]:IsReady() and not InRange(minion, SxOrb:GetMyRange()) and InRange(minion, HumanRange)) then
				Spells[_R]:Cast()
				return
			end
		end
	end
	
	for i = 1, #Minions.Enemy.objects do
		CheckMinion(Minions.Enemy.objects[i])
	end
	
	if (CougarForm) then
		for i = 1, #Minions.Enemy.objects do
			local minion = Minions.Enemy.objects[i]
			if (config.UseW and Spells.Cougar[_W]:IsReady() and InPounceRange(minion)) then
				Spells.Cougar[_W]:CastAt(minion)
			end
			if (config.UseE and Spells.Cougar[_E]:IsReady() and Spells.Cougar[_E]:InRange(minion)) then
				Spells.Cougar[_E]:Cast(minion)
			end
		end
	end

end

function OnJungleClear(config)

	if (myHero.dead or not config.Active or IsEvading() or Player.IsAttacking) then
		return
	end

	Minions.Jungle:update()
	
	if (#Minions.Jungle.objects == 0) then
		return
	end
	
	local function CheckMinion(minion)
		if (not CougarForm) then
			if (WillKill(minion, "AD") and SxOrb:CanAttack() and InRange(minion, SxOrb:GetMyRange())) then
				SxOrb:MyAttack(minion)
				return
			end
			if (config.UseR and Spells[_R]:IsReady() and (config.Cougar.UseQ or config.Cougar.UseW or config.Cougar.UseE)) then
				if (config.Cougar.UseQ and SpellReady.Cougar[_Q] and Spells.Cougar[_Q]:WillKill(minion) and Spells.Cougar[_Q]:InRange(minion)) then
					Spells[_R]:Cast()
					return
				end
				if (config.Cougar.UseE and SpellReady.Cougar[_E] and Spells.Cougar[_E]:WillKill(minion) and Spells.Cougar[_E]:InRange(minion)) then
					Spells[_R]:Cast()
					return
				end
				if (config.Cougar.UseW and SpellReady.Cougar[_W] and Spells.Cougar[_W]:WillKill(minion)) then
					if (InPounceRange(minion)) then
						Spells[_R]:Cast()
						return
					elseif (TargetHunted(minion) and InRange(minion, ExtendedPounce)) then
						Spells[_R]:Cast()
						return
					end
				end
			end
		else
			if (WillKill(minion, "AD") and SxOrb:CanAttack() and InRange(minion, SxOrb:GetMyRange())) then
				SxOrb:MyAttack(minion)
				return
			end
			if (config.Cougar.UseQ and Spells.Cougar[_Q]:IsReady() and Spells.Cougar[_Q]:WillKill(minion) and Spells.Cougar[_Q]:InRange(minion)) then
				CastTakedown(minion)
				return
			end
			if (config.Cougar.UseE and Spells.Cougar[_E]:IsReady() and Spells.Cougar[_E]:WillKill(minion) and Spells.Cougar[_E]:InRange(minion)) then
				Spells.Cougar[_E]:CastAt(minion)
				return
			end
			if (config.Cougar.UseW and Spells.Cougar[_W]:IsReady() and Spells.Cougar[_W]:WillKill(minion)) then
				if (InPounceRange(minion)) then
					Spells.Cougar[_W]:CastAt(minion)
					return
				elseif (TargetHunted(minion) and InRange(minion, ExtendedPounce)) then
					Spells.Cougar[_W]:CastAt(minion)
					return
				end
			end
			if (WillKill(minion, "AD") and SxOrb:CanAttack() and not InRange(minion, SxOrb:GetMyRange()) and InRange(minion, HumanRange)) then
				Spells[_R]:Cast()
				return
			end
		end
	end
	
	for i = 1, #Minions.Jungle.objects do
		if (CheckMinion(Minions.Jungle.objects[i])) then
			return
		end
	end
	
	local minion = Minions.Jungle.objects[1]
	
	if (not CougarForm) then
		OnAutoHeal(Config.AutoHeal)
		if (config.Human.UseQ and Spells.Human[_Q]:IsReady() and Spells.Human[_Q]:InRange(minion) and HaveEnoughMana(config.Human.MinManaQ) and Spells.Human[_Q]:WillHit(minion)) then
			Spells.Human[_Q]:Cast(minion)
		end
		if (config.Human.UseW and Spells.Human[_W]:IsReady() and Spells.Human[_W]:InRange(minion) and HaveEnoughMana(config.Human.MinManaW)) then
			Spells.Human[_W]:CastAt(minion)
		end
		if ((config.Human.UseE < 3) and Spells.Human[_E]:IsReady()) then
			if (config.Human.UseE == 2) then
				if (HasBlueBuff(minion) or HaveEnoughMana(config.Human.MinManaE)) then
					Spells.Human[_E]:CastAt(myHero)
				end
			elseif ((config.Human.UseE == 1) and HasBlueBuff()) then
				Spells.Human[_E]:CastAt(myHero)
			end
		end
		if (config.UseR and Spells[_R]:IsReady() and (config.Cougar.UseQ or config.Cougar.UseW or config.Cougar.UseE)) then
			if (config.Cougar.UseE and SpellReady.Cougar[_E] and Spells.Cougar[_E]:InRange(minion)) then
				Spells[_R]:Cast()
				return
			end
			if (config.Cougar.UseW and SpellReady.Cougar[_W]) then
				if (InPounceRange(minion)) then
					Spells[_R]:Cast()
					return
				elseif (TargetHunted(minion) and InRange(minion, ExtendedPounce)) then
					Spells[_R]:Cast()
					return
				end
			end
			if (config.Cougar.UseQ and SpellReady.Cougar[_Q] and Spells.Cougar[_Q]:InRange(minion)) then
				Spells[_R]:Cast()
				return
			end
		end
	else
		if (config.Cougar.UseE and Spells.Cougar[_E]:IsReady() and Spells.Cougar[_E]:InRange(minion)) then
			Spells.Cougar[_E]:CastAt(minion)
		end
		if (config.Cougar.UseW and Spells.Cougar[_W]:IsReady()) then
			if (InPounceRange(minion)) then
				Spells.Cougar[_W]:CastAt(minion)
			elseif (TargetHunted(minion) and InRange(minion, ExtendedPounce)) then
				Spells.Cougar[_W]:CastAt(minion)
			end
		end
		if (config.Cougar.UseQ and Spells.Cougar[_Q]:IsReady() and Spells.Cougar[_Q]:InRange(minion)) then
			CastTakedown(minion)
		end
		if (config.UseR and Spells[_R]:IsReady() and (config.Human.UseQ or config.Human.UseW or config.Human.UseE)) then
			if (config.Human.UseQ and SpellReady.Human[_Q] and Spells.Human[_Q]:InRange(minion) and HaveEnoughMana(config.Human.MinManaQ) and Spells.Human[_Q]:WillHit(minion)) then
				Spells[_R]:Cast()
				return
			end
			if (config.Human.UseW and SpellReady.Human[_W] and Spells.Human[_W]:InRange(minion) and HaveEnoughMana(config.Human.MinManaW)) then
				Spells[_R]:Cast()
				return
			end
			if ((config.Human.UseE < 3) and Spells.Human[_E]:IsReady()) then
				if (config.Human.UseE == 2) then
					if (HasBlueBuff(minion) or HaveEnoughMana(config.Human.MinManaE)) then
						Spells[_R]:Cast()
						return
					end
				elseif ((config.Human.UseE == 1) and HasBlueBuff()) then
					Spells[_R]:Cast()
					return
				end
			end
		end
	end
	
end

function OnAutoHeal(config)

	if (myHero.dead or not config.Enabled or CougarForm or not Spells.Human[_E]:IsReady()) then
		return
	end
	
	if (config.Self and HaveEnoughMana(config.MinMana) and HealthLowerThenPercent(config.MinHealth)) then
		Spells.Human[_E]:Cast(myHero)
		return
	end
	
	for _, ally in ipairs(GetAllyHeroes()) do
		if (config.Allies[Format("{1}Enabled", ally.charName)] and HaveEnoughMana(config.Allies[Format("{1}MinMana", ally.charName)]) and HealthLowerThenPercent(config.Allies[Format("{1}MinHealth", ally.charName)])) then
			Spells.Human[_E]:Cast(ally)
			return
		end
	end

end

function OnKillsteal(config)

	if (not config.Enable) then
		return
	end
	
	for _, enemy in ipairs(GetEnemyHeroes()) do
		if (enemy and not enemy.dead and Spells.Human[_Q]:IsValid(enemy)) then
			local damage = getDmg("AD", enemy, myHero)
			if (CougarForm) then
				if (Spells.Cougar[_E]:WillKill(enemy) and Spells.Cougar[_E]:IsReady() and Spells.Cougar[_E]:IsValid(enemy)) then
					Spells.Cougar[_E]:CastAt(enemy)
					return
				elseif (Spells.Cougar[_Q]:WillKill(enemy) and Spells.Cougar[_Q]:IsReady() and Spells.Cougar[_Q]:IsValid(enemy)) then
					Spells.Cougar[_Q]:Cast()
					SxOrb:MyAttack(enemy)
					return
				elseif (Spells.Cougar[_W]:WillKill(enemy) and Spells.Cougar[_W]:IsReady() and Spells.Cougar[_W]:IsValid(enemy)) then
					Spells.Cougar[_W]:CastAt(enemy)
					return
				elseif ((enemy.health <= damage) and not InRange(enemy, SxOrb:GetMyRange()) and InRange(enemy, 600)) then
					Spells[_R]:Cast()
					return
				end
			else
				if ((enemy.health <= damage) and InRange(enemy, SxOrb:GetMyRange())) then
					SxOrb:MyAttack(enemy)
				end
			end
			if (Spells.Human[_Q]:WillKill(enemy)) then
				if (not CougarForm) then
					if (Spells.Human[_Q]:IsReady()) then
						Spells.Human[_Q]:Cast(enemy)
						return
					end
				elseif (Spells[_R]:IsReady() and SpellReady.Human[_Q]) then
					local _, hitchance, _ = Spells.Human[_Q]:GetPrediction(CurrentTarget)
					if (hitchance >= 2) then
						Spells[_R]:Cast()
						return
					end
				end
			end
		end
	end

end

---//==================================================\\---
--|| > Draw Callback Handlers							||--
---\===================================================//---

function OnDrawPermaShow(config)

	local color = DrawManager:GetColor(config.PermaShowColor)

	if (config.PermaShow) then
		CustomPermaShow(ScriptName, "", true)
		CustomPermaShow("______________________________", "", true)
		CustomPermaShow("No Mode Active", "", (not Config.Combo.Active and not Config.Harass.Active and not Config.LaneClear.Active and not Config.JungleClear.Active))
		CustomPermaShow("Combo Mode:", "Active", Config.Combo.Active, color, color, nil)
		CustomPermaShow("Harass Mode:", "Active", Config.Harass.Active, color, color, nil)
		CustomPermaShow("Lane Clear Mode:", "Active", Config.LaneClear.Active, color, color, nil)
		CustomPermaShow("Jungle Clear Mode:", "Active", Config.JungleClear.Active, color, color, nil)
		if (Config.Killstealing.Enable or Config.AutoHeal.Enabled) then
			CustomPermaShow("______________________________ ", "", true)
			CustomPermaShow("Killstealing:", "Active", Config.Killstealing.Enable, color, color, nil)
			CustomPermaShow("Auto-Heal:", "Active", Config.AutoHeal.Enabled, color, color, nil)
		else
			CustomPermaShow("______________________________ ", "", false)
			CustomPermaShow("Killstealing:", "Active", false, color, color, nil)
			CustomPermaShow("Auto-Heal:", "Active", false, color, color, nil)
		end
	else
		CustomPermaShow(ScriptName, "", false)
		CustomPermaShow("______________________________", "", false)
		CustomPermaShow("No Mode Active", "", false)
		CustomPermaShow("Combo Mode:", "Active", false, color, color, nil)
		CustomPermaShow("Harass Mode:", "Active", false, color, color, nil)
		CustomPermaShow("Lane Clear Mode:", "Active", false, color, color, nil)
		CustomPermaShow("Jungle Clear Mode:", "Active",false, color, color, nil)
		CustomPermaShow("______________________________ ", "", false)
		CustomPermaShow("Killstealing:", "Active", false, color, color, nil)
		CustomPermaShow("Auto-Heal:", "Active", false, color, color, nil)
	end
	
end

function OnDrawRanges(config)

	if (config.AA) then
		DrawManager:DrawCircleAt(myHero, SxOrb:GetMyRange(), config.AAColor)
	end

	if (config.QRange) then
		DrawManager:DrawCircleAt(myHero, Spells.Human[_Q].Range, config.QRangeColor)
	end

	if (config.Cooldowns) then
		local size = 14
		local position = WorldToScreen(D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
		if (CougarForm) then
			if (Spells.Human[_Q]:GetLevel() == 0) then
				DrawManager:DrawTextWithBorder("Q: Null", size, position.x - 80, position.y, config.CooldownsColor)
			elseif (SpellReady.Human[_Q]) then
				DrawManager:DrawTextWithBorder("Q: Ready", size, position.x - 80, position.y, config.CooldownsColor)
			else
				DrawManager:DrawTextWithBorder(Format("Q: {1}", tostring(math.floor(1 + (Cooldowns.Human[_Q] - GetGameTimer())))), size, position.x - 80, position.y, config.CooldownsColor)
			end
			if (Spells.Human[_W]:GetLevel() == 0) then
				DrawManager:DrawTextWithBorder("W: Null", size, position.x - 30, position.y + 30, config.CooldownsColor)
			elseif (SpellReady.Human[_W]) then
				DrawManager:DrawTextWithBorder("W: Ready", size, position.x - 30, position.y + 30, config.CooldownsColor)
			else
				DrawManager:DrawTextWithBorder(Format("W: {1}", tostring(math.floor(1 + (Cooldowns.Human[_W] - GetGameTimer())))), size, position.x - 30, position.y + 30, config.CooldownsColor)
			end
			if (Spells.Human[_E]:GetLevel() == 0) then
				DrawManager:DrawTextWithBorder("E: Null", size, position.x, position.y, config.CooldownsColor)
			elseif (SpellReady.Human[_E]) then
				DrawManager:DrawTextWithBorder("E: Ready", size, position.x, position.y, config.CooldownsColor)
			else
				DrawManager:DrawTextWithBorder(Format("E: {1}", tostring(math.floor(1 + (Cooldowns.Human[_E] - GetGameTimer())))), size, position.x, position.y, config.CooldownsColor)
			end
		else
			if (Spells.Cougar[_Q]:GetLevel() == 0) then
				DrawManager:DrawTextWithBorder("Q: Null", size, position.x - 80, position.y, config.CooldownsColor)
			elseif (SpellReady.Cougar[_Q]) then
				DrawManager:DrawTextWithBorder("Q: Ready", size, position.x - 80, position.y, config.CooldownsColor)
			else
				DrawManager:DrawTextWithBorder(Format("Q: {1}", tostring(math.floor(1 + (Cooldowns.Cougar[_Q] - GetGameTimer())))), size, position.x - 80, position.y, config.CooldownsColor)
			end
			if (Spells.Cougar[_W]:GetLevel() == 0) then
				DrawManager:DrawTextWithBorder("W: Null", size, position.x - 30, position.y + 30, config.CooldownsColor)
			elseif (SpellReady.Cougar[_W]) then
				DrawManager:DrawTextWithBorder("W: Ready", size, position.x - 30, position.y + 30, config.CooldownsColor)
			else
				DrawManager:DrawTextWithBorder(Format("W: {1}", tostring(math.floor(1 + (Cooldowns.Cougar[_W] - GetGameTimer())))), size, position.x - 30, position.y + 30, config.CooldownsColor)
			end
			if (Spells.Cougar[_E]:GetLevel() == 0) then
				DrawManager:DrawTextWithBorder("E: Null", size, position.x, position.y, config.CooldownsColor)
			elseif (SpellReady.Cougar[_E]) then
				DrawManager:DrawTextWithBorder("E: Ready", size, position.x, position.y, config.CooldownsColor)
			else
				DrawManager:DrawTextWithBorder(Format("E: {1}", tostring(math.floor(1 + (Cooldowns.Cougar[_E] - GetGameTimer())))), size, position.x, position.y, config.CooldownsColor)
			end
		end
	end
	
end

---//==================================================\\---
--|| > Misc Callback Handlers							||--
---\===================================================//---

function OnUpdateTarget()

	CurrentTarget = Selector:SelectedTarget() or Selector:GetTarget(Spells.Human[_Q].Range)

end

function OnProcessCooldowns()

	if (myHero.dead) then
		SpellReady.Human[_Q]	= false
		SpellReady.Human[_W]	= false
		SpellReady.Human[_E]	= false
		SpellReady.Cougar[_Q]	= false
		SpellReady.Cougar[_W]	= false
		SpellReady.Cougar[_E]	= false
		return
	end
	
	if (not CougarForm) then
		SpellReady.Human[_Q]	= Spells.Human[_Q]:IsReady()
		SpellReady.Human[_W]	= Spells.Human[_W]:IsReady()
		SpellReady.Human[_E]	= Spells.Human[_E]:IsReady()
		SpellReady.Cougar[_Q]	= ((Spells.Cougar[_Q]:GetLevel() >= 1) and (Cooldowns.Cougar[_Q] - GetGameTimer() <= 0)) or false
		SpellReady.Cougar[_W]	= ((Spells.Cougar[_W]:GetLevel() >= 1) and (Cooldowns.Cougar[_W] - GetGameTimer() <= 0)) or false
		SpellReady.Cougar[_E]	= ((Spells.Cougar[_E]:GetLevel() >= 1) and (Cooldowns.Cougar[_E] - GetGameTimer() <= 0)) or false
	else
		SpellReady.Cougar[_Q]	= Spells.Cougar[_Q]:IsReady()
		SpellReady.Cougar[_W]	= Spells.Cougar[_W]:IsReady()
		SpellReady.Cougar[_E]	= Spells.Cougar[_E]:IsReady()
		SpellReady.Human[_Q]	= ((Spells.Human[_Q]:GetLevel() >= 1) and (Cooldowns.Human[_Q] - GetGameTimer() <= 0)) or false
		SpellReady.Human[_W]	= ((Spells.Human[_W]:GetLevel() >= 1) and (Cooldowns.Human[_W] - GetGameTimer() <= 0)) or false
		SpellReady.Human[_E]	= ((Spells.Human[_E]:GetLevel() >= 1) and (Cooldowns.Human[_E] - GetGameTimer() <= 0)) or false
	end

end

function OnUpdateCougarForm()

	CougarForm = (Spells.Cougar[_Q]:GetName():Equals("Takedown"))
	
end

function OnUpdateCooldowns(spell)

	if (CougarForm) then
		if (spell.name:Equals("Takedown")) then
			Cooldowns.Cougar[_Q] = GetGameTimer() + GetSpellCooldown(5)
		elseif (spell.name:Equals("Pounce")) then
			Cooldowns.Cougar[_W] = GetGameTimer() + GetSpellCooldown(5)
		elseif (spell.name:Equals("Swipe")) then
			Cooldowns.Cougar[_E] = GetGameTimer() + GetSpellCooldown(5)
		end
	else
		if (spell.name:Equals("JavelinToss")) then
			Cooldowns.Human[_Q] = GetGameTimer() + GetSpellCooldown(6)
		elseif (spell.name:Equals("Bushwhack")) then
			Cooldowns.Human[_W] = GetGameTimer() + GetSpellCooldown(14 - (1 * Player:GetLevel()))
		elseif (spell.name:Equals("PrimalSurge")) then
			Cooldowns.Human[_E] = GetGameTimer() + GetSpellCooldown(12)
		end
	end
	
end

---//==================================================\\---
--|| > Misc Functions									||--
---\===================================================//---

function GetSpellCooldown(cooldown)

	local cdr = Player:GetCooldownReduction()
	return (cooldown - (cooldown * cdr))

end

function TargetHunted(unit)

	return (UnitHasBuff(unit, "nidaleepassivehunted", true))

end

function CougarDamage(target)

	local damage = 0
	
	if (Cooldowns.Cougar[_Q] < 1) then
		damage = damage + (getDmg("QM", target, myHero) or 0)
	end
	
	if (Cooldowns.Cougar[_W] < 1) then
		damage = damage + (getDmg("WM", target, myHero) or 0)
	end
	
	if (Cooldowns.Cougar[_E] < 1) then
		damage = damage + (getDmg("EM", target, myHero) or 0)
	end
	
	return damage

end

function InPounceRange(unit)

	return (not InRange(unit, Spells.Cougar[_W].Range - Spells.Cougar[_W].Width) and InRange(unit, Spells.Cougar[_W].Range + Spells.Cougar[_W].Width))

end

function CastTakedown(unit)

	Spells.Cougar[_Q]:Cast()
	SxOrb:ResetAA()
	SxOrb:MyAttack(unit)

end

---//==================================================\\---
--|| > Override Functions								||--
---\===================================================//---

Callbacks:Bind("Overrides", function()

	function SxOrb:GetTarget(range)
	
		return (self:ValidTarget(CurrentTarget, range) and CurrentTarget) or Selector:GetTarget(SxOrb:GetMyRange())
	
	end

end)
