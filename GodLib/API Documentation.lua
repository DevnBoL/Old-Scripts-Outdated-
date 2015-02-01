---//==================================================\\---
--|| > Setup Variables									||--
---\===================================================//---

GodLib				-- Holds main variables used to setup the script.
	Update			-- Holds variables used to check for script updates. Script will not check for updates if not setup properly.
		--[[
			The host used to locate update files.
			
			Example:
				GodLib.Update.Host = "raw.github.com"
		--]]
		.Host
		--[[
			The path to the folder where the files are located. Leave empty if no path is needed.
			
			Example:
				GodLib.Update.Path = "DevnBoL/Scripts/GodLib"
		--]]
		.Path
		--[[
			The filename where the current scripts version is stored.
			
			Example:
				GodLib.Update.Version = "Current.version"
				
			Example of file content:
				0.01
		--]]
		.Version
		--[[
			The filename where the current scripts source is stored.
			
			Example:
				GodLib.Update.Script = "GodLib.lua"
		--]]
		.Script
	.Script			-- Holds variables about the current script.
		--[[
			Used to locate user variables for your script. Uses script name if not set.
			
			Example:
				NotRyze
			
			Global variables:
				_AutoUpdate
				_EnableDebugMode
				
			Example of user variables:
				NotRyze_AutoUpdate
		--]]
		.Variables
		--[[
			Let's the script know the proper champion name to use.
			
			Example:
				Kog'Maw
			
			Default:
				myHero.charName
		--]]
		.ChampionName
		--[[
			Holds the scripts name.
			
			Example:
				Nidalee - The Bestial GodLib
				
			Default:
				Untitled
		--]]
		.Name
		--[[
			Holds the scripts current version.
			
			Example:
				1.92
			
			Default:
				0.01
		--]]
		.Version
		--[[
			Holds the scripts release date.
			
			Example:
				2015-02-01
			
			Default:
				Not Released
		--]]
		.Date
	.Print			-- Variables used to change how the script prints messages to chat.
		--[[
			Title used when printing messages. Uses script's name if not set.
			
			Example:
				NidaleeGod
		--]]
		.Title
		.Colors		-- Changes colors used when printing messages.
			--[[
				Title color.
				
				Default:
					8183F7
			--]]
			.Title
			--[[
				Info message color.
				
				Default:
					8183F7
			--]]
			.Info
			--[[
				Warning message color.
				
				Default:
					F781BE
			--]]
			.Warning
			--[[
				Error message color.
				
				Default:
					F78183
			--]]
			.Error
			--[[
				Debug message color.
				
				Default:
					81BEF7
			--]]
			.Debug
	--[[
		Holds the required libraries to load.
		
		Example:
			GodLib.RequiredLibraries = {
				["SxOrbWalk"] = "https://raw.githubusercontent.com/Superx321/BoL/master/common/SxOrbWalk.lua",
			}
		
		Default libraries:
			SourceLib
			VPrediction
	--]]
	.RequiredLibraries

---//==================================================\\---
--|| > Global Variables									||--
---\===================================================//---
	
ScriptName			-- Holds the set script name from above.
ScriptVersion		-- Holds the scripts current version from above.
ScriptDate			-- Holds the scripts release date from above.

AutoUpdate			-- Holds whether the user wants the script to auto-update or not.
EnableDebugMode		-- Holds whether the user has enabled debug mode.

MessageType			-- Used to identify the type of message to print.
	.Info
	.Warning
	.Error
	.Debug

---//==================================================\\---
--|| > Global Functions									||--
---\===================================================//---

--[[
	Prints a message to local chat.
	
	@param text		| string		| Text to print
	@param type		| MessageType	| Specifies the type of message
--]]
PrintLocal(text, type)

--[[
	Prints a message to local chat.
	
	@param input	| string		| Text to format
	@param args		| ...			| Arguments to format into input
	
	Example:
		Format("{1} v{2} loaded successfully!", ScriptName, ScriptVersion) = "NidaleeGod v1.02 loaded successfully!"
--]]
Format(input, args)

--[[
	Checks if the target is valid and can be damaged.
	
	@param target	| unit	| Unit to check if valid target
	@param range	| int	| (optional) Range to check unit is in
	@param from		| unit	| (optional) Unit to check range from
--]]
IsValid(target, range, from)

--[[
	Check if unit has buff.
	
	@param unit		| unit		| Unit to check if has buff
	@param name		| string	| Name of buff to search for
	@param loose	| bool		| (optional) If true will check if buff CONTAINS the name, if false will check if buff EQUALS the name
--]]
UnitHasBuff(unit, name, loose)

--[[
	Sets the prediction to use for casting spells. Required to cast skillshots.
	
	@param prediction	| VPrediction	| VPrediction object to use
--]]
SetPrediction(prediction)

--[[
	Returns all enemies with range of unit
	
	@param range	| int	| Range to get enemies within
	@param from		| unit	| (optional) Unit to check enemies within range from
--]]
GetEnemiesInRange(range, from)

--[[
	Checks if a unit is within range of another unit.
	
	@param unit		| unit	| Unit to check is in range
	@param range	| int	| Range to check enemy is within
	@param from		| unit	| (optional) Unit to check if enemy is in range from
--]]
InRange(unit, range, from)

--[[
	Returns if unit's mana is over percentage.
	
	@param percent	| int	| Percent to check
	@param unit		| unit	| (optional) Unit to check mana percentage
--]]
HaveEnoughMana(percent, unit)

--[[
	Returns if unit is fleeing from another unit.
	
	@param unit		| unit	| Unit to check is fleeing
	@param range	| int	| Range to consider unit fleeing
	@param from		| unit	| (optional) Unit to check unit is fleeing from
	@param distance	| int	| (optional) Minimum distance to consider target fleeing
--]]
IsFleeing(unit, range, from, distance)

--[[
	Returns if unit is facing another unit.
	
	@param unit		| unit	| Unit to check is facing
	@param from		| unit	| Unit to check unit is facing
	@param distance | int	| (optional) Max distance facing unit can be from unit.
--]]
IsFacing(unit, from, distance)

--[[
	Returns if unit is an ally.
	
	@param unit	| int	| Unit to check is ally
--]]
IsAlly(unit)

--[[
	Returns if unit is an enemy.
	
	@param unit	| int	| Unit to check is enemy
--]]
IsEnemy(unit)

---//==================================================\\---
--|| > String Functions									||--
---\===================================================//---

--[[
	These functions can be called directly on a string.
	
	Example:
		"Hello world!":ToLower() = "hello world!"
--]]

--[[
	Inner part to format function. See "Format".
	
	@param string	| string	| Input string
	@param args		| ...		| Variables to format into input
--]]
string.Format(string, args)

--[[
	Returns if input is equal too value.
	
	@param string	| string	| Input string
	@param value	| string	| String to check input is equal too
	@param exact	| bool		| (optional) If true will check if string is exact copy
--]]
string.Equals(string, value, exact)

--[[
	Returns input string without leading and trailing spaces.
	
	@param string	| string	| Input string
--]]
string.Trim(string)

--[[
	Splits string by another string.
	
	@param string	| string	| Input string
	@param value	| string	| String to split input by
--]]
string.Split(string, value)

--[[
	Returns if input starts with value.
	
	@param string	| string	| Input string
	@param value	| string	| String to check input starts with
--]]
string.Starts(string, value)

--[[
	Returns a URL safe version of a string.
	
	@param string	| string	| Input string
--]]
string.UrlEncode(string)

--[[
	Returns an all lowercase version of the input string.
	
	@param string	| string	| Input string
--]]
string.ToLower(string)

--[[
	Returns an all uppercase version of the input string.
	
	@param string	| string	| Input string
--]]
string.ToUpper(string)

--[[
	Replaces all instances of a value in input string.
	
	@param string	| string	| Input string
	@param replace	| string	| String to replace
	@param value	| string	| String to replace with
--]]
string.Replace(string, replace, value)

--[[
	Returns all regex matches within input.
	
	@param string	| string	| Input string
	@param value	| string	| Regex to search input for
--]]
string.Match(string, value)

--[[
	Returns if string is empty or whitespace.
	
	@param string	| string	| Input string
--]]
string.IsEmpty(string)

---//==================================================\\---
--|| > Callbacks Class									||--
---\===================================================//---

--[[
	Binds a function to a callback. The callbacks variables are passed into the function.
	
	@param name		| string	| Name of callback to bind too
	@param callback	| function	| Function to call
	
	Callbacks:
		Initialize		-- Called after script finishes loading
		Tick
		Exit
		Unload
		Animation
		SendChat
		RecieveChat
		ProcessSpell
		CreateObject
		UpdateObject
		DeleteObject
		
	VIP callbacks:
		SendPacket
		RecvPacket
	
	SxOrbWalk callbacks (only if library is loaded):
		BeforeAttack
		Attack
		AfterAttack
		
	Example:
		Callbacks:Bind("Initialize", function()
			PrintLocal("Script initialized!")
		end)
--]]
Callbacks:Bind(name callback)

--[[
	Manually call binded callbacks.
	
	@param name	| string	| Callback to call
	@param args	| ...		| (optional) Arguments to pass to callbacks
--]]
Callbacks:Call(name, args)

---//==================================================\\---
--|| > DrawManager Class								||--
---\===================================================//---

--[[
	Returns all available colors.
	
	List of colors:
		White
		Light Blue
		Blue
		Dark Blue
		Yellow
		Lime
		Light Green
		Green
		Dark Green
		Magenta
		Red
		Dark Red
		Cyan
		Gray
		Brown
		Orange
		Purple
--]]
DrawManager.Colors

--[[
	Loads DrawManager into config menu.
	
	@param config	| scriptConfig	| Config menu to load into
--]]
DrawManager:LoadToMenu(config)

--[[
	Returns ARGB value for color index.
	
	@param index	| int	| Index of color
--]]
DrawManager:GetColor(index)

--[[
	Returns color index.
	
	@param name	| string	| Name of color to get index of
--]]
DrawManager:GetColorIndex(name)

--[[
	Draws a circle at XYZ coordinates.
	
	@param x		| int	| Circles X position
	@param y		| int	| Circles Y position
	@param z		| int	| Circles Z position
	@param range	| int	| Range of circle
	@param color	| Color	| Color of circle
	
	Examples:
		DrawManager:DrawCircle(myHero.x, myHero.y, myHero.z, 500, "Red")
		DrawManager:DrawCircle(myHero.x, myHero.y, myHero.z, 500, DrawManager:GetColorIndex("Blue"))
--]]
DrawManager:DrawCircle(x, y, z, range, color)

--[[
	Draws a circle at position.
	
	@param position	| Vector	| Position to draw circle
	@param range	| int		| Range of circle
	@param color	| Color		| Color of circle
	
	Examples:
		DrawManager:DrawCircle(myHero, 500, "Red")
--]]
DrawManager:DrawCircleAt(position, range, color)

--[[
	Draws text on screen at XY position.
	
	@param text		| string	| Text to draw on screen
	@param size		| int		| Size of text
	@param x		| int		| Texts X position
	@param y		| int		| Texts Y position
	@param color	| Color		| Color of text
	
	Examples:
		DrawManager:DrawText("Test Message!", 12, 50, 24, "White")
--]]
DrawManager:DrawText(text, size, x, y, color)

--[[
	Draws text with border on screen at XY position.
	
	@param text		| string	| Text to draw on screen
	@param size		| int		| Size of text
	@param x		| int		| Texts X position
	@param y		| int		| Texts Y position
	@param color	| Color		| Color of circle
	@param border	| Color		| (optional) Color of border, uses black by default
	
	Examples:
		DrawManager:DrawTextWithBorder("Test Message!", 12, 50, 24, "White", "Black")
--]]
DrawManager:DrawTextWithBorder(text, size, x, y, color, border)

---//==================================================\\---
--|| > TickManager Class								||--
---\===================================================//---

--[[
	Adds a function to TickManager.
	
	@param name		| string	| Name of function
	@param title	| string	| Title to show in TickManager menu
	@param default	| int		| Default ticks per second
	@param callback	| function	| Function to be called
	
	Max TPS value:	500
	
	Example:
		TickManager:Add("Combo", "Combo Mode", 250, function()
			PrintLocal("Combo mode!")
		end)
--]]
TickManager:Add(name, title, default, callback)

--[[
	Loads TickManager to config menu.
	
	@param config	| scriptConfig	| Config to load into
--]]
TickManager:LoadToMenu(config)

--[[
	Checks if function is ready to be called.
	
	@param name	| string	| Name of function
--]]
TickManager:IsReady(name)

--[[
	Resets all TickManager functions to there default value.
--]]
TickManager:ResetValues()

---//==================================================\\---
--|| > PriorityManager Class							||--
---\===================================================//---

PriorityManager.EnemyCount	-- Returns total number of enemy heroes.

--[[
	Returns recommended priority for a unit.
	
	@param unit	| Unit	| Unit to get recommended priority for
	
	Details:
		1 = Least priority
		5 = Highest priority
--]]
PriorityManager:GetRecommendedPriority(unit)

---//==================================================\\---
--|| > VisualDebugger Class								||--
---\===================================================//---

--[[
	Creates a new instance of VisualDebugger.
	
	Example:
		Debugger = VisualDebugger()
		Debugger:Group("Spells", "Hero Spells")
		Debugger:Variable("Spells", "Q Ready", function() return (myHero:GetSpellData(_Q) == READY) end)
--]]
VisualDebugger()

--[[
	Creates a new group in VisualDebugger.
	
	@param name	| string	| Name of group
	@param text	| string	| Text to display on screen
--]]
VisualDebugger:Group(name, text)

--[[
	Creates a new variable inside specified group.
	
	@param group	| string	| Name of group to add variable too
	@param text		| string	| Text to display on screen
	@param result	| function	| Result to print to screen
	
	Notes:
		Result will be converted to a string before printed.
--]]
VisualDebugger:Variable(group, text, result)

--[[
	Loads VisualDebugger to config menu.
	
	@param config	| scriptConfig	| Config to load into
--]]
VisualDebugger:LoadToMenu(config)

---//==================================================\\---
--|| > MenuConfig Class									||--
---\===================================================//---

--[[
	Creates a new scriptConfig instance.
--]]
MenuConfig(name, title)

--[[
	Creates a new sub-menu in scriptConfig.
	
	@param name		| string	| Name of sub-menu
	@param title	| string	| Title of sub-menu
--]]
scriptConfig:Menu(name, title)

--[[
	Creates a separator in scriptConfig.
--]]
scriptConfig:Separator()

--[[
	Creates an info parameter in scriptConfig.
	
	@param info		| string	| Text to show
	@param value	| string	| Value of info param
	
	Example:
		Config:Info("Author", "Devn")
--]]
scriptConfig:Info(info, value)

--[[
	Creates a note in scriptConfig.
	
	@param note	| string	| Text to show on menu
--]]
scriptConfig:Note(note)

--[[
	Creates a toggle on scriptConfig.
	
	@param name		| string	| Name of toggle
	@param title	| string	| Title of toggle
	@param default	| bool		| Default toggle state
	@param force	| bool		| (optional) If set will force param to set value
--]]
scriptConfig:Toggle(name, title, default, force)

--[[
	Creates a drop down on scriptConfig.
	
	@param name		| string	| Name of drop down
	@param title	| string	| Title of drop down
	@param default	| bool		| Default drop down index
	@param list		| table		| Options for drop down
	@param force	| bool		| (optional) If set will force param to set value
--]]
scriptConfig:DropDown(name, title, default, list, force)

--[[
	Creates a slider on scriptConfig.
	
	@param name		| string	| Name of slider
	@param title	| string	| Title of slider
	@param default	| bool		| Default number for slider
	@param minimum	| int		| Minimum value for slider
	@param maximum	| int		| Maximum value for slider
	@param force	| bool		| (optional) If set will force param to set value
--]]
scriptConfig:Slider(name, title, default, mininum, maximum, force)

--[[
	Creates a key binding on scriptConfig.
	
	@param name		| string		| Name of key binding
	@param title	| string		| Title of key binding
	@param default	| bool			| Default key binding state
	@param key		| string/int	| Key for key binding
--]]
scriptConfig:KeyBinding(name, title, default, key)

--[[
	Creates a key toggle on scriptConfig.
	
	@param name		| string		| Name of key toggle
	@param title	| string		| Title of key toggle
	@param default	| bool			| Default key toggle state
	@param key		| string/int	| Key for key toggle
	@param force	| bool			| (optional) If set will force param to set value
--]]
scriptConfig:KeyToggle(name, title, default, key, force)

---//==================================================\\---
--|| > SpellData Class									||--
---\===================================================//---

SpellData	-- Holds information about the spell.
	.Key
	.Range
	.Name
	
--[[
	Creates a new spell.
	
	@param key		| spellId	| Spells id
	@param range	| int		| Spells range
	@param name		| string	| (optional) Spells name
	@param id		| string	| (optional) Used to get proper damage from "getDmg" function
	
	Example:
		NidSpear = SpellData(_Q, 1500, "Spear", "Q")
--]]
SpellData(key, range, name ,id)

--[[
	Setup skillshot data.
	
	@param type			| SpellType	| Skillshots type
	@param width		| int		| Spells width
	@param delay		| int		| Spells delay
	@param speed		| int		| Spells speed
	@param collision	| bool		| (optional) Sets if spell has collision
	
	Skillshot types:
		SKILLSHOT_LINEAR
		SKILLSHOT_CIRCULAR
		SKILLSHOT_CONE
	
	Example:
		NidSpear:SetSkillshot(SKILLSHOT_LINEAR, 40, 0.5, 1300, true)
--]]
SpellData:SetSkillshot(type, width, delay, speed, collision)

--[[
	Sets spells source position to cast from.
	
	@param position	| Vector	| Position where spell will be casted from
--]]
SpellData:SetSourcePosition(position)

--[[
	Check if unit is in spells range.
	
	@param unit	| Unit	| Unit to check is in range
--]]
SpellData:InRange(unit)

--[[
	Casts spell.
	
	@param param1	| Unit/int	| If param2 is nil will cast on unit otherwise is X position
	@param param2	| int		| (optional) Z position for casting
	
	Example:
		NidSpear:Cast(target)
		NidSpear:Cast(target.x, target.z)
--]]
SpellData:Cast(param1, param2)

--[[
	Casts spell at position.
	
	@param position	| Vector	| Position to cast at
	
	Example:
		NidSpear:CastAt(target)
		NidSpear:CastAt({ x = target.x, z = target.z })
		NidSpear:CastAt(Vector(target))
		
	Note:
		Ignores prediction.
--]]
SpellData:CastAt(position)

--[[
	Casts spell at unit if unit is immobile.
	
	@param unit	| Unit	| Unit to check is immobile
--]]
SpellData:CastIfImmobile(unit)

--[[
	Gets prediction for casting spell at unit.
	
	@param unit	| Unit	| Unit to get spells prediction for
--]]
SpellData:GetPrediction(unit)

--[[
	Checks if unit is a valid target for spell.
	
	@param unit	| Unit	| Unit to check is valid for spell
--]]
SpellData:IsValid(unit)

--[[
	Checks if spell will kill unit.
	
	@param unit	| Unit	| Unit to check spell will kill
--]]
SpellData:WillKill(unit)

SpellData:IsReady()				-- Returns if spell is ready and can be casted.
SpellData:GetLevel()			-- Returns the current level of the spell.
SpellData:GetCooldown()			-- Returns the cooldown of the spelll
SpellData:GetCurrentCooldown()	-- Returns the current cooldown of the spell.
SpellData:GetCost()				-- Returns the spells cost.
SpellData:GetName()				-- Return the spells in-game name.
SpellData:HaveEnoughMana()		-- Returns if you have enough mana to cast spell.

---//==================================================\\---
--|| > Custom Functions									||--
---\===================================================//---

--[[
	Loads SxOrbWalk to config menu.
	
	@param config	| scriptConfig	| Config to load orbwalker into
	@param keys		| bool			| (optional) If not set or true will load default key bindings into menu
	@param selector	| bool			| (optional) If not set or true will load selector into menu
--]]
SxOrb:LoadToMenu(config, keys, selector)
