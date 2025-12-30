
return {
    {
        "everviolet/nvim",
        name = "evergarden",
        lazy = false,
        priority = 1000,
        config = function()
            require("evergarden").setup({
                theme = {
                    variant = "winter",
                    accent = "blue",
                },
                editor = {
                    transparent_background = true,
                },
            })
            vim.cmd.colorscheme("evergarden")
        end,
    },

    {
        "EdenEast/nightfox.nvim",
        lazy = true,
        config = function()
            require("nightfox").setup({
                options = {
                    transparent = true,
                },
            })
        end,
    },

    {
        "webhooked/kanso.nvim",
        lazy = true,
        config = function()
            require("kanso").setup({
                transparent = true,
                foreground = "saturated",
            })
        end,
    },
}
