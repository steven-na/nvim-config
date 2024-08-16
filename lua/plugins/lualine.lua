local utils = require("utils")
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "nord",
                component_separators = { left = "\\", right = "/" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        icon_enable = true,
                        fmt = function()
                            return utils.isNormal() and ""
                                or utils.isInsert() and ""
                                or utils.isVisual() and "󰒉"
                                or utils.isCommand() and ""
                                or utils.isReplace() and ""
                                or vim.api.nvim_get_mode().mode == "t" and ""
                                or ""
                        end,
                    },
                    "mode",
                },
                lualine_b = {
                    "branch",
                    "diff",
                },

                lualine_c = {
                    {
                        "diagnostics",
                        symbols = {
                            error = "󰅙 ",
                            warn = " ",
                            info = "󰋼 ",
                            hint = "󰌵 ",
                        },
                    },
                },
                lualine_x = {
                    { "filetype", colored = true, icon_only = true, icon = { align = "right" } },
                    "filename",
                },
                lualine_y = {
                    {
                        "progress",
                        color = function()
                            return {
                                fg = vim.fn.synIDattr(
                                    vim.fn.synIDtrans(
                                        vim.fn.hlID(
                                            "progressHl"
                                            .. (math.floor(((vim.fn.line(".") / vim.fn.line("$")) / 0.17))) + 1
                                        )
                                    ),
                                    "fg"
                                ),
                            }
                        end,
                    },
                },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {
                    { "filetype", colored = true, icon_only = true, icon = { align = "right" } },
                    "filename",
                },
                lualine_b = {
                    {
                        function()
                            return vim.api.nvim_get_current_win() .. ":" .. vim.api.nvim_get_current_buf()
                        end,
                    },
                },
                lualine_c = {},
                lualine_x = {},
                lualine_z = { "location" },
            },
        })
    end,
}
