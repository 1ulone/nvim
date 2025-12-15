require("mini.pick").setup({
    mappings = {
        stop = 'q'
    },
    window = {
        config = function()
            local height = math.floor(vim.o.lines * 0.7)
            local width  = math.floor(vim.o.columns * 0.8)

            return {
                border = "single",
                relative = "editor",
                row = math.floor((vim.o.lines - height) / 2),
                col = math.floor((vim.o.columns - width) / 2),
                width = width,
                height = height,
            }
        end,
    },
})

vim.keymap.set("n", "<leader>ff", MiniPick.builtin.files, { desc = "Main way to search file" })
vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers, { desc = "Search a buffer" })
vim.keymap.set("n", "<leader>fg", MiniPick.builtin.grep_live, { desc = "Search a word inside parent directory" })

vim.keymap.set("n", "<leader>fe", function()
    MiniPick.builtin.grep({ pattern = "ERROR" })
end, { desc = "Search ERROR in all other instances of current project" })

vim.keymap.set("n", "<leader>fx", function()
    MiniPick.builtin.grep({ pattern = "FIXME" })
end, { desc = "Search FIXME in all other instances of current project" })

vim.keymap.set("n", "<leader>fd", function()
    MiniPick.builtin.grep({ pattern = "TODO" })
end, { desc = "Search TODO in all other instances of current project" })


--some mappings that i need to know (inside mini.pick)!
--TAB -> toggle preview file
--SHIFT + TAB -> toggle file info
--CTRL + T -> open in new tab
--CTRL + S -> open in split below
--CTRL + V -> open in split right
