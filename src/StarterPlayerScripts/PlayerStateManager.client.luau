local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local states = ReplicatedStorage:WaitForChild("RocketStateMachine"):WaitForChild("states")
local Arch = require(ReplicatedStorage.Packages.arch)

local player = Players.LocalPlayer
player:SetAttribute("PlayerState", "__none__")

	local options = {
    id = "rocketStateMachine_99",
		context = {
			rocket = nil,
		},
		actions = {
			-- Define any actions here
			updatePlayerState = function(context)
				print("Updating player state to:", context)
				context.player:SetAttribute("PlayerState", context.target)
			end,
		},
		guards = {},
		maxLogs = 30,
		logTime = true,
		debugMode = true,
	}

	local rocketPlayerStateMachine = Arch.createMachine({
		id = "rocketStateMachine_99",
		initial = "initial",
		states = {
			initial = require(states.initial),
			landed = require(states.landed),
			launchReady = require(states.launchReady),
			flying = require(states.flying),
		},
	}, options)

  rocketPlayerStateMachine.onTransition:Connect(function(data)
    local state = data.value[1].id
    print("💫 onTransition registered, --> ", state)
  end)

	rocketPlayerStateMachine:Start()



