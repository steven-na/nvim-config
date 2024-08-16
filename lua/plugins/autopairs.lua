return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")

			npairs.setup({
				check_ts = true,
				ts_config = {
					-- lua = { "string" }, -- it will not add a pair on that treesitter node
					-- javascript = { "template_string" },
					-- java = false, -- don't check treesitter on java
				},
				disable_filetype = { "TelescopePrompt" },
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = string.gsub([[ [%'%"%)%>%]%)%}%, ] ]], "%s+", ""),
					offset = 0,
					end_key = "$",
					cursor_pos_before = true,
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					manual_position = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
			})
		end,
	},
}
