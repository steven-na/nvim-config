return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "stylua", -- Lua
                    "gofumpt", -- Golang
                    "goimports-reviser",
                    "golines",
                },
                run_on_start = true,
                start_delay = 3000,
                -- debounce_hours = 5,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local util = require("lspconfig/util")

            lspconfig.lua_ls.setup({
                settings = {
                    capabilities = capabilities,
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_dir = util.root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedparams = true,
                        },
                    },
                },
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Code hover" })
            vim.keymap.set("n", "<leader>dd", vim.lsp.buf.definition, { desc = "Go to definition" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "gopls",
                },
            })
        end,
    },
}
