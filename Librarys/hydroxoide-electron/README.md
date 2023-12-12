# Script
```lua
local owner = "Upbolt"
local branch = "revision"

local function webImport(file)
    return loadstring(game:HttpGet(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/HoyoGey/Luau-Projects/main/Librarys/hydroxoide-electron/init.lua"))()
webImport("ui/main")
```
the best utility for roblox scripting, I made a fork for the electron since it does not work there because of the async, that is, it is not supported in the electron!
