return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-tree/nvim-web-devicons',
        'folke/todo-comments.nvim',
    },
    keys = {
	{ '<leader>fb', '<cmd>Telescope buffers<cr>', desc='[F]ind [B]uffers' },
	{ '<leader>fc', '<cmd>Telescope grep_string<cr>', desc='[F]ind string under [C]ursor in current working directory' },
	{ '<leader>ff', '<cmd>Telescope find_files<cr>', desc='[F]ind [F]iles in current working directory' },
	{ '<leader>fk', '<cmd>Telescope keymaps<cr>', desc='[F]ind [K]eymaps' },
	{ '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc='[F]ind [R]ecent files' },
	{ '<leader>fs', '<cmd>Telescope live_grep<cr>', desc='[F]ind [S]tring' },
	{ '<leader>ft', '<cmd>TodoTelescope<cr>', desc='[F]ind [T]odos' },
	
    },
    opts = {
        defaults = {
            path_display = {'smart'},
        },
    },
}
