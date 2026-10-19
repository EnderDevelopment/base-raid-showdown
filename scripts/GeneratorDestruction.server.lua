-- GeneratorDestruction.server.lua

local generator = workspace:FindFirstChild("Generator")

if generator then
    generator.Touched:Connect(function(hit)
        if hit.Parent:FindFirstChild("Humanoid") then
            generator:Destroy()
            -- Spread fire across the base
            for _, part in ipairs(workspace:GetChildren()) do
                if part:IsA("BasePart") then
                    local fire = Instance.new("Fire", part)
                    fire.Size = 5
                end
            end
        end
    end)
end