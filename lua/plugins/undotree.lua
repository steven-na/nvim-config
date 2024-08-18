return {
	{
		"mbbill/undotree",
		config = function()
			vim.g.undotree_DiffCommand = "FC"
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Show undo tree" })
			vim.o.undofile = true
		end,
	},
}
