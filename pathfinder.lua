local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create a TextLabel to display the path
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 0, 50) -- Full width, 50px height
textLabel.Position = UDim2.new(0, 0, 0, 0) -- Top of the screen
textLabel.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
textLabel.TextColor3 = Color3.new(1, 1, 1) -- White text
textLabel.Font = Enum.Font.SourceSans
textLabel.TextScaled = true
textLabel.Text = "Click an object to see its root path"
textLabel.Parent = screenGui

-- Function to get and display the full path of an object
local function displayFullPath(obj)
    if obj then
        local path = {}
        while obj.Parent do
            table.insert(path, 1, obj.Name)
            obj = obj.Parent
        end
        -- Include the service as the root
        table.insert(path, 1, obj.Name)

        -- Convert the table to a string to represent the full path
        local fullPath = table.concat(path, ".")
        textLabel.Text = fullPath
    else
        textLabel.Text = "No object clicked."
    end
end

-- Listen for mouse clicks
mouse.Button1Down:Connect(function()
    local target = mouse.Target
    if target then
        displayFullPath(target)
    else
        textLabel.Text = "No object clicked."
    end
end)
