return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
      {"<leader>e", "<cmd>Neotree toggle<cr>", desc="Show/hide Neotree file explorer"},
      {"<leader>ge", "<cmd>Neotree source=git position=float toggle<cr>",desc="Show/hide Neotree git explorer as floating window"},
    },
}
