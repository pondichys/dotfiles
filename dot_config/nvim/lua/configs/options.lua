-- Display line number
vim.opt.number = true

-- Enable mouse
vim.opt.mouse = 'a'

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Handling tabs as spaces
-- See https://neovim.io/doc/user/usr_30.html#_tabs-and-spaces for more info
-- Tips: use :retab to convert existing tabs to spaces when expandtab is true
-- Shift keys >> << == use 4 spaces
vim.opt.shiftwidth = 4
-- length to use when editing text (eg. TAB and BS keys)
-- (0 for ‘tabstop’, -1 for ‘shiftwidth’)
vim.opt.softtabstop = -1
-- Only insert spaces; otherwise insert \t and complete with spaces 
vim.opt.expandtab = true
