local RunService = game:GetService("RunService")

return {
	janitor = true,
	OnEntry = function(context)
		print("OnEntry Flying")
		local connection = RunService.Heartbeat:Connect(function()
			print("flying Heartbeat")
			
			context.Send("touchdown")
		end)

		context.janitor:Add(connection, "Disconnect") -- automatically disconnects the heartbeat connection when the state is exited
	end,
	OnExit = function()
		-- print("Exiting flying state")
	end,
	events = {
		touchdown = { target = "landed" },
	},
}
