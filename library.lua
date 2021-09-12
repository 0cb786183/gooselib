local library = {}

function library:CreateGUI()
    local guiLibrary = {}

	local ScreenGui = Instance.new("ScreenGui")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")

	ScreenGui.Parent = game:GetService("CoreGui")
	ScreenGui.Name = math.random(1000000, 9999999)
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    UIListLayout.Parent = ScreenGui
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.Padding = UDim.new(0.01, 0)

    UIPadding.Parent = ScreenGui
    UIPadding.PaddingLeft = UDim.new(0.01, 0)
    UIPadding.PaddingRight = UDim.new(0.01, 0)
    UIPadding.PaddingTop = UDim.new(0.01, 0)
    
    game:GetService("UserInputService").InputBegan:Connect(function(value)
        if(value.UserInputType == Enum.UserInputType.Keyboard) then
            if(value.KeyCode == Enum.KeyCode.Insert) then
                for _,item in pairs(ScreenGui:GetChildren()) do
                    if(item:IsA("Frame")) then
                        item.Visible = not item.Visible
                    end
                end
            end
        end
    end)

    function guiLibrary:CreateTab(Name)
        local tabLibrary = {}

        local Tab = Instance.new("Frame")
        local Top = Instance.new("Frame")
        local Title = Instance.new("TextLabel")
        local Items = Instance.new("Frame")
        local UIListLayout = Instance.new("UIListLayout")
        
        Tab.Name = Name
        Tab.Parent = ScreenGui
        Tab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        Tab.BorderColor3 = Color3.fromRGB(95, 95, 255)
        Tab.BorderSizePixel = 1
        Tab.Position = UDim2.new(0.04, 0, 0.1, 0)
        Tab.Size = UDim2.new(0, 230, 0, 18)
        Tab.Draggable = true
        Tab.Active = true
        Tab.Selectable = true

        Top.Name = "Top"
        Top.Parent = Tab
        Top.BackgroundColor3 = Color3.fromRGB(95, 95, 255)
        Tab.BorderColor3 = Color3.fromRGB(95, 95, 255)
        Top.BorderSizePixel = 0
        Top.Size = UDim2.new(0, 230, 0, 18)
        
        Title.Name = "Title"
        Title.Parent = Top
        Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Title.BackgroundTransparency = 1.000
        Title.BorderSizePixel = 0
        Title.Size = UDim2.new(0, 230, 0, 18)
        Title.Font = Enum.Font.Code
        Title.Text = tostring(Name)
        Title.TextColor3 = Color3.fromRGB(95, 95, 255)
        Title.TextSize = 14.000
        Title.TextWrapped = true
        
        Items.Name = "Items"
        Items.Parent = Tab
        Items.BackgroundColor3 = Color3.fromRGB(95, 95, 255)
        Items.BackgroundTransparency = 1.000
        Items.BorderSizePixel = 0
        Items.Position = UDim2.new(0, 10, 0, 20)
        Items.Size = UDim2.new(0, 1, 0, 12)
        
        UIListLayout.Parent = Items
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 6)

        function tabLibrary:CreateButton(Name, Default, Callback)
            local title = tostring(Name) or "Button"
            local toggled = Default or false
            local func = Callback or function() end
            
            local Button = Instance.new("TextButton")
            local Status = Instance.new("TextLabel")
            
            Button.Name = "Button"
            Button.Parent = Tab.Items
            Button.BackgroundColor3 = Color3.fromRGB(95, 95, 255)
            Button.BackgroundTransparency = 1.000
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0, 0, 0.07, 0)
            Button.Size = UDim2.new(0, 165, 0, 12)
            Button.Font = Enum.Font.Code
            Button.Text = title
            Button.TextColor3 = Color3.fromRGB(95, 95, 255)
            Button.TextSize = 14.000
            Button.TextXAlignment = Enum.TextXAlignment.Left
            
            Status.Name = "Status"
            Status.Parent = Button
            Status.BackgroundColor3 = Color3.fromRGB(95, 95, 255)
            Status.BackgroundTransparency = 1.000
            Status.Position = UDim2.new(0.9, 0, 0, 0)
            Status.Size = UDim2.new(0, 50, 0, 12)
            Status.Font = Enum.Font.Code
            Status.Text = "OFF"
            Status.TextColor3 = Color3.fromRGB(95, 95, 255)
            Status.TextSize = 14.000
            
            if(toggled) then
                Status.TextColor3 = Color3.fromRGB(95, 95, 255)
                Status.Text = "ON"
            else
                Status.TextColor3 = Color3.fromRGB(95, 95, 255)
                Status.Text = "OFF"
            end
            
            Button.MouseButton1Down:Connect(function()
                toggled = not toggled
                if(toggled) then
                    Status.TextColor3 = Color3.fromRGB(95, 95, 255)
                    Status.Text = "ON"
                else
                    Status.TextColor3 = Color3.fromRGB(95, 95, 255)
                    Status.Text = "OFF"
                end
                func(toggled)
            end)
        
            Tab.Size = Tab.Size + UDim2.new(0, 0, 0, 10 + (4 * #Tab:GetChildren()))
            
            return Button
        end
        
        function tabLibrary:CreateKeybind(Name, Default, Callback)
            local title = tostring(Name) or "Keybind"
            local bind = Default or nil
            local func = Callback or function() end
            local awaiting = false
            
            local Keybind = Instance.new("TextButton")
            local Status = Instance.new("TextLabel")
            
            Keybind.Name = "Keybind"
            Keybind.Parent = Tab.Items
            Keybind.BackgroundColor3 = Color3.fromRGB(95, 95, 255)
            Keybind.BackgroundTransparency = 1.000
            Keybind.BorderSizePixel = 0
            Keybind.Position = UDim2.new(0, 0, 0.07, 0)
            Keybind.Size = UDim2.new(0, 165, 0, 12)
            Keybind.Font = Enum.Font.Code
            Keybind.Text = title
            Keybind.TextColor3 = Color3.fromRGB(95, 95, 255)
            Keybind.TextSize = 14.000
            Keybind.TextXAlignment = Enum.TextXAlignment.Left
            
            Status.Name = "Status"
            Status.Parent = Keybind
            Status.BackgroundColor3 = Color3.fromRGB(95, 95, 255)
            Status.BackgroundTransparency = 1.000
            Status.Position = UDim2.new(0.9, 0, 0, 0)
            Status.Size = UDim2.new(0, 50, 0, 12)
            Status.Font = Enum.Font.Code
            Status.Text = "[-]"
            Status.TextColor3 = Color3.fromRGB(255, 255, 255)
            Status.TextSize = 14.000
            
            if(bind == nil) then
                Status.TextColor3 = Color3.fromRGB(255, 255, 255)
                Status.Text = "[-]"
            else
                Status.TextColor3 = Color3.fromRGB(255, 255, 255)
                Status.Text = "[".. string.sub(tostring(bind), 14).. "]"
            end
        
            game:GetService("UserInputService").InputBegan:Connect(function(input)
                if(awaiting and input.UserInputType == Enum.UserInputType.Keyboard) then
                    bind = input.KeyCode
                    awaiting = false
                end
            end)
            
            Keybind.MouseButton1Down:Connect(function()
                if(not awaiting) then
                    bind = nil
                    awaiting = true
                    Status.Text = "[-]"
                    Status.TextColor3 = Color3.fromRGB(144, 255, 53)
                    repeat wait() until bind ~= nil
                    if(bind == nil) then
                        Status.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Status.Text = "[-]"
                    else
                        Status.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Status.Text = "[".. string.sub(tostring(bind), 14).. "]"
                        func(bind)
                    end        
                    awaiting = false
                end
            end)
        
            Tab.Size = Tab.Size + UDim2.new(0, 0, 0, 10 + (4 * #Tab:GetChildren()))
            
            return Keybind
        end
        
        function tabLibrary:CreateSlider(Name, Default, Min, Max, Callback)
            local down = false
            local func = Callback or function() end
            
            local Slider = Instance.new("TextButton")
            local Slider_2 = Instance.new("Frame")
            local Button = Instance.new("TextButton")
            local Status = Instance.new("TextLabel")
            local Start = Instance.new("Frame")
                
            Slider.Name = "Slider"
            Slider.Parent = Tab.Items
            Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Slider.BackgroundTransparency = 1.000
            Slider.BorderSizePixel = 0
            Slider.Position = UDim2.new(0, 0, 0, 0)
            Slider.Size = UDim2.new(0, 79, 0, 12)
            Slider.Font = Enum.Font.Code
            Slider.Text = tostring(Name)
            Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
            Slider.TextSize = 14.000
            Slider.TextXAlignment = Enum.TextXAlignment.Left
            
            Slider_2.Name = "Slider"
            Slider_2.Parent = Slider
            Slider_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Slider_2.BorderSizePixel = 0
            Slider_2.Position = UDim2.new(1.4, 0, 0.5, 0)
            Slider_2.Size = UDim2.new(0, 105, 0, 1)
        
            Start.Name = "Start"
            Start.Parent = Slider_2
            Start.BorderSizePixel = 0
            Start.BackgroundTransparency = 1
            Start.Position = UDim2.new(0, 0, -7.3, 0)
            Start.Size = UDim2.new(0, 5, 0, 14)
            
            Button.Name = "Button"
            Button.Parent = Slider_2
            Button.Active = false
            Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0.97 / (1 / (Default / Max)), 0, -7.3, 0)
            Button.Selectable = false
            Button.Size = UDim2.new(0, 5, 0, 14)
            Button.Text = ""
            
            Status.Name = "Status"
            Status.Parent = Slider_2
            Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Status.BackgroundTransparency = 1.000
            Status.Position = UDim2.new(0.423376769, 0, -7.6, 0)
            Status.Size = UDim2.new(0, 15, 0, 17)
            Status.Font = Enum.Font.Code
            Status.Text = Default or Min
            Status.TextColor3 = Color3.fromRGB(255, 255, 255)
            Status.TextSize = 14.000
            Status.TextStrokeTransparency = 0.300
        
            Button.MouseButton1Down:Connect(function()
                down = true
                repeat
                    game:GetService("RunService").RenderStepped:Wait()
        
                    local value = (game:GetService("Players").LocalPlayer:GetMouse().X - Start.AbsolutePosition.X) / Start.AbsolutePosition.X * Start.AbsolutePosition.X / 105
                    if(value < -0.1 or value > 1.1) then
                        down = false
                    end
                    value = math.clamp(value, 0, 0.97)
                    local trueValue = Max / (0.95 / value)
                    trueValue = math.clamp(trueValue, Min, Max)
                    trueValue = math.floor((trueValue * 100) + 0.5) / 100
                    Button.Position = UDim2.new(value, 0, -7.3, 0)
                    Status.Text = math.floor(trueValue)
        
                    func(trueValue)
                until not down
            end)
        
            Button.MouseButton1Up:Connect(function()
                down = false
            end)
        
            Tab.Size = Tab.Size + UDim2.new(0, 0, 0, 10 + (4 * #Tab:GetChildren()))
        
            return Slider
        end
        
        return tabLibrary
    end

    return guiLibrary
end

return library
