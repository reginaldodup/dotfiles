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
vim.cmd("iab __html <!DOCTYPE><CR><html><CR></html><Esc>O<head><CR></head><Esc>O<title><++></title><Esc>jo<body><CR><++><CR></body>")
vim.cmd("iab __h1 <Esc>hi<h1></h1><Esc>4hi")
vim.cmd('iab __div# <Esc>hi<div class="<++><Del>"<Del>><++></div>')
