-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g = vim.g       -- Global variables
local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.cmd('set nocompatible')
vim.cmd('syntax enable')
vim.cmd('filetype plugin on')
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true           -- Show line number
opt.relativenumber = true   -- Show line number
opt.showmatch = true        -- Highlight matching parenthesis
opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
-- opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.wrap = false            -- Firstly do not wrap
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus=3            -- Set global statusline
-- single pixel window separator lines
vim.cmd('highlight WinSeparator guibg=None')

-- Finding files
vim.cmd('set path+=**')     -- Search down into folders
vim.cmd('set wildmenu')     -- Display match when tab complete

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 4          -- Shift 4 spaces when tab
opt.tabstop = 4             -- 1 tab == 4 spaces
-- opt.smartindent = true      -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 250        -- ms to wait for trigger an event

-----------------------------------------------------------
-- Folding method
-----------------------------------------------------------
opt.foldmethod='indent'
vim.cmd('set nofoldenable')
-- opt.foldmethod='manual'
-- if above option is used:
-- zf - Create
-- zd - delete
-- zD - recursize delete
-- zR - Reveal all
-- za - toggle fold: mapped tu <space> in keymaps.lua

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "sI"


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

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Search placeholders
vim.cmd('map <leader><leader> :keepp /<++><CR>ca<')
vim.cmd('imap <leader><leader> <Esc>:keepp /<++><CR>ca<')

-- Toggle line wrap
vim.cmd('map ,w :set wrap!<CR>')

-- Resize with arrows
map('n', '<up>', ':resize +2<cr>')
map('n', '<down>', ':resize -2<cr>')
map('n', '<left>', ':vertical resize -2<cr>')
map('n', '<right>', ':vertical resize +2<cr>')

-- Map Esc to kk
map('i', 'kk', '<Esc>')

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

-- Python abbreviations
-- All abbreviations are created considering <CR> after typing
-- NOT <space>. The cursor will try to move up to compensate
-- and more important, no extra unecessary space is added after
-- completion
-- Important:
-- <Del> is used as closing mappings are in place (<{'""'}>)
-- to be removed otherwise

-- Imports
vim.cmd('iab __pd import pandas as pd')
vim.cmd('iab __np import numpy as np')
vim.cmd('iab __json import json')
vim.cmd('iab __plt import matplotlib.pyplot as plt')

-- control blocks
vim.cmd('iab __lc [<Del> <++> for <++> in <++> if <++> ]<Esc>k0')
vim.cmd('iab __ifelse if <++>:<CR><++><CR>else:<CR><++><Esc>5k0')
vim.cmd('iab __for for <++> in <++>:<CR><++><Esc>3k0')

vim.cmd("iab __open with open(<Del>'<Del><++>'<Del>) as f:<Esc>k0")

-- Pandas
-- read / write
vim.cmd("iab __pdcsv # Read csv file<CR>df = pd.open_csv(<Del>'<Del><++>'<Del>)<Esc>k0")
vim.cmd("iab __df2csv # Write to csv file<CR>df.to_csv(<Del>'<Del><++>.csv'<Del>)<Esc>k0")
vim.cmd("iab __pdpkl # Read pickle file<CR>df = pd.open_pickle('<Del><++>'<Del>)<Esc>k0")
vim.cmd("iab __df2pkl # Write to pickle file<CR>df.to_pickle(<Del>'<Del><++>.pickle'<Del>)<Esc>k0")

-- HTML to be added
