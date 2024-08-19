return {
    "rcarriga/nvim-notify",
    config = function ()
        require("notify").setup({
            render = "wrapped-compact",
            timeout = 2000,
        })
        vim.keymap.set("n", "<leader>N", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Notifications" })
        vim.notify = require("notify")
    end,
}
