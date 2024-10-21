return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,

	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>y", group = "[Y]ank" },
			{ "<leader>e", group = "[E]xplorer" },
			{ "<leader>s", group = "[S]plit" },
			{ "<leader>t", group = "[T]ab" },
			{ "<leader>x", group = "diagnostics" },
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>c", group = "[C]ursor" },
		})
	end,

	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
}
