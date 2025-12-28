require("nvim-treesitter").install({
    ensure_installed = {
        "html",
        "css",
        "javascript",
        "tsx",
        "csharp",
    },
})

vim.filetype.add({
    extension = {
        jsx = "javascriptreact",
    },
})

vim.treesitter.language.register("javascript", "javascriptreact")

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "html", "css", "javascript", "javascriptreact", "tsx" },
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})

require("ts-autotag").setup()
