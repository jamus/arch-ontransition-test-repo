return {
	janitor = true,
	OnEntry = function(context)
		task.wait(6)
		context.Send("goForLaunch")
	end,
	OnExit = function()
	end,
	events = {
		goForLaunch = { target = "launchReady" },
	},
}
