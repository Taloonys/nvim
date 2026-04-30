local logs_highlight = {
	"fei6409/log-highlight.nvim",
	opts = {
		filename = {
			"txt",
			"syslog",
		},
		-- pattern = {
		--     "log/trace/.*.txt"
		-- },
		keyword = {
			error = "ERROR",
			warning = "WARNING",
			info = "INFO",
			debug = "DEBUG",
		},
	},
}

return { logs_highlight }
