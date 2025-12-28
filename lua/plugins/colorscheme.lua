require("evergarden").setup({
    theme = {
        variant = 'winter',
        accent = 'blue',
    },
    editor = {
        transparent_background = true,
    }
})

-- require('nightfox').setup({
--     options = {
--         transparent = true,
--     },
-- })

-- require('kanso').setup({
--     transparent = true,
--     foreground = "saturated",
-- })

vim.cmd("colorscheme evergarden")
