require("oil").setup({
    default_file_explorer = true,
    columns = { "permissions", "icon" },
    keymaps = {
        ["<C-c>"] = false,
        ["<M-h>"] = "action.select_split",
        ["q"] = "actions.close"
    },
    delete_to_trash = true,
    view_options = { show_hidden = true },
    skip_confirm_for_simple_edits = true,
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Directory"})
