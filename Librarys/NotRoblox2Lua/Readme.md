# Not Roblox 2 Lua
![NotRoblox2Lua](https://github.com/HoyoGey/Luau-Projects/assets/117149371/7fb3790c-06d3-4341-92cf-a166f7dfcb41)


# Converter Module Documentation

The `Converter` module is a Lua module for Roblox that provides functionality for converting Roblox instances into Lua code. It is designed to convert various Roblox instances and their properties into Lua script format.

## Module Overview

The `Converter` module allows you to perform the following operations:

1. Convert Roblox instances and their properties into Lua code.
2. Convert LuaSourceContainers (Scripts, LocalScripts, and ModuleScripts) into Lua code.
3. Optionally convert and include script source code for LuaSourceContainers.

## Module Usage

### Methods

#### Serialize
```lua
function Converter:Serialize(stuff: {Instance}, convert_scripts: boolean): string
```
The `Serialize` method is used to convert Roblox instances into Lua code.

- `stuff: {Instance}`: An array of Roblox instances to be converted.
- `convert_scripts: boolean`: A boolean value indicating whether to convert and include script source code for LuaSourceContainers (Scripts, LocalScripts, and ModuleScripts).

### Example

```lua
local Converter = require("None Now")

local instancesToSerialize = {game.Workspace.Part1, game.Workspace.Part2}
local convertScripts = true

local luaCode = Converter:Serialize(instancesToSerialize, convertScripts)
print(luaCode)
```

## Internal Functions

The module contains several internal functions that are used to convert properties and instances. These functions are not meant to be used directly but are utilized internally for the conversion process.

- `__convert`: This function converts properties of Roblox classes into Lua code.
- `to_lua`: This function converts a Roblox instance into Lua code.
- `commit`: This function iterates through Roblox instances and converts them into Lua code.
- `commit_script`: This function converts LuaSourceContainers (Scripts, LocalScripts, and ModuleScripts) into Lua code.

## Usage Notes

- The `convert_scripts` parameter in the `Serialize` method allows you to control whether LuaSourceContainers should be converted and included in the output. Set it to `true` to convert scripts or `false` to exclude them.

- The module has internal logic for handling different property types and Roblox instances. It also handles edge cases and unsupported property types gracefully.

- Ensure that the `Converter` module is properly required in your script to use its functionality.

## Examples

Here are some examples of how to use the `Converter` module:

### Example 1: Converting Roblox Instances

```lua
local Converter = require("None Now")

-- Define a list of Roblox instances to be converted
local instancesToSerialize = {game.Workspace.Part1, game.Workspace.Part2}

-- Set whether to convert scripts
local convertScripts = true

-- Call the Serialize method to convert instances
local luaCode = Converter:Serialize(instancesToSerialize, convertScripts)

-- Print the generated Lua code
print(luaCode)
```

### Example 2: Converting Roblox Instances without Scripts

```lua
local Converter = require("None Now")

-- Define a list of Roblox instances to be converted
local instancesToSerialize = {game.Workspace.Part1, game.Workspace.Part2}

-- Set whether to convert scripts (false to exclude scripts)
local convertScripts = false

-- Call the Serialize method to convert instances (excluding scripts)
local luaCode = Converter:Serialize(instancesToSerialize, convertScripts)

-- Print the generated Lua code
print(luaCode)
```

## Conclusion

The `Converter` module is a powerful tool for converting Roblox instances and properties into Lua script format. It can be used to export your Roblox creations as Lua code for various purposes, such as sharing, version control, or creating reusable templates.
