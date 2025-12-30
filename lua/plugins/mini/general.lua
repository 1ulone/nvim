--ICONS : adding pretty icons in pick and oil

-- COMMENT : auto commenting with the keymaps being : 
-- -> normal then "gcc" -> will comment current line
-- -> visual/selected  then "gc" -> will comment current selected block

-- PAIRS : Auto pairs brackets and quotation.

-- SURROUND : Replace surrounding words bracket or something, example : 
-- "sa" + "any surrounding symbol" -> add the symbol around the selected/highlighted word
-- "sd" + "any surrounding symbol" -> delete the symbol around the selected/highlighted word
-- "sr" + "surrounding symbol that wanted to be changed" + "any surrounding symbol" -> replace the symbol around the selected/highlighted word

-- GIT : just for statusline for now

-- SPLIT JOIN : just to Toggle brackets to be one line or spread out
-- "gS" -> toggle split and join

-- return {
--   "echasnovski/mini.nvim",
--   config = function()
--     require("mini.icons").setup()
--     require("mini.comment").setup()
--     require("mini.pairs").setup()
--     require("mini.surround").setup()
--     require("mini.git").setup()
--     require("mini.splitjoin").setup()
--   end,
-- }
