local function makeAllInvisibleModelsVisible()
    for _, model in ipairs(workspace:GetDescendants()) do
        if model:IsA("Model") then
            for _, part in ipairs(model:GetDescendants()) do
                if part:IsA("BasePart") and part.Transparency > 0 then
                    part.Transparency = 0
                end
            end
        end
    end
end
makeAllInvisibleModelsVisible()
