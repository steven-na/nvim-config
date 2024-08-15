return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>tp", builtin.find_files, { desc = "Find files fuzzily" })
			vim.keymap.set("n", "<leader>tg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>ts", builtin.grep_string, { desc = "Live grep over string" })
			vim.keymap.set("n", "<leader>tb", builtin.current_buffer_fuzzy_find, { desc = "Live grep over buffer" })

			vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, { desc = "Live grep over local symbols" })
			vim.keymap.set(
				"n",
				"<leader>dw",
				builtin.lsp_dynamic_workspace_symbols,
				{ desc = "Live grep over workspace symbols" }
			)
			vim.keymap.set("n", "<leader>dt", builtin.lsp_type_definitions, { desc = "Go to symbol type" })
			vim.keymap.set("n", "<leader>dr", vim.lsp.buf.rename, { desc = "Rename symbol" })
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							require("telescope").load_extension("ui-select"),
						}),
					},
				},
			})
		end,
	},
}
