return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup()
        end,
    },

    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        lazy = false,
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "lua_ls",
                    "html",
                    "cssls",
                    "tailwindcss",
                    "ts_ls",
                    "laravel_ls",
                    "omnisharp",
                },
                auto_update = false,
                run_on_start = false,
            })
        end,
    },
}

