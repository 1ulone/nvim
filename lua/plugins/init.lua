local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require("plugins.oil"),
    require("plugins.lazygit"),
    require("plugins.colorscheme"),
    require("plugins.mini"),
    require("plugins.lualine"),

    require("plugins.blink"),
    require("plugins.mason"),
    require("plugins.lspconfig"),

    require("plugins.treesitter"),
    require("plugins.todo-comments")
}, {
    checker = { enabled = false },
    defaults = { lazy = true, version = false },
    install = { missing = true },
})
