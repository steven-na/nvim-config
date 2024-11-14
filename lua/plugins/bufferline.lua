return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				separator_style = "slant",
				indicator = {
					style = "underline",
				},
				themable = true,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Files",
						highligh = "Directory",
						separator = true,
					},
				},
			},
			highlights = require("nord.plugins.bufferline").akinsho(),
		})

		vim.keymap.set("n", "<Leader>s", ":BufferLinePick<CR>", { desc = "Switch tabs" })
	end,
}
