function OnLoad()

	ItemNames				= {
		[2044]				= "SightWard",
		[3344]				= "TrinketTotemLvl1",
		[3350]				= "TrinketTotemLvl2",
		[3361]				= "TrinketTotemLvl3",
		[3362]				= "TrinketTotemLvl4",
		[2045]				= "ItemGhostWard",
		[2049]				= "ItemGhostWard",
		[2043]				= "VisionWard",
		[2140]				= "ElixirOfWrath",
		[3140]				= "QuicksilverSash",
		[3139]				= "ItemMercurial",
		[3153]				= "ItemSwordOfFeastAndFamine",
		[3139]				= "ItemMercurial",
		[3144]				= "BilgewaterCutlass",
		[3146]				= "HextechGunblade",
		[3180]				= "OdynsVeil",
		[3131]				= "ItemSoTD",
		[3146]				= "HextechGunblade",
		[3184]				= "OdinEntropicClaymore",
		[3074]				= "ItemTiamatCleave",
		[3077]				= "ItemTiamatCleave",
		[3143]				= "RanduinsOmen",
		[3142]				= "YoumusBlade",
	}
	
	_G.GetInventorySlotItem	= GetSlotItem
	
	PrintChat("<font color=\"#8183F7\"Item Casting Temp-Fix:</font> <font color=\"#BEF781\">Loaded successfully!</font>")
	
end

function GetSlotItem(id, unit)

	if (not ItemNames[id]) then
		return nil
	end

	unit 		= unit or myHero
	local name	= ItemNames[id]
	
	for i = 6, 12 do
		local item = unit:GetSpellData(i).name
		if ((#item > 0) and (item:lower() == name:lower())) then
			return i
		end
	end

end
