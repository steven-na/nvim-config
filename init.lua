-- vim.o.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.wo.wrap = false

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Unbind Insert key in all modes
vim.api.nvim_set_keymap("n", "<Insert>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<Insert>", "<Nop>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("v", "S", "<Nop>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "S", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics" })

vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- vim.keymap.set("n", "<leader>C", function()
-- 	local showtabline = vim.o.showtabline
-- 	if showtabline > 0 then
-- 		vim.o.showtabline = 0 -- Hide bufferline
-- 		vim.o.laststatus = 0 -- Disable the status line entirely
-- 		require("lualine").hide({ unhide = false }) -- Hide lualine
-- 	else
-- 		vim.o.showtabline = 2 -- Show bufferline
-- 		vim.o.laststatus = 2 -- Enable the status line
-- 		require("bufferline").setup() -- Reinitialize bufferline
-- 		require("lualine").hide({ unhide = true }) -- Show lualine
-- 	end
-- end, { desc = "Zen Mode" })

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.swapfile = false

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10

local sec = vim.diagnostic.severity

vim.diagnostic.config({
	virtual_text = { prefix = "" },
	signs = { text = { [sec.ERROR] = "󰅙", [sec.WARN] = "", [sec.INFO] = "󰋼", [sec.HINT] = "󰌵" } },
	underline = true,
	float = { border = "single" },
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	spec = { { import = "plugins" } },
	install = { colorscheme = { "nord" } },
	checker = { enabled = true },
})
