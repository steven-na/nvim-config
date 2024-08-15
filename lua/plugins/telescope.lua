return {
    {
        "nvim-telescope/telescope.nvim", tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>tp', builtin.find_files, { desc = 'Find files fuzzily' })
            vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = 'Live grep' })
            vim.keymap.set('n', '<leader>ts', builtin.grep_string, { desc = 'Live grep over string' })
            vim.keymap.set('n', '<leader>tb', builtin.current_buffer_fuzzy_find, { desc = 'Live grep over buffer' })

            require('telescope').load_extension('fzf')
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            require("telescope").load_extension("ui-select")
                        }
                    }
                }
            }
        end
    },
}
