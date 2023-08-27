# ESP Module Documentation

![image](https://github.com/HoyoGey/Luau-Projects/assets/117149371/abf33e6a-d2b0-4c67-8d8d-4b71301c6aa4)

## Introduction
The ESP (Extra Sensory Perception) module is a script that allows you to create visual indicators in your Roblox game. It can be used to highlight and display information about certain objects or players in the game.

## Usage

### Installation
To use the ESP module, follow these steps:
1. Copy the entire code provided above.
2. Create a new Script object in Roblox Studio or in Exploit.
3. Paste the code into the Script object or Editor.

### Initialization
To initialize and start using the ESP module, follow these steps:

#### Step 1: Importing and creating an instance of the module:
```lua
local ESP = loadstring(game:HttpGet("https://api-sirclub.onrender.com/scripts/raw/LK_Esp.lua"), true)()
local espInstance = ESP:addESP(a, settings)
```
- Replace `path.to.espModule` with the actual path where you have placed or saved this module script.
- The `a` parameter should be either "player" or a userdata representing a model containing objects you want to apply ESP on.
- The `settings` parameter is optional and allows you to customize various aspects of how the ESP works.

#### Step 2: Adding objects to track:
Once you have created an instance of `ESP`, you can add objects to track by calling its `AddObject(object, title)` method:
```lua
espInstance:AddObject(object, title)
```
- The `object` parameter represents any BasePart or Model object that needs highlighting/displaying.
- The `title` parameter is optional and represents a custom title/tag for the object being tracked.

#### Step 3: Changing settings:
You can change various settings related to how your ESP appears by calling its `ChangeSettings(newSettings)` method:
```lua
espInstance:ChangeSettings(newSettings)
```
- The `newSettings` table contains key-value pairs where each key represents a setting property and its corresponding value is the new value you want to set.

#### Step 4: Enabling or disabling the ESP:
You can enable or disable the ESP by calling its `Value(val)` method:
```lua
espInstance:Value(true) -- Enables the ESP
espInstance:Value(false) -- Disables the ESP
```
- The `val` parameter should be either `true` or `false`.

### Example Usage

Here's an example usage of this module:

```lua
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Importing and creating an instance of the module
local ESP = loadstring(game:HttpGet("https://api-sirclub.onrender.com/scripts/raw/LK_Esp.lua"), true)()
local espInstance = ESP:addESP("player")

-- Adding objects to track
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        espInstance:AddObject(player.Character, player.Name)
    end
end

-- Changing settings (optional)
espInstance:ChangeSettings({
    Color = Color3.new(0, 1, 0), -- Change highlight color to green 
    tag = true, -- Show tags for tracked players 
})

-- Enabling the ESP 
espInstance:Value(true)
```

## API Reference

### Methods

#### addESP(a [, settings])
Creates and returns an instance of the ESP module.
- Parameters:
  - `a`: Represents what type of objects you want to apply ESP on. It can be either "player" or a userdata representing a model containing objects.
  - `[settings]`: An optional table that allows you to customize various aspects of how your ESP works. Refer to Settings section for more details.
- Returns:
  - A new instance of `ESP`.

#### AddObject(object [, title])
Adds an object to track with its optional custom title/tag.
- Parameters:
  - `object`: The object (BasePart or Model) to be tracked.
  - `[title]`: An optional custom title/tag for the object being tracked.

#### RemoveObject(object)
Removes a previously added object from tracking.
- Parameters:
  - `object`: The object (BasePart or Model) to be removed from tracking.

#### ChangeSettings(newSettings)
Changes the settings of your ESP instance.
- Parameters:
  - `newSettings`: A table containing key-value pairs representing the new values for different settings properties. Refer to Settings section for more details.

#### Value(val)
Enables or disables the ESP.
- Parameters:
  - `val`: A boolean value indicating whether to enable (`true`) or disable (`false`) the ESP.


### Settings

The following settings can be customized by passing them as key-value pairs in the `settings` parameter when creating an instance of `ESP` module:

| Setting              | Default Value         | Description                                                  |
| -------------------- | --------------------- | ------------------------------------------------------------ |
| Color                | Color3.new(1, 1, 1)   | The color used for highlighting objects.                     |
| outline              | true                  | Specifies whether outlines should be displayed around objects. |
| tag                  | false                 | Specifies whether tags/titles should be displayed above objects. |
| distance             | false                 | Specifies whether distances should be displayed below objects' tags. |
| nolplr               | true                  |\ Whether local player's character should not have an ESP applied on it.|
\ teamcolor            |\ false                \|\ If set to true, uses players' TeamColor property as their highlight color.\|
\ outlineSameAsFill    \|\ false             \\\ If set to true, uses same color as fill color for outlines.\|
\ customColor          \| nil               \\A function that takes an object and returns a custom highlight color.\|
\ refreshTime          \|\ 1               \\The time (in seconds) between each update of the ESP.|
\ customTag            \| nil                 |\ A function that takes an object and returns a custom tag/title for it.\|

Note: If you set `teamcolor` to true, the `customColor` setting will be overridden and all players' TeamColor property will be used as their highlight color.

## Conclusion
The ESP module allows you to easily create visual indicators in your Roblox game. By following the instructions provided in this documentation, you can add highlighting and display information about objects or players in your game. Feel free to experiment with different settings to achieve the desired effect.

If you have any further questions or need assistance, feel free to ask!
