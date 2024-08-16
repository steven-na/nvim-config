return {
	"goolord/alpha-nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- require("alpha").setup(require("alpha.themes.theta").config)
		local theta = require("alpha.themes.theta")
		local dashboard = require("alpha.themes.dashboard")
		theta.file_icons.provider = "mini"
		theta.buttons.val = {
			{ type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
			{ type = "padding", val = 1 },
			dashboard.button("e", "  New file", "<cmd>ene<CR>"),
			dashboard.button("SPC t p", "󰈞  Find file"),
			dashboard.button("SPC t g", "󰊄  Live grep"),
			dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
			dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
		}
		require("alpha").setup(theta.config)
		-- local dashboard = require("alpha.themes.dashboard")
		-- dashboard.file_icons.provider = "devicons"
		--
		-- dashboard.section.header.val = {
		-- 	[[  ██████   █████                   █████   █████  ███                  ]],
		-- 	[[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
		-- 	[[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
		-- 	[[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
		-- 	[[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
		-- 	[[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
		-- 	[[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
		-- 	[[ ░░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░ ]],
		-- }
		-- dashboard.file_icons.provider = "devicons"
		-- require("alpha").setup(dashboard.config)
	end,
}
