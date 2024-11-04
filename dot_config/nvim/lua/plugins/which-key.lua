return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
        preset = 'helix',
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
