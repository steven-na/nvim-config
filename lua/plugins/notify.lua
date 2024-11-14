return {
    "rcarriga/nvim-notify",
    config = function ()
        require("notify").setup({
            render = "compact",
            stages = "slide",
            nimeout = 2000,
        })
        vim.keymap.set("n", "<leader>N", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Notifications" })
        vim.notify = require("notify")
    end,
}
