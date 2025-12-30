return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            -- install parsers (name is c_sharp, NOT csharp)
            require("nvim-treesitter").install({
                ensure_installed = {
                    "lua",
                    "html",
                    "css",
                    "javascript",
                    "tsx",
                    "c_sharp",
                },
            })

            -- make sure filetypes are correct
            vim.filetype.add({
                extension = {
                    cs = "cs",
                    jsx = "javascriptreact",
                },
            })

            vim.treesitter.language.register("javascript", "javascriptreact")

            -- FORCE TreeSitter on buffer open (this is what you are missing)
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                end,
            })

            -- disable legacy syntax so TS colors are visible
            vim.cmd("syntax off")
        end,
    },

    {
        "tronikelis/ts-autotag.nvim",
        lazy = false,
        config = function()
            require("ts-autotag").setup()
        end,
    },
}
