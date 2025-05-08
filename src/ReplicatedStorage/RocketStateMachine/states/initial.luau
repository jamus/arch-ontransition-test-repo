

return {
	janitor = true,
	OnEntry = function(context)
    task.wait(5)
		context.Send("initialised")
	end,
	OnExit = function()
	end,
	events = {
		initialised = { target = "landed" },
	},
}
