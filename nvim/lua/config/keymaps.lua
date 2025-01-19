-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
    local options = { noremap=true, silent=true }
        if opts then
            options = vim.tbl_extend('force', options, opts)
        end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','
vim.g.maplocalleader = "\\"

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Search placeholders
vim.cmd('map <leader><leader> k:keepp /<++><CR>0f+ca<')
vim.cmd('imap <leader><leader> <Esc>k:keepp /<++><CR><Esc>0f+ca<')

-- Toggle line wrap
vim.cmd('map ,w :set wrap!<CR>')

-- Move lines
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Resize with arrows
map('n', '<up>', ':resize +2<cr>')
map('n', '<down>', ':resize -2<cr>')
map('n', '<left>', ':vertical resize -2<cr>')
map('n', '<right>', ':vertical resize +2<cr>')

-- Map Esc to jj
map('i', 'jj', '<Esc>')

-- leader + tab for buffer next
map('n', '<tab>', ':bn<cr>')
map('n', '<S-tab>', ':bp<cr>')
-- List all buffers with:
--  :ls
-- Navigation
--  :bn, :bnext
--  :bp, :bprevious
-- To opne in a split use 
--  :sbn, :sbnext
--  :sbp, :sbprevious
-- To go to first biffer:
--  :bfirst, :bf, :brewind, :br
--  :sbfirst, :sbf, :sbrewind, :sbr
-- To go to last buffer:
--  :blast, :bl, :sblast, :sbl
-- To go to next modified buffer:
--  :bm, :bmodified
-- To remove a buffer:
--  :bd, :bdel, :bdelete

-- Folds
map('n', '<space>', 'za')

-- Clear search highlighting with <leader> and c
map('n', '<leader>h', ':nohl<CR>')
map('n', '<CR>', ':nohl<CR>')

-- Auto closing
vim.cmd('inoremap " ""<left>')
vim.cmd('inoremap ( ()<left>')
vim.cmd("inoremap ' ''<left>")
vim.cmd('inoremap [ []<left>')
vim.cmd('inoremap { {}<left>')

-- Toggle auto-indenting for code paste
-- map('n', '<F2>', ':set invpaste paste?<CR>')
-- vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>k', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- NvimTree (plugin required)
-- map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
-- map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
-- map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

map('n', '<leader>!', '!!snip<CR>')
map('v', '<leader>!', '!snip<CR>')
