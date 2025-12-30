return {
    "folke/todo-comments.nvim",
    lazy = false,
    config = function()
        require("todo-comments").setup()
    end,
}
-- NOTE: im not installing no fucking plenary or fzf or extra package as is. 
-- shit is getting ridicilous. im fine with using <leader>fg to live grep TODO's.
