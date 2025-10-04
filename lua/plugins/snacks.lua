return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            explorer = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            picker = { enabled = true },
            notifier = { enabled = false },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
        keys = {
            { "<leader>lg", function() require("snacks").lazygit() end, desc = "Open Lazygit" },
            { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Open Lazygit Logs" },
            { "<leader>rN", function() require("snacks").rename.rename_file() end, desc = "Rename Current file" },
            { "<leader>dB", function() require("snacks").bufDelete() end, desc = "Delete or Close buffer?" },

            { "<leader>ff", function() require("snacks").picker.files() end, desc = "find files" },
            { "<leader>pc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Neovim Config file" },
            { "<leader>ps", function() require("snacks").picker.grep() end, desc = "Grep word" },
            { "<leader>pws", function() require("snacks").picker.grep_word() end, desc = "Search visual selection or word", mode = {"n", "x"} },
            { "<leader>gs", function() require("snacks").picker.git_branches({ layout = "select" }) end, desc="pick and switch Git Branches" },
        }
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        keys = {
            { "<leader>pt", function() require("snacks").picker.todo_comments() end, desc = "Search Todo's" },
            { "<leader>pT", function() require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc="Search Todo/Fix/Fixme" }
        }
    }
}
