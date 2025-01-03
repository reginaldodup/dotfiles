local builtin = require('telescope.builtin')

vim.keymap.set('n','<c-p>', builtin.find_files, {})
vim.keymap.set('n','<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n','<leader>fg', builtin.live_grep, {})
vim.keymap.set('n','<Space>fh', builtin.help_tags, {})

require('telescope').setup({
    defaults = {
        file_ignore_patterns = {
            'node_modules',
            'venv',
            '.venv',
            '.git',
			'__pycache__',
			'*.pyc'
        }
    }
})
