return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end
            end,
            sources = {
                -- Lua
                null_ls.builtins.formatting.stylua,
                -- JavaScript
                null_ls.builtins.formatting.prettierd,
                require("none-ls.diagnostics.eslint_d"),
                -- Python
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.formatting.isort,
                -- Golang
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.goimports_reviser,
            },
        })

        vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format document" })
    end,
}
