return {
    "echasnovski/mini.nvim",
    lazy = false,
    config = function()
        require("mini.pick").setup({
            mappings = { stop = "q" },
            window = {
                config = function()
                    local height = math.floor(vim.o.lines * 0.7)
                    local width = math.floor(vim.o.columns * 0.8)
                    return {
                        border = "single",
                        relative = "editor",
                        row = math.floor((vim.o.lines - height) / 2),
                        col = math.floor((vim.o.columns - width) / 2),
                        width = width,
                        height = height,
                    }
                end,
            },
        })

        local function set_hl_bg_none(group)
            vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
        end

        set_hl_bg_none("MiniPickBorder")
        set_hl_bg_none("MiniPickPrompt")
        set_hl_bg_none("MiniPickInput")
        set_hl_bg_none("MiniPickResult")
        set_hl_bg_none("NormalFloat")

        vim.keymap.set("n", "<leader>ff", MiniPick.builtin.files)
        vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers)
        vim.keymap.set("n", "<leader>fg", MiniPick.builtin.grep_live)
        vim.keymap.set("n", "<leader>fe", function()
            MiniPick.builtin.grep({ pattern = "ERROR" })
        end)
        vim.keymap.set("n", "<leader>fx", function()
            MiniPick.builtin.grep({ pattern = "FIXME" })
        end)
        vim.keymap.set("n", "<leader>fd", function()
            MiniPick.builtin.grep({ pattern = "TODO" })
        end)

        require("mini.files").setup({
            mappings = {
                go_in = "<Right>",
                go_in_plus = "<CR>",
                go_out = "<Left>",
                go_out_plus = "<M-CR>",
            },
            windows = { preview = true },
        })

        vim.keymap.set("n", "<leader>mf", MiniFiles.open)
        vim.keymap.set("n", "<leader>ef", function()
            MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
            MiniFiles.reveal_cwd()
        end)

        require("mini.icons").setup()
        require("mini.comment").setup()
        require("mini.pairs").setup()
        require("mini.surround").setup()
        require("mini.git").setup()
        require("mini.splitjoin").setup()
    end,
}
