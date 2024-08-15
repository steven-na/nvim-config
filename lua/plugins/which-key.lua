return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup()

		-- Document existing key chains
		require("which-key").add({
			{ "<leader>c", group = "[C]ode" },
			{ "<leader>d", group = "[D] Symbol find" },
			-- { "<leader>r", group = "[R]ename" },
            { "<leader>f", group = "[F]ormat" },
			{ "<leader>s", group = "[S]witch" },
			{ "<leader>t", group = "[T]elescope" },
			-- { "<leader>w", group = "[W]orkspack" },
			-- { "<leader>t", group = "[T]oggle" },
			-- { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
		})
	end,
}
