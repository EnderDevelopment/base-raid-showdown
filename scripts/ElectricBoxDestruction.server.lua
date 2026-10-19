-- ElectricBoxDestruction.server.lua

local electricBoxes = workspace:GetChildren()

for _, part in ipairs(electricBoxes) do
    if part.Name == "ElectricBox" then
        part.Touched:Connect(function(hit)
            if hit.Parent:FindFirstChild("Humanoid") then
                part:Destroy()
            end
        end)
    end
end