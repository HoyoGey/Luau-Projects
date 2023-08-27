-- Made by LeoKhol#9369

local ESP = { c = 0 }
local P = game:GetService("Players")
local plr = P.LocalPlayer

function getBasePart(model)
    local s, e = pcall(function()
        if model:IsA("BasePart") then return model end
        if model.PrimaryPart and model.PrimaryPart:IsA("BasePart") then return model.PrimaryPart end
        for i, v in pairs(model:GetChildren()) do
            if v:IsA("BasePart") then
                return v
            end
        end
    end)
    return s and e
end

function update(esp, object, settings, hl, ui)
    if not object then
        esp.espList[object] = nil
        hl:Destroy()
        ui:Destroy()
        return
    end
    local distance
    local part = getBasePart(object)
    if not part then
        esp.espList[object] = nil
        hl:Destroy()
        ui:Destroy()
        return
    end

    distance = part and plr:DistanceFromCharacter(part.Position)
    distance = distance and math.floor(distance * 0.28)

    for obj, _ in pairs(esp.espList) do 
		if obj ~= object then
			local p = getBasePart(obj)			
			if p and p.Parent == object.Parent then
                if self.espList[obj] then
                    self.espList[obj].hl:Destroy()
                    self.espList[obj].ui:Destroy()
                    self.espList[obj] = nil
                end
			end
		end										   
	end

    local color = settings.customColor and settings.customColor(object) or settings.Color or Color3.fromRGB(255, 0, 0)

    if ui:FindFirstChild("Distance") then
        ui.Distance.Text = distance and (distance .. "m") or ""
        ui.Distance.Visible = settings.distance
        ui.Distance.TextColor3 = color
    end
    if ui:FindFirstChild("Title") then
        ui.Title.Visible = settings.tag
        ui.Title.TextColor3 = color
        if settings.customTag then
            ui.Title.Text = settings.customTag(object) .. " " .. (esp.espList[object].title) or object.Name
        end
    end
    if hl then
        -- print(color)
        hl.FillColor = color
        hl.OutlineColor = settings.OutlineColor or settings.outlineSameAsFill and color or Color3.new(1, 1, 1)
        hl.OutlineTransparency = settings.outline and 0 or 1
    end
    if hl and (hl.Adornee == nil or hl.Adornee and not hl.Adornee.Parent) then
        hl:Destroy()
        ui:Destroy()
        esp.espList[object] = nil
    end
end

function ESP:ToEsp(object, sourceEsp, targetEsp)
    	if not object or not sourceEsp or not targetEsp then
        	return
    	end

	sourceEsp:RemoveObject(object)
	targetESP:AddObject(object, title)
end

function ESP:addESP(a, settings)
    settings = settings or {
        Color = nil,
        outline = true,
        tag = false,
        distance = false,
        nolplr = true,
        teamcolor = false,
        outlineSameAsFill = false,
        customColor = nil,
        refreshTime = 1,
        customTag = nil
    }

    local newESP = {
        espList = {},

        stop = false,
        connections = {},

        value = true,
    }
    ESP.c += 1

    settings.Color = settings.Color or Color3.new(1, 1, 1)

    local Folder = game:GetService("CoreGui"):FindFirstChild("ESP_" .. ESP.c) or Instance.new("Folder", game:GetService("CoreGui"))
    Folder.Name = "ESP_" .. ESP.c
    newESP.Folder = Folder


    local tag = Instance.new("BillboardGui")
    tag.Size = UDim2.new(2, 40, 1, 15)
    tag.AlwaysOnTop = true
    local title = Instance.new("TextLabel", tag)
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0.6, 0)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    -- title.TextColor3 = settings.Color or highlight.FillColor
    title.TextScaled = true
    title.TextStrokeTransparency = 1
    local distance = Instance.new("TextLabel", tag)
    distance.Name = "Distance"
    distance.Size = UDim2.new(1, 0, 0.4, 0)
    distance.Position = UDim2.new(0, 0, 0.6, 0)
    distance.BackgroundTransparency = 1
    distance.Font = Enum.Font.GothamMedium
    -- distance.TextColor3 = settings.Color or highlight.FillColor
    distance.TextScaled = true
    distance.TextStrokeTransparency = 1



    function newESP:AddObject(object, title)
        if self.espList[object] then
            self:RemoveObject(object)
        end
        if not self.espList[object] then
            local hl = newESP.Folder:FindFirstChild("Highlight_" .. (title or object.Name)) or Instance.new("Highlight")
            hl.FillColor = settings.Color
            hl.Name = "Highlight_" .. (title or object.Name)
            hl.Parent = newESP.Folder
            hl.Adornee = object
            hl.Enabled = self.value

            local ui = object:FindFirstChild("Tag_" .. (title or object.Name)) or tag:Clone()
            ui.Name = "Tag_" .. (title or object.Name)
            hl.Parent = newESP.Folder
            hl.Adornee = object
            ui.Enabled = self.value

            ui.Title.Text = title or object.Name
            ui.Parent = object

            self.espList[object] = { hl = hl, ui = ui, title = title }

            update(newESP, object, settings, hl, ui)
        end
    end

    function newESP:RemoveObject(object)
        if self.espList[object] then
            self.espList[object].hl:Destroy()
            self.espList[object].ui:Destroy()
            self.espList[object] = nil
        end
    end

    function newESP:ChangeSettings(newSettings)
        if newSettings then
            for i, v in pairs(newSettings) do
                settings[i] = v
            end
        end

        if settings.teamcolor then
            settings.customColor = function(char)
                local p = P:GetPlayerFromCharacter(char)
                if p and p.TeamColor then
                    return p.TeamColor.Color
                end
            end
        end

        function newEsp:PChangeSettings(obj, newSettings)
            for i, v in pairs(self.espList) do
                if (i == obj) then
                    update(newESP, i, newSettings, v.hl, v.ui)
                end
            end
        end

        for i, v in pairs(self.espList) do
            update(newESP, i, settings, v.hl, v.ui)
            -- v.ui.Title.Visible = settings.tag
            -- v.ui.Distance.Visible = settings.distance

            -- local color = settings.customColor and settings.customColor(i) or settings.Color or Color3.fromRGB(255,0,0)
            -- v.ui.Title.TextColor3 = color
            -- v.ui.Distance.TextColor3 = color
            -- v.hl.FillColor = color
        end
    end

    function newESP:Value(val)
        self.value = val
        for i, v in pairs(self.espList) do
            if v.hl then v.hl.Enabled = val end
            if v.ui then v.ui.Enabled = val end
        end
    end

    function newESP:Destroy()
        for i, v in pairs(self.espList) do
            self:RemoveObject(i)
        end
        for i, v in pairs(self.connections) do
            v:Disconnect()
        end
        self.stop = true
    end

    if a == "player" then
        if settings.teamcolor then
            settings.customColor = function(char)
                local p = P:GetPlayerFromCharacter(char)
                if p and p.TeamColor then
                    return p.TeamColor.Color
                end
            end
        end
        local function characterAdded(char, plrN)
            repeat task.wait() until (char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')) and char:FindFirstChildOfClass("Humanoid")
            newESP:AddObject(char, plrN)
        end
        table.insert(newESP.connections,
            P.PlayerAdded:Connect(function(p)
                if p.Character then characterAdded(p.Character, p.Name) end
                table.insert(newESP.connections, p.CharacterAdded:Connect(function(c)
                    characterAdded(c, p.Name)
                end))
            end)
        )
        table.insert(newESP.connections,
            P.PlayerRemoving:Connect(function(p)
                if p.Character then newESP:RemoveObject(p.Character) end
                if newESP.Folder:FindFirstChild("Highlight_" .. p.Name) then
                    newESP.Folder:FindFirstChild("Highlight_" .. p.Name):Destroy()
                end
                if newESP.Folder:FindFirstChild("Tag_" .. p.Name) then
                    newESP.Folder:FindFirstChild("Tag_" .. p.Name):Destroy()
                end
            end)
        )
        for i, p in pairs(P:GetPlayers()) do
            if settings.nolplr and p ~= plr or not settings.nolplr then
                if p.Character then characterAdded(p.Character, p.Name) end
                table.insert(newESP.connections, p.CharacterAdded:Connect(function(c)
                    characterAdded(c, p.Name)
                end))
            end
        end
    elseif type(a) == "userdata" then
        table.insert(newESP.connections,
            a.ChildAdded:Connect(function(child)
                newESP:AddObject(child)
            end)
        )
        for i, v in pairs(a:GetChildren()) do
            newESP:AddObject(v)
        end
    end

    coroutine.wrap(function()
        while not newESP.stop do
            task.wait(settings.refreshTime or 1)
            for i, v in pairs(newESP.espList) do
                update(newESP, i, settings, v.hl, v.ui)
            end
        end
    end)()

    return newESP
end

return ESP
