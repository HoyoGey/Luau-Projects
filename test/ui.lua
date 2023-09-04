local Root = script
local Func = require(Root.function)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("TITLE", "DarkTheme")
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")
Section:NewButton("ButtonText", "ButtonInfo", function()
    Func.FreeLand()
end)
