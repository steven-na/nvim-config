return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				separator_style = "slant",
				themable = true,
				numbers = function(opts)
					return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
				end,
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
		vim.keymap.set("n", "<leader>s1", ":BufferLineGoToBuffer 1<CR>")
		vim.keymap.set("n", "<leader>s2", ":BufferLineGoToBuffer 2<CR>")
		vim.keymap.set("n", "<leader>s3", ":BufferLineGoToBuffer 3<CR>")
		vim.keymap.set("n", "<leader>s4", ":BufferLineGoToBuffer 4<CR>")
		vim.keymap.set("n", "<leader>s5", ":BufferLineGoToBuffer 5<CR>")
		vim.keymap.set("n", "<leader>s6", ":BufferLineGoToBuffer 6<CR>")
		vim.keymap.set("n", "<leader>s7", ":BufferLineGoToBuffer 7<CR>")
		vim.keymap.set("n", "<leader>s8", ":BufferLineGoToBuffer 8<CR>")
		vim.keymap.set("n", "<leader>s9", ":BufferLineGoToBuffer 9<CR>")
	end,
}
