return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,
                -- JavaScript
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.diagnostics.eslint_d,
                -- Python
                null_ls.builtins.formatting.black;
                null_ls.builtins.diagnostics.pylint;
                null_ls.builtins.formatting.isort;
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
