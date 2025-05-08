-- -- Original setup
-- --print("Player controls")
-- local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- local globalConfig = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("GlobalConfig"))
-- local UserInputService = game:GetService("UserInputService")
-- local Players = game:GetService("Players")
-- local RunService = game:GetService("RunService")
-- local LocalPlayer = Players.LocalPlayer

-- local isActive = function()
-- 	return LocalPlayer:GetAttribute("PlayerState") == "launchReady"
-- 		or LocalPlayer:GetAttribute("PlayerState") == "flying"
-- end

-- -- Ensure LocalPlayer is ready
-- while not LocalPlayer and RunService:IsRunning() do
-- 	task.wait()
-- 	LocalPlayer = Players.LocalPlayer
-- end

-- -- Initialize attributes
-- if LocalPlayer:GetAttribute(globalConfig.ForceNames.main) == nil then
-- 	LocalPlayer:SetAttribute(globalConfig.ForceNames.main, false)
-- end

-- local directionAttributes = {
-- 	Forward = globalConfig.ForceNames.forward,
-- 	Backward = globalConfig.ForceNames.backward,
-- 	RollLeft = "RollLeft",
-- 	RollRight = "RollRight",
-- }

-- for _, attrName in pairs(directionAttributes) do
-- 	if LocalPlayer:GetAttribute(attrName) == nil then
-- 		LocalPlayer:SetAttribute(attrName, false)
-- 	end
-- end

-- local function disableDefaultControls()
-- 	local PlayerModule = require(LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule"))
-- 	local controls = PlayerModule:GetControls()
-- 	controls:Disable()
-- end

-- disableDefaultControls()

-- local function onInputBegan(inputObject, processedEvent)
-- 	if not isActive() or processedEvent then
-- 		return
-- 	end

-- 	if inputObject.UserInputType == Enum.UserInputType.Keyboard then
-- 		if inputObject.KeyCode == Enum.KeyCode.Space then
-- 			LocalPlayer:SetAttribute(globalConfig.ForceNames.main, true)
-- 		end
-- 		if inputObject.KeyCode == Enum.KeyCode.W or inputObject.KeyCode == Enum.KeyCode.Up then
-- 			--print("------forward")
-- 			LocalPlayer:SetAttribute(directionAttributes.Forward, true)
-- 		end
-- 		if inputObject.KeyCode == Enum.KeyCode.S or inputObject.KeyCode == Enum.KeyCode.Down then
-- 			LocalPlayer:SetAttribute(directionAttributes.Backward, true)
-- 		end
-- 		if inputObject.KeyCode == Enum.KeyCode.A or inputObject.KeyCode == Enum.KeyCode.Left then
-- 			LocalPlayer:SetAttribute(directionAttributes.RollLeft, true)
-- 		end
-- 		if inputObject.KeyCode == Enum.KeyCode.D or inputObject.KeyCode == Enum.KeyCode.Right then
-- 			LocalPlayer:SetAttribute(directionAttributes.RollRight, true)
-- 		end
-- 	end

-- 	if inputObject.UserInputType == Enum.UserInputType.Gamepad1 then
-- 		local keyCode = inputObject.KeyCode
-- 		if keyCode == Enum.KeyCode.ButtonA then
-- 			LocalPlayer:SetAttribute(globalConfig.ForceNames.main, true)
-- 		elseif keyCode == Enum.KeyCode.DPadUp then
-- 			LocalPlayer:SetAttribute(directionAttributes.Forward, true)
-- 		elseif keyCode == Enum.KeyCode.DPadDown then
-- 			LocalPlayer:SetAttribute(directionAttributes.Backward, true)
-- 		elseif keyCode == Enum.KeyCode.DPadLeft then
-- 			LocalPlayer:SetAttribute(directionAttributes.RollLeft, true)
-- 		elseif keyCode == Enum.KeyCode.DPadRight then
-- 			LocalPlayer:SetAttribute(directionAttributes.RollRight, true)
-- 		end
-- 	end
-- end

-- local myKeys = {
-- 	["Forward"] = { Enum.KeyCode.W, Enum.KeyCode.Up },
-- }

-- local function onInputEnded(inputObject, processedEvent)
-- 	if not isActive() or processedEvent then
-- 		return
-- 	end

-- 	if inputObject.UserInputType == Enum.UserInputType.Keyboard then
-- 		if inputObject.KeyCode == Enum.KeyCode.Space then
-- 			LocalPlayer:SetAttribute(globalConfig.ForceNames.main, false)
-- 		end
-- 		if table.find(myKeys.Forward, inputObject.KeyCode) then
-- 			LocalPlayer:SetAttribute(directionAttributes.Forward, false)
-- 			--print("forward stop")
-- 		end
-- 		if inputObject.KeyCode == Enum.KeyCode.S or inputObject.KeyCode == Enum.KeyCode.Down then
-- 			LocalPlayer:SetAttribute(directionAttributes.Backward, false)
-- 		end
-- 		if inputObject.KeyCode == Enum.KeyCode.A or inputObject.KeyCode == Enum.KeyCode.Left then
-- 			LocalPlayer:SetAttribute(directionAttributes.RollLeft, false)
-- 		end
-- 		if inputObject.KeyCode == Enum.KeyCode.D or inputObject.KeyCode == Enum.KeyCode.Right then
-- 			LocalPlayer:SetAttribute(directionAttributes.RollRight, false)
-- 		end
-- 	end

-- 	if inputObject.UserInputType == Enum.UserInputType.Gamepad1 then
-- 		local keyCode = inputObject.KeyCode
-- 		if keyCode == Enum.KeyCode.ButtonA then
-- 			LocalPlayer:SetAttribute(globalConfig.ForceNames.main, false)
-- 		elseif keyCode == Enum.KeyCode.DPadUp then
-- 			LocalPlayer:SetAttribute(directionAttributes.Forward, false)
-- 		elseif keyCode == Enum.KeyCode.DPadDown then
-- 			LocalPlayer:SetAttribute(directionAttributes.Backward, false)
-- 		elseif keyCode == Enum.KeyCode.DPadLeft then
-- 			LocalPlayer:SetAttribute(directionAttributes.RollLeft, false)
-- 		elseif keyCode == Enum.KeyCode.DPadRight then
-- 			LocalPlayer:SetAttribute(directionAttributes.RollRight, false)
-- 		end
-- 	end
-- end

-- UserInputService.InputBegan:Connect(onInputBegan)
-- UserInputService.InputEnded:Connect(onInputEnded)

-- -- Mobile controls setup
-- local function setupMobileControls()
-- 	local playerGui = LocalPlayer:WaitForChild("PlayerGui")

-- 	-- Wait for FlightScreenMobileControls to be added after respawn
-- 	local FlightScreenMobileControls = playerGui:WaitForChild("FlightScreenMobileControls", 5)
-- 	if not FlightScreenMobileControls then
-- 		warn("Mobile controls GUI not found.")
-- 		return
-- 	end

-- 	local thrustButton: TextButton = FlightScreenMobileControls:WaitForChild("ThrustButton")
-- 	local forwardButton: TextButton = FlightScreenMobileControls:WaitForChild("ForwardButton")
-- 	local backwardButton: TextButton = FlightScreenMobileControls:WaitForChild("BackwardButton")
-- 	local leftButton: TextButton = FlightScreenMobileControls:WaitForChild("LeftButton")
-- 	local rightButton: TextButton = FlightScreenMobileControls:WaitForChild("RightButton")

-- 	--print("loaded mobile")
-- 	--printthrustButton)

-- 	leftButton.InputBegan:Connect(function(input)
-- 		if input.UserInputType == Enum.UserInputType.Touch then
-- 			LocalPlayer:SetAttribute(directionAttributes.RollLeft, true)
-- 		end
-- 	end)
-- 	leftButton.InputEnded:Connect(function(input)
-- 		if input.UserInputType == Enum.UserInputType.Touch then
-- 			LocalPlayer:SetAttribute(directionAttributes.RollLeft, false)
-- 		end
-- 	end)

-- 	rightButton.InputBegan:Connect(function(input)
-- 		if input.UserInputType == Enum.UserInputType.Touch then
-- 			LocalPlayer:SetAttribute(directionAttributes.RollRight, true)
-- 		end
-- 	end)
-- 	rightButton.InputEnded:Connect(function(input)
-- 		if input.UserInputType == Enum.UserInputType.Touch then
-- 			LocalPlayer:SetAttribute(directionAttributes.RollRight, false)
-- 		end
-- 	end)

-- 	backwardButton.InputBegan:Connect(function(input)
-- 		if input.UserInputType == Enum.UserInputType.Touch then
-- 			LocalPlayer:SetAttribute(directionAttributes.Backward, true)
-- 		end
-- 	end)
-- 	backwardButton.InputEnded:Connect(function(input)
-- 		if input.UserInputType == Enum.UserInputType.Touch then
-- 			LocalPlayer:SetAttribute(directionAttributes.Backward, false)
-- 		end
-- 	end)

-- 	forwardButton.InputBegan:Connect(function(input)
-- 		if input.UserInputType == Enum.UserInputType.Touch then
-- 			LocalPlayer:SetAttribute(directionAttributes.Forward, true)
-- 		end
-- 	end)
-- 	forwardButton.InputEnded:Connect(function(input)
-- 		if input.UserInputType == Enum.UserInputType.Touch then
-- 			LocalPlayer:SetAttribute(directionAttributes.Forward, false)
-- 		end
-- 	end)

-- 	thrustButton.InputBegan:Connect(function(input)
-- 		--print("main")
-- 		if input.UserInputType == Enum.UserInputType.Touch then
-- 			--print("main inside")
-- 			LocalPlayer:SetAttribute(globalConfig.ForceNames.main, true)
-- 		end
-- 	end)
-- 	thrustButton.InputEnded:Connect(function(input)
-- 		if input.UserInputType == Enum.UserInputType.Touch then
-- 			LocalPlayer:SetAttribute(globalConfig.ForceNames.main, false)
-- 		end
-- 	end)
-- end

-- if UserInputService.TouchEnabled then
-- 	--print("TouchEnabled")

-- 	LocalPlayer.CharacterAdded:Connect(function()
-- 		--print("CharacterAdded:", character:GetFullName())
-- 		setupMobileControls()
-- 	end)

-- 	-- Optional: if the character already exists (like on first spawn)
-- 	if LocalPlayer.Character then
-- 		setupMobileControls()
-- 	end
-- end
