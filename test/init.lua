local urlGitHub = "https://raw.githubusercontent.com/HoyoGey/Luau-Projects/main/test"

_G.YodeW = {}
local storage = _G.YodeW
function registerStorage(path: string)
    local paths = string.split(path, "/")
    local endFile = paths[#paths]
    local endFileType = string.split(endFile, ".")[2]
    local currentStorage = storage
    
    for _, path_split in paths do
        if path_split == "" then continue end
        
        local name = string.split(path_split, ".")[1]
        currentStorage[name] = currentStorage[name] or {}
        
        if path_split == endFile and endFileType == 'lua' then
            currentStorage[name] = _G.YodeW.LoadHttp(urlGitHub .. path)
        end
        
        currentStorage = currentStorage[name]
    end
end

_G.YodeW.registerStorage = registerStorage

_G.YodeW.LoadHttp = function(path: string)
	return loadstring(game:HttpGet(path))()
end

_G.YodeW.requireGit = registerStorage


registerStorage("/functions.json")
registerStorage("/ui.json")
