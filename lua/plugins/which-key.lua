return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup()

		-- Document existing key chains
		require("which-key").add({
			{ "<leader>c", group = "Code" },
			{ "<leader>d", group = "Symbol find" },
			{ "<leader>r", group = "Debug" },
            { "<leader>f", group = "Format" },
			{ "<leader>s", group = "Bufferline" },
			{ "<leader>t", group = "Telescope" },
			{ "<leader>p", group = "Swap function/param" },
			-- { "<leader>w", group = "[W]orkspack" },
			-- { "<leader>t", group = "[T]oggle" },
			-- { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
		})
	end,
}
