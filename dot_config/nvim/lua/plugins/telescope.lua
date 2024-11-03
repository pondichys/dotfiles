return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
	{ '<leader>sb', '<cmd>Telescope buffers<cr>', desc='[S]earch [B]uffers' },
	{ '<leader>sf', '<cmd>Telescope find_files<cr>', desc='[S]earch [F]iles' },
	{ '<leader>sg', '<cmd>Telescope live_grep<cr>', desc='[S]earch by [G]rep' },
	{ '<leader>sk', '<cmd>Telescope keymaps<cr>', desc='[S]earch [K]eymaps' },
	
    },
}
