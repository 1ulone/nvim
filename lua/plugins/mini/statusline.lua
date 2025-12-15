local function git_msg()
  return vim.b.gitsigns_head and (" " .. vim.b.gitsigns_head) or ""
end

sl = require("mini.statusline")
sl.setup({
    use_icons = true,
})
