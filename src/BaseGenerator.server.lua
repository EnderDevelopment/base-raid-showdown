-- Base Generator Script

local function createBase()
    -- Create the base
    local base = Instance.new("Part")
    base.Name = "Base"
    base.Size = Vector3.new(50, 1, 50)
    base.Position = Vector3.new(0, 0, 0)
    base.Anchored = true
    base.Parent = workspace

    -- Create electric boxes
    for i = 1, 5 do
        local electricBox = Instance.new("Part")
        electricBox.Name = "ElectricBox" .. i
        electricBox.Size = Vector3.new(2, 2, 2)
        electricBox.Position = Vector3.new(math.random(-20, 20), 1, math.random(-20, 20))
        electricBox.Anchored = true
        electricBox.BrickColor = BrickColor.new("Bright blue")
        electricBox.Parent = workspace

        -- Add a click detector to the electric box
        local clickDetector = Instance.new("ClickDetector")
        clickDetector.Parent = electricBox

        -- Connect the click detector to the destruction function
        clickDetector.MouseClick:Connect(function(player)
            destroyElectricBox(electricBox)
        end)
    end

    -- Create gates and doors
    local gate = Instance.new("Part")
    gate.Name = "Gate"
    gate.Size = Vector3.new(10, 5, 1)
    gate.Position = Vector3.new(0, 2.5, 25)
    gate.Anchored = true
    gate.BrickColor = BrickColor.new("Bright blue")
    gate.Parent = workspace

    local door = Instance.new("Part")
    door.Name = "Door"
    door.Size = Vector3.new(5, 5, 1)
    door.Position = Vector3.new(10, 2.5, 0)
    door.Anchored = true
    door.BrickColor = BrickColor.new("Bright blue")
    door.Parent = workspace

    -- Create the generator
    local generator = Instance.new("Part")
    generator.Name = "Generator"
    generator.Size = Vector3.new(5, 5, 5)
    generator.Position = Vector3.new(0, 2.5, 0)
    generator.Anchored = true
    generator.BrickColor = BrickColor.new("Bright blue")
    generator.Parent = workspace

    -- Add a click detector to the generator
    local generatorClickDetector = Instance.new("ClickDetector")
    generatorClickDetector.Parent = generator

    -- Connect the click detector to the destruction function
    generatorClickDetector.MouseClick:Connect(function(player)
        destroyGenerator(generator)
    end)
end

-- Function to destroy electric boxes
local function destroyElectricBox(electricBox)
    -- Create an explosion effect
    local explosion = Instance.new("Explosion")
    explosion.Position = electricBox.Position
    explosion.BlastRadius = 10
    explosion.BlastPressure = 100000
    explosion.Parent = workspace

    -- Destroy the electric box
    electricBox:Destroy()

    -- Check if all electric boxes are destroyed
    local electricBoxes = workspace:GetChildren()
    local allDestroyed = true
    for _, child in ipairs(electricBoxes) do
        if child.Name:find("ElectricBox") then
            allDestroyed = false
            break
        end
    end

    -- If all electric boxes are destroyed, open the gate and door
    if allDestroyed then
        openGateAndDoor()
    end
end

-- Function to open the gate and door
local function openGateAndDoor()
    local gate = workspace:FindFirstChild("Gate")
    local door = workspace:FindFirstChild("Door")

    if gate then
        gate:Destroy()
    end

    if door then
        door:Destroy()
    end
end

-- Function to destroy the generator
local function destroyGenerator(generator)
    -- Create a fire effect
    local fire = Instance.new("Fire")
    fire.Size = 10
    fire.Heat = 20
    fire.Parent = generator

    -- Create an explosion effect
    local explosion = Instance.new("Explosion")
    explosion.Position = generator.Position
    explosion.BlastRadius = 20
    explosion.BlastPressure = 100000
    explosion.Parent = workspace

    -- Destroy the generator
    generator:Destroy()

    -- Spread fire across the base
    spreadFire()
end

-- Function to spread fire across the base
local function spreadFire()
    local base = workspace:FindFirstChild("Base")
    if base then
        for _, child in ipairs(base:GetChildren()) do
            if child:IsA("Part") then
                local fire = Instance.new("Fire")
                fire.Size = 5
                fire.Heat = 10
                fire.Parent = child
            end
        end
    end
end

-- Call the createBase function to generate the base
createBase()
