-- GateAndDoorManager.server.lua

local gatesAndDoors = workspace:GetChildren()

for _, part in ipairs(gatesAndDoors) do
    if part.Name == "Gate" or part.Name == "Door" then
        part:GetPropertyChangedSignal("Parent"):Connect(function()
            if part.Parent == nil then
                -- Open the gate or door
                part.Transparency = 1
                part.CanCollide = false
            end
        end)
    end
end