
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
                    transparent_background = false,
                },
            })
            vim.cmd.colorscheme("evergarden")
        end,
    },

    {
        "paulfrische/reddish.nvim",
        name = "reddish",
        lazy = false,
        -- config = function()
        --     vim.cmd.colorscheme("reddish")
        -- end,
    },

    {
        "ficcdaf/ashen.nvim",
        name = "ashen",
        tag = "*",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = false,
        },
        -- config = function(_, opts)
        --     require("ashen").setup(opts)
        --     vim.cmd.colorscheme('ashen')
        -- end,
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
