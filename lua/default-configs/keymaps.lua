local opts = { noremap = true, silent = true }

vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc= "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc= "moves lines down in visual selection" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in the search buffer and center the cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in the search buffer and center the cursor" })

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("v", "p", '"_dp', opts)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlight", silent = true })

vim.keymap.set("n", "<leader>fl", vim.lsp.buf.format)
vim.keymap.set("n", "x", '"_x', opts)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "faster way to replace globally"})
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "make files executable" })

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>")
vim.keymap.set("n", "<leader>ll", "<cmd>tabnext<CR>")
vim.keymap.set("n", "<leader>pp", "<cmd>tabprev<CR>")

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>sx", "<C-w>close<CR>", { desc = "Close split window" })
vim.keymap.set("n", "<C-J>", "<C-w>j", { desc = "Move up window" })
vim.keymap.set("n", "<C-K>", "<C-w>k", { desc = "Move up window" })
vim.keymap.set("n", "<C-H>", "<C-w>h", { desc = "Move up window" })
vim.keymap.set("n", "<C-L>", "<C-W>l", { desc = "Move up window" })

vim.keymap.set("n", "<leader>fp", function()
    local filePath = vim.fn.expand("%:~")
    vim.fn.setreg("+", filePath)
    print("This File path copied to clipboard : " .. filePath)
end, { desc = "Copy file path to clipboard" })

vim.keymap.set("n", "<leader>fc", function()
    require("conform").format()
end, { desc = "Format file" })
