local function message()
    return [[ UL1 NEOVIM ]]
end

require("lualine").setup({
    options = {
        theme = 'seoul256',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
    },
    sections = {
        lualine_a = { message, 'mode' }
    }
})
