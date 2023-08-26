# Documentation for ESP Library/Module

The Lua code provided is a script that creates an ESP (Extra Sensory Perception) module in Roblox. The module allows the user to create visual indicators, or "ESP", for game objects such as players and parts.

## Usage
To use the ESP module, first require it into your script using `local ESP = loadstring(game:HttpGet("https://api-sirclub.onrender.com/scripts/raw/LK_Esp.lua"), true)()`.

### Creating an ESP Object
To create a new instance of the ESP object, call the `addESP` method on the `ESP` module. This method accepts two arguments: `a` and `settings`.

- **Parameter**: `a`
  - Type: string or userdata
  - Description: Specifies what type of objects to track with the created ESP.
    - If set to "player", then the created ESP will track players in the game.
	- If set to a userdata object (e.g., Model), then the created ESP will track child objects of that userdata.
    
- **Parameter**: `settings`
  - Type: table (optional)
  - Description: Optional settings for customizing how the ESP appears and functions. Defaults are used if not specified.

#### Example:
```lua
local myEsp = ESP:addESP("player", {
	Color = Color3.new(1, 0, 0),
	tag = true,
	distance = true,
	nolplr = true,
	teamcolor = false,
	outlineSameAsFill = false,
	customColor = nil,
	refreshTime = 1,
	customTag= nil
})
```

### Adding Objects to Track
After creating an instance of an EspObject using addESP(), you can add specific game objects to be tracked by calling its AddObject() method.

#### Method Signature:
```lua
myEsp:AddObject(object [, title])
```
##### Parameters:
- **Parameter**: `object`
   - Type: userdata
   - Description: The game object to be tracked by the ESP.
   
- **Parameter**: `title`
  - Type: string (optional)
  - Description: A custom title for the tracked object. If not specified, the name of the object will be used as the title.

#### Example:
```lua
local player = game:GetService("Players").LocalPlayer
myEsp:AddObject(player.Character, "My Player")
```

### Removing Objects from Tracking
To stop tracking a specific game object with an ESP instance, call its RemoveObject() method.

#### Method Signature:
```lua
myEsp:RemoveObject(object)
```
##### Parameters:
- **Parameter**: `object`
   - Type: userdata
   - Description: The game object that should no longer be tracked by the ESP.

#### Example:
```lua
local player = game:GetService("Players").LocalPlayer
myEsp:RemoveObject(player.Character)
```

### Changing Settings

You can change various settings of an existing EspObject using its ChangeSettings() method.

#### Method Signature:
```lua 
myEsp:ChangeSettings(newSettings)
```

##### Parameters:

- **Parameter**: `newSettings`
  - Type : table (optional) 
  - Description : A table containing new values for different settings. Only include those settings you wish to modify. 

The following are valid keys in `newSettings` and their corresponding meanings:

| Key                 | Value type          | Default value        | Description                                                                                                                          |
|---------------------|---------------------|----------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Color               | Color3              | nil                  | Specifies color of highlight on objects being tracked                                                                                |
| outline             | boolean             | true                 | Whether or not to display an outline around highlights                                                                              |
| tag                 | boolean             | false                | Whether or not to display a tag above each highlighted object                                                                        |
| distance            | boolean             | false                | Whether or not to display the distance between the player and each highlighted object                                               |
| nolplr              | boolean             | true                 | Whether or not to exclude LocalPlayer from being tracked                                                                             |
| teamcolor           | boolean             | false                | Whether or not to use team color for highlights. This setting overrides the 'Color' setting if a player's team color is available    |
| outlineSameAsFill   | boolean             | false                | Specifies whether the outline color should be same as fill color                                                                     |
| customColor         | function            |-                     |-                                                                                                                                     |
| refreshTime        	| number             	| 1                   	|-                                                                                                                                     |
  - **Note**: The `customColor` key expects a function that takes an object as input parameter and returns a Color3 value.

#### Example:
```lua 
myEsp:ChangeSettings({
	Color = Color3.new(0, 1, 0),
	distance = true,
	outline = true
})
```

### Enabling/Disabling ESP

You can enable/disable all highlights and tags created by an EspObject using its Value() method.

#### Method Signature:

```lua 
myEsp:Value(val)
```
##### Parameters:

- **Parameter**: `val`
  - Type : boolean
  - Description : Set val to true/false to enable/disable highlighting of objects being tracked.
  
#### Example:
```lua 
myEsp:Value(false) -- Disables highlighting of objects
```

### Destroying ESP Object:

To stop tracking all objects and remove any associated GUI elements, call the Destroy() method on an EspObject instance.

#### Method Signature:
```lua
myEsp:Destroy()
```

#### Example:
```lua
myEsp:Destroy()
```

## Conclusion

The provided Lua script creates an ESP module in Roblox that allows you to track and highlight game objects. By following the usage instructions outlined above, you can effectively use this module in your own Roblox projects.
