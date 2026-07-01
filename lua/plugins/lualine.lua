return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
        local function message()
            return [[ UL1 NEOVIM ]]
        end

        require("lualine").setup({
            options = {
                theme = "ayu_dark",
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { message, "mode" },
            },
        })
    end,
}
