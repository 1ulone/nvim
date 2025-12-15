vim.pack.add({
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/everviolet/nvim',
    'https://github.com/kdheepak/lazygit.nvim',
    'https://github.com/nvim-mini/mini.pick',
    'https://github.com/nvim-mini/mini.icons',
    'https://github.com/nvim-mini/mini.files',
    'https://github.com/nvim-mini/mini.hipatterns',
    'https://github.com/nvim-mini/mini.statusline',
})

--short plugins that just needs one line
require('mini.icons').setup() --icons setup
vim.keymap.set("n", "lg", "<CMD>LazyGit<CR>", { silent=true, desc="Open LazyGit"} ) --Lazygit keymap

--other plugins that is quite long
require('plugins.oil')
require('plugins.colorscheme')
require('plugins.mini.pick')
require('plugins.mini.files')
require('plugins.mini.hipatterns')
require('plugins.mini.statusline')
