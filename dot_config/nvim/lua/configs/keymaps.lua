local keymap = vim.keymap
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Easier window splits
keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[S]plit window [V]ertically' })
keymap.set('n', '<leader>sh', '<C-w>h', { desc = '[S]plit window [H]orizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = '[S]plit window [E]qual size' })
keymap.set('n', '<leader>sx', '<cmd>close<cr>', { desc = '[S]plit window e[X]it' })
