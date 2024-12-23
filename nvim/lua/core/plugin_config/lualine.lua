require('lualine').setup {
    options = {
        icon_enabled = true,
        -- theme = 'onedark'
        theme = 'papercolor_light'
    },
    sections = {
        lualine_a = {{ 'mode', }},
        lualine_c = {{ 'buffers' }}
    }
}
