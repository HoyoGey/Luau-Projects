# Lapse UI Documentation

<div align="center">
  <img src="https://github.com/HoyoGey/Luau-Projects/assets/117149371/8a6fd340-95bd-443c-8e9d-22f4ffe2a74b" alt="Preview Image"/>
</div>

## Introduction
The Lapse UI library is designed to create user interfaces (UI) for Roblox games. It provides various components such as tabs, buttons, toggles, sliders, dropdowns, etc., which can be easily integrated into your game's interface.
[Full Example](https://raw.githubusercontent.com/HoyoGey/Luau-Projects/main/Ui%20Librarys/Lapse/Example.lua)

## Getting Started
To use the library in your script, you need to load it first. Here is an example of how to do that:

```lua
local Lib = loadstring(game:HttpGet("https://oopshub.vercel.app/Lapse/Lib.lua"))()
```

Once the library is loaded, you can start creating your UI.

## Creating a UI

### Step 1: Create a New UI Instance

To create a new UI instance, use the `New` method from the `Lib` object. You can specify the title of your UI as an argument.
  
```lua
local UI = Lib.New({
    Title = "Lapse UI",
})
```

### Step 2: Create a Tab

To add a tab to your UI, use the `Section` method on the `UI` object. This will return a section object representing the tab.

```lua
local Tab = UI.Section({
    Name = "Tab",
})
```

### Step 3: Add Components to Your Tab Section

Now that you have created a tab section object (`Tab`), you can add different components like paragraphs, buttons,toggles and more using its methods. Here are some examples:

#### Paragraph Component:
Use this component to display text or information.

```lua 
Tab.Paragraph({
    Title = "Title",
    Description = "",
})
```
#### Button Component:
Use this component to create clickable buttons with callbacks.

```lua 
Tab.Button({
    Name = "Button",
    Callback = function()
        print("Button")
    end,
})
```

#### Toggle Component:
Use this component to create toggle buttons with callbacks.

```lua 
Tab.Toggle({
    Name = "Toggle",
    Toggled = false,
    ImageColor = nil,
    Callback = function(arg)
        print("Toggle:",arg)
    end,
})
```

#### Input Component:
Use this component to get user input through text fields.

```lua 
Tab.Input({
   Name = "Input",
   Default = nil,
   ClearTextOnFocus = true,
   Callback = function(arg)
       print("Input:",arg)
   end,
})
```

#### Slider Component:
Use this component to create sliders with callbacks.

```lua 
Tab.Slider({
     Name = "Slider",
     Min = 0,
     Max = 100,
     Default = 60,
     Callback = function(arg)
         print("Slider:",arg)
     end,
})
```

#### Bind Component:
Use this component to create keybinds with callbacks.

```lua 
Tab.Bind({
    Name = "Bind",
    Default = nil,
    Callback = function()
        print("Bind")
    end,
})
```

#### Dropdown Component:
Use this component to create dropdown menus with options and callbacks.

```lua 
local Dropdown = Tab.Dropdown({
   Name = "Dropdown",
   Default = nil,
   List ={
       [1] ={
           Name ="Option-1",
           Image ="http://www.roblox.com/asset/?id=394719559",
           Value=1
       }
   },
   Callback=function(arg)
       print("Dropdown:",arg)
   end,  
})

-- Adding Options to the Dropdown
local Option1=Dropdown.AddOption({
    Name="Option-1",Image="http://www.roblox.com/asset/?id=394719559",Value=1
})

local Option2=Dropdown.AddOption({
    Name="Option-2",Image="http://www.roblox.com/asset/?id=394719559",Value=2
})
```

### Step 4: Select the Tab

To select a specific tab, use the `Select` method on the tab object.

```lua 
Tab.Select()
```

## Conclusion

This concludes the basic documentation for using Lapse UI library in your Lua script. You can refer back to this document whenever you need guidance on creating different components of your user interface.

# Credits
ui made by @mr.xrer
</br>
code by @oopss_sorry
