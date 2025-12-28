--ICONS : adding pretty icons in pick and oil
require('mini.icons').setup()

-- COMMENT : auto commenting with the keymaps being : 
-- -> normal then "gcc" -> will comment current line
-- -> visual/selected  then "gc" -> will comment current selected block
require('mini.comment').setup()

-- PAIRS : Auto pairs brackets and quotation.
require('mini.pairs').setup() --pairs setup

-- SURROUND : Replace surrounding words bracket or something, example : 
-- "sa" + "any surrounding symbol" -> add the symbol around the selected/highlighted word
-- "sd" + "any surrounding symbol" -> delete the symbol around the selected/highlighted word
-- "sr" + "surrounding symbol that wanted to be changed" + "any surrounding symbol" -> replace the symbol around the selected/highlighted word
require('mini.surround').setup()

-- GIT : just for statusline for now
require('mini.git').setup()

-- SPLIT JOIN : just to Toggle brackets to be one line or spread out
-- "gS" -> toggle split and join
require('mini.splitjoin').setup()
