vim.api.nvim_set_hl(0, "CustomPatternsError", {
    fg = "#000000",
    bg = "#F87E83",
    bold = true,
})

vim.api.nvim_set_hl(0, "CustomPatternsIgnore", {
    fg = "#000000",
    bg = "#D9E2C4",
    bold = true,
})


hp = require("mini.hipatterns")
hp.setup({
    highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
        note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
        error = { pattern = '%f[%w]()ERROR()%f[%W]', group = 'CustomPatternsError' },
        ignore = { pattern = '%f[%w]()IGNORE()%f[%W]', group = 'CustomPatternsIgnore' },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hp.gen_highlighter.hex_color(),
    },
})
