return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require("lualine").setup {
            options = {
                icon_enabled = true,
                -- theme = 'dracula'
                -- theme = 'papercolor_light'
            },
            sections = {
                lualine_a = {{ 'mode', }},
                lualine_c = {{ 'buffers' }}
            }
        }
    end
}
