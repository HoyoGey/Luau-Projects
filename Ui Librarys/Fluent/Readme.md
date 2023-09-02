# Fluent Luau UI | Module Documentation

## Table of Contents
1. [Introduction](#introduction)
2. [Fluent Window](#fluent-window)
3. [Tabs](#tabs)
4. [Options](#options)
5. [Elements](#elements)
6. [Addons](#addons)

## Introduction <a name="introduction"></a>
The "Fluent" module is a powerful UI library for creating customizable windows and user interfaces in Lua scripts.

To use the Fluent module, you need to load it by executing the following code:
```lua
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
```

Once loaded, you can create a new Fluent window using `CreateWindow()` method.

## Fluent Window <a name="fluent-window"></a>
### CreateWindow(table options) -> window
This function creates a new Fluent window with specified options.

- `options` (table): A table containing various options for configuring the window.
  - `Title` (string): The title of the window.
  - `SubTitle` (string) : The subtitle of the window.
  - `TabWidth` (number) : The width of each tab in pixels.
  - `Size` (UDim2 object) : The size of the entire window.
  - `Acrylic` (boolean) : Whether to enable acrylic effect or not.
  - `Theme` (string) : The theme color scheme ("Dark" or "Light").
  - `MinimizeKey`(Enum.KeyCode or nil): Optional keybind to minimize/maximize the window.


Example usage:
```lua
local Window = Fluent:CreateWindow({
    Title = "Fluent",
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})
```

## Tabs <a name="tabs"></a>
### AddTab(table options) -> tab
This method adds a new tab to the Fluent window and returns it.

- `options` (table): A table containing various options for configuring the tab.
  - `Title` (string): The title of the tab.
  - `Icon` (string or nil) : Optional icon for the tab. You can use Lucide Icons.


Example usage:
```lua
local MainTab = Window:AddTab({
    Title = "Main",
    Icon = ""
})
```

## Options <a name="options"></a>
The `Options` object contains all the customizable options for your UI elements. Each option is represented by a unique key that you can assign values to.

Example usage:
```lua
local ToggleOption = Fluent.Options.MyToggle

-- Set value of toggle option
ToggleOption:SetValue(false)

-- Get value of toggle option
print(ToggleOption.Value)
```

## Elements <a name="elements"></a>
Fluent provides several UI elements that you can add to your tabs:

### Paragraph Element:
AddParagraph(table options)
- Adds a paragraph element with specified content.

### Button Element:
AddButton(table options)
- Adds a button element with specified title, description, and callback function.

### Toggle Element:
AddToggle(string key, table options)
- Adds a toggle element with specified key and options.

### Slider Element:
AddSlider(string key, table options)
- Adds a slider element with specified key and options.

### Dropdown Element:
AddDropdown(string key, table options)
- Adds a dropdown element with specified key and options.

### Colorpicker Element: 
AddColorpicker(string key, table options)
- Adds a color picker element with specified key and options.

### Keybind Element:
AddKeybind(string key, table options)
- Adds a keybind element with specified key and options.

### Input Element:
AddInput(string key, table options)
- Adds an input element with specified key and options.


## Addons <a name="addons"></a>
Fluent provides two addons: SaveManager and InterfaceManager. These addons allow you to manage configurations and interface sections respectively.

To use these addons, you need to load them by executing the following code:

```lua
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
```

Once loaded, you can use the `SetLibrary()` method of each addon to associate them with your Fluent window.
For example:
```lua
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
```

After associating the addons with Fluent, you can build configuration sections or interface sections using `BuildConfigSection()` or `BuildInterfaceSection()`.
Example usage:
```lua
SaveManger:SetFolder("FluentScriptHub")
InterfaceManger:SetFolder("FluentScriptHub/specific-game")

InterfaceManger:BuildInterfaceSection(MainTab) -- Build an interface section on MainTab
SaveManger:BuildConfigSection(MainTab) -- Build a config section on MainTab
```

That's it! You now have access to all the powerful features provided by the Fluent module. Have fun customizing your Lua scripts!

Note: It is recommended to refer to the official documentation for more detailed information about each feature and its usage. [Offical Documendation](https://github.com/dawid-scripts/Fluent/blob/master/Example.lua)
