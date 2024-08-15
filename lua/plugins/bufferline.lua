return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                diagnostics = "nvim_lsp",
                separator_style = "thin",
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

        vim.keymap.set('n', '<Leader>bl', ':BufferLinePick<CR>', {})
    end,
}
