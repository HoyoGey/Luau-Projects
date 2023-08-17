local Lib = loadstring(game:HttpGet("https://oopshub.vercel.app/Lapse/Lib.lua"))()

local UI = Lib.New({
    Title = "Lapse UI",
})

local Tab = UI.Section({
	Name = "Tab",
})

pcall(function()
    local Tab = Section.Tab({
        Name = "Tab",
        Title = "Title",
        Description = "Description",
    })
    local TabSection = Tab.TabSection({
        Name = "Tab Section",
    })
    TabSection.Paragraph({
        Title = "Title",
        Description = "",
    })
    TabSection.Button({
        Name = "Button",
        Callback = function()
            print("Button")
        end,
    })
    TabSection.Toggle({
        Name = "Toggle",
        Toggled = false,
        ImageColor = nil,
        Callback = function(arg)
            print("Toggle:",arg)
        end,
    })
    TabSection.Input({
        Name = "Input",
        Default = nil,
        ClearTextOnFocus = true,
        Callback = function(arg)
            print("Input:",arg)
        end,
    })
    TabSection.Slider({
        Name = "Slider",
        Min = 0,
        Max = 100,
        Default = 60,
        Callback = function(arg)
            print("Slider:",arg)
        end,
    })
    TabSection.Bind({
        Name = "Bind",
        Default = nil,
        Callback = function()
            print("Bind")
        end,
    })
    local Dropdown = TabSection.Dropdown({
        Name = "Dropdown",
        Default = nil,
        List = {
            [1] = {
                Name = "Option-1",
                Image = "http://www.roblox.com/asset/?id=394719559",
                Value = 1
            }
        },
        Callback = function(arg)
            print("Dropdown:",arg)
        end,
    })
    local Option1 = Dropdown.AddOption({
        Name = "Option-1",
        Image = "http://www.roblox.com/asset/?id=394719559",
        Value = 1
    })
    local Option2 = Dropdown.AddOption({
        Name = "Option-2",
        Image = "http://www.roblox.com/asset/?id=394719559",
        Value = 2
    })

    Tab.Select()
end)
