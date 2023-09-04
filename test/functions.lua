local Functions = {}
Functions.__index = Functions

function Functions.FreeLand()
    for i, v in next, game:GetService("Workspace").Properties:GetChildren() do
        if v:FindFirstChild("Owner") and v.Owner.Value == nil then
            game:GetService("ReplicatedStorage").PropertyPurchasing.ClientPurchasedProperty:FireServer(v, v.OriginSquare.Position)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.OriginSquare.CFrame + Vector3.new(0, 2, 0)
            break
        end
    end
end

return Functions
