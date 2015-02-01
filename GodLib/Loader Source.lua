---//==================================================\\---
--|| > Initialization									||--
---\===================================================//---

local LibraryPath	= LIB_PATH.."GodLib.lua"
local DownloadPath	= "https://raw.githubusercontent.com/DevnBoL/Scripts/master/GodLib/GodLib.lua"

---//==================================================\\---
--|| > Load Functions									||--
---\===================================================//---

local function ReadFile(path)

	local file		= io.open(path, "r")
	local content	= file:read("*all")
	
	file:close()
	return content

end

local function SafeLink(url)

	return url.."?rand="..math.random(1, 10000)

end

local function PrintLocal(message)

	PrintChat("<font color=\"#f781be\">GodLib:</font> <font color=\"#bef781\">"..message.."</font>")

end

local function LoadLibrary()

	if (FileExist(LibraryPath)) then
		assert(load(ReadFile(LibraryPath), nil, "t", _ENV))()
    else
		PrintLocal("Downloading, please wait...")
        DownloadFile(SafeLink(DownloadPath), LibraryPath, function()
			PrintLocal("Downloaded successfully! Please reload script (double F9).")
		end)
    end
    
end

---//==================================================\\---
--|| > Load LibraryPath									||--
---\===================================================//---

LoadLibrary()
