return {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "LazyGit" },
    keys = {
        { "lg", "<CMD>LazyGit<CR>", desc = "Open LazyGit", silent = true },
    },
}
