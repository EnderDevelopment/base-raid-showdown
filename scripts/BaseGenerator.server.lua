-- BaseGenerator.server.lua

local function createBase()
    -- Create the base
    local base = Instance.new("Part")
    base.Name = "Base"
    base.Size = Vector3.new(20, 1, 20)
    base.Position = Vector3.new(0, 0, 0)
    base.Anchored = true
    base.Parent = workspace

    -- Create electric boxes
    for i = 1, 5 do
        local electricBox = Instance.new("Part")
        electricBox.Name = "ElectricBox"
        electricBox.Size = Vector3.new(2, 2, 2)
        electricBox.Position = Vector3.new(math.random(-8, 8), 1, math.random(-8, 8))
        electricBox.Anchored = true
        electricBox.Parent = workspace
    end

    -- Create gates and doors
    local gate = Instance.new("Part")
    gate.Name = "Gate"
    gate.Size = Vector3.new(2, 5, 1)
    gate.Position = Vector3.new(0, 2.5, 10)
    gate.Anchored = true
    gate.Parent = workspace

    local door = Instance.new("Part")
    door.Name = "Door"
    door.Size = Vector3.new(2, 5, 1)
    door.Position = Vector3.new(10, 2.5, 0)
    door.Anchored = true
    door.Parent = workspace

    -- Create generator
    local generator = Instance.new("Part")
    generator.Name = "Generator"
    generator.Size = Vector3.new(3, 3, 3)
    generator.Position = Vector3.new(0, 1.5, 0)
    generator.Anchored = true
    generator.Parent = workspace
end

createBase()