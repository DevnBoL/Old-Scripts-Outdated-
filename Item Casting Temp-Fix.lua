function OnLoad()

	ItemNames				= {
		[2044]				= "SightWard",
		[3340]				= "TrinketTotemLvl1",
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
	
	_G.ITEM_1				= 06
	_G.ITEM_2				= 07
	_G.ITEM_3				= 08
	_G.ITEM_4				= 09
	_G.ITEM_5				= 10
	_G.ITEM_6				= 11
	_G.ITEM_7				= 12
	
	___GetInventorySlotItem	= rawget(_G, "GetInventorySlotItem")
	_G.GetInventorySlotItem	= GetSlotItem
	
	PrintChat("<font color=\"#8183F7\"Item Casting Temp-Fix:</font> <font color=\"#BEF781\">Loaded successfully!</font>")
	
end

function GetSlotItem(id, unit)
	
	unit 		= unit or myHero

	if (not ItemNames[id]) then
		return ___GetInventorySlotItem(id, unit)
	end

	local name	= ItemNames[id]
	
	for slot = ITEM_1, ITEM_7 do
		local item = unit:GetSpellData(slot).name
		if ((#item > 0) and (item:lower() == name:lower())) then
			return slot
		end
	end

end
