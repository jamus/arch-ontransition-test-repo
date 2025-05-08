local RunService = game:GetService("RunService")

local connection

return {
  janitor = true,
	OnEntry = function(context)
    local elapsedTime = 0
    connection = RunService.Heartbeat:Connect(function(dt)
      -- Accumulate elapsed time
      elapsedTime += dt
    
      -- Debug log
      print("LaunchReady Heartbeat", elapsedTime)
    
      -- Check if 5 seconds have passed
      if elapsedTime >= 2 then
        context.Send("liftoff")
        print("Liftoff sent!")
    
        -- Disconnect the Heartbeat after sending the event
        connection:Disconnect()
      end
    end)

		context.janitor:Add(connection, "Disconnect") -- automatically disconnects the heartbeat connection when the state is exited
	end,
	OnExit = function()
		-- print("Exiting launchReady state")
	end,
	events = {
		liftoff = { target = "flying" },
	},
}
