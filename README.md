# Neovim Installation
to install _neovim_ that will be easily managed in the future. we'll use "bob" _neovim_ package manager
https://github.com/MordechaiHadad/bob
it'll manage neovim version and it'll be easier to use different version of neovim (If i wanted to, but i probably won't)

so here are the step to install bob.
`cargo install bob-nvim`
done. bob is installed use `bob list` to check.

now to install neovim just do 
`bob install <version>`
which i will use nightly (apparently it's good, similar to have a pre-installed lazy)
so just do `bob install v0.11.0`
then `bob list` to check
lastly `bob use v0.11.0` to select the neovim version that'll be used.

lastly to add bob neovim to the environment path of a machine will different from each os.
Ubuntu : 
`nano ~/.bashrc`
then add
`export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"`

restart your terminal, then type nvim to access neovim.
You Can Access different version of neovim i've set up by branch. (v0.11.0 or v0.12.0)

# Basic Configuration
# Intro
Configuration file that i will be using is a .lua filetype, all neovim configuration file will be made into 1 folder. inside:
Ubuntu : `~/.config/nvim`
Windows : `C:/Users/UserName/AppData/Roaming/nvim` <-maybe wrong fix later

This is the config structure i end up with :
```
after/ 
lua/
init.lua
```
Then init.lua handles the default config with these lines:
```
require("default-configs")
require("plugins")
```
what it'll do is to try and get a folder with that name that has a init.lua inside of it. It'll search those folder *ONLY* in a folder named `lua/`
So then inside the folder `lua/` it'll have exactly 2 folder named `default-configs/` and `plugins`

# Default Configs
go inside `default-configs/` inside we'll make 3 files called:
```
init.lua
keymaps.lua
options.lua
```
for init.lua : 
```
require("default-configs.options")
require("default-configs.keymaps")
```
With init.lua being setup like that it'll basically try to get the keymaps.lua and options.lua code there. so from the very top of init.lua will fetch the folder `lua/default-configs/init.lua` which will then fetch `lua/default-configs/options.lua` and `lua/default-configs/keymaps.lua` , i might be asking why dont i just `require("default-configs.options")` on the very first init.lua?, well this is just a matter of preferences after all. im doing that. so i know my code is structured clean. true that the default-configs folder only contain 2 scripts of configs. but in the plugins folder, this approach is very helpfull to organize things. 
here are my `options.lua` and `keymaps.lua` configs
#### options.lua
```
vim.o.number = true
vim.o.relativenumber = true

vim.o.scrolloff = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.wrap = true

vim.o.incsearch = true
vim.o.inccommand = "split"
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.mouse = ""
vim.o.background = "dark"
vim.o.termguicolors = true

vim.o.swapfile = true

vim.o.splitright = true
vim.o.splitbelow = true
```
#### keymaps.lua
```
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
```

# PLUGINS
To setup the plugins let's create the `init.lua` file first. then since we are using neovim 0.12.0 we can use it's newly (at this time) added vim.pack manager. we can do this to add a new plugins:
```
vim.pack.add({
	<package-link>
})
```
with the example of a package link is a github link that ends with a .nvim like this `https://github.com/stevearc/oil.nvim`
after that i managed individual package with its own scripts inside of the `plugins/` folder, by calling those scripts with `require('plugins.<scripts-name>')` 

here are each plugins i use explained and how to set them up (with context im using neovim 0.12 / nightly)
### stevearc/oil
Github : https://github.com/stevearc/oil.nvim
```
require("oil").setup({
    default_file_explorer = true,
    columns = { "permissions", "icon" },
    keymaps = {
        ["<C-c>"] = false,
        ["<M-h>"] = "action.select_split",
        ["q"] = "actions.close"
    },
    delete_to_trash = true,
    view_options = { show_hidden = true },
    skip_confirm_for_simple_edits = true,
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Directory"})
```
Oil. very helpfull stuff, it's pretty much a file manager inside the terminal. the only keymaps needed is : `space`+`-`
it's literally a file manager that you can actually edit and delete stuff on. with the usual vim keybind.
### colorscheme
#### everviolet
Github : https://github.com/everviolet/nvim
```
require("evergarden").setup({
    theme = {
        variant = 'winter',
        accent = 'blue',
    },
    editor = {
        transparent_background = true,
    }
})
```
#### kanso
Github : https://github.com/webhooked/kanso.nvim
```
require('kanso').setup({
    transparent = true,
    foreground = "saturated",
})
```
#### nightfox
Github : https://github.com/EdenEast/nightfox.nvim
```
require('nightfox').setup({
    options = {
        transparent = true,
    },
})
```
i can activate either one i want. with this line 
```
vim.cmd("colorscheme evergarden")
```
just type in the theme name.
### kdheepak/lazygit
Github : https://github.com/kdheepak/lazygit.nvim
The most usefull things that i have ever used. so that everything is in one terminal and in one application. I can just type in space+l+g to open a pop-up terminal version of Github Desktop. so i can just push and pull easily. i also can resolve conflict easily here.
the setup is just one line : 
```
vim.keymap.set("n", "lg", "<CMD>LazyGit<CR>", { silent = true, desc = "Open LazyGit" })
```
The basic stuff to do in lazygit to know is this :
- select all (*on files) : a
- commit : c 
- push : shift+p
- pull : p
- quit : q
- switch tab : arrow keys
that's all really. it's very easy to understand and use.
### nvim-mini/mini
Great thing about the mini plugins is i dont need to install all of them. it has 40+ plugins to work with that can be install individually. here are some of the mini plugins i used 
#### mini.pick
Github : https://github.com/nvim-mini/mini.pick
```
require("mini.pick").setup({
    mappings = {
        stop = 'q'
    },
    window = {
        config = function()
            local height = math.floor(vim.o.lines * 0.7)
            local width  = math.floor(vim.o.columns * 0.8)

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
-- Function to set highlight background to 'none'
local function set_hl_bg_none(group)
  vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
end

set_hl_bg_none("MiniPickBorder")
set_hl_bg_none("MiniPickPrompt")
set_hl_bg_none("MiniPickInput")
set_hl_bg_none("MiniPickResult")
set_hl_bg_none("NormalFloat") 

vim.keymap.set("n", "<leader>ff", MiniPick.builtin.files, { desc = "Main way to search file" })
vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers, { desc = "Search a buffer" })
vim.keymap.set("n", "<leader>fg", MiniPick.builtin.grep_live, { desc = "Search a word inside parent directory" })

vim.keymap.set("n", "<leader>fe", function()
    MiniPick.builtin.grep({ pattern = "ERROR" })
end, { desc = "Search ERROR in all other instances of current project" })

vim.keymap.set("n", "<leader>fx", function()
    MiniPick.builtin.grep({ pattern = "FIXME" })
end, { desc = "Search FIXME in all other instances of current project" })

vim.keymap.set("n", "<leader>fd", function()
    MiniPick.builtin.grep({ pattern = "TODO" })
end, { desc = "Search TODO in all other instances of current project" })
```

some mappings that's usefull inside mini.pick : 
TAB -> toggle preview file
SHIFT + TAB -> toggle file info
CTRL + T -> open in new tab
CTRL + S -> open in split below
CTRL + V -> open in split right
### Treesitter
to auto-complete a tag the most reliable way i found right now is to use treesitter + tronikelis/ts-autotag, it sucks that all i wanted was the ts-autotag. but i need treesitter parser for it. so this i need to setup the treesitter parser for it:
```
require("nvim-treesitter").install({
    ensure_installed = {
        "html",
        "css",
        "javascript",
        "tsx",
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

-- tronikelis/ts-autotag.nvim
require("ts-autotag").setup()

```
also `require("nvim-treesitter").install` does not install the ensure_installed list (like what the fuck even brother), it just notify other package to have that list of parser server (i think that how it works?). To actually install a parser do this manually 
`:TSInstall html css javascript tsx`

# PLUGINS
==neovim v0.11.0 - lazy ==
So in neovim 0.11 we'll use the most used / most documented package manager i've known, *Lazy*. The Structure is a bit different to the basic configuration, but it has the same concept. we start by downloading lazy. with this code :
```
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)
```
that code should be in a file structured like this :
`root(nvim config folder)/lua/plugins/init.lua`
that code will check if we already have lazy or not. if we dont then it'll automatically install it for us.

to setup the plugins we'll setup each plugins with it's own individual .lua scripts, example `plugin-a` will have its own `plugin-a.lua` then on `plugins/init.lua` we call them. 

to call them we'll use `require("plugins.<plugin-name>")` inside of `require("lazy").setup({ ... })` now this is my config, *this code comes after the code above in the same init.lua file* : 
```
require("lazy").setup({
    require("plugins.oil"),
    require("plugins.lazygit"),
    require("plugins.colorscheme"),
    require("plugins.mini"),
    require("plugins.lualine"),

    require("plugins.blink"),
    require("plugins.mason"),
    require("plugins.lspconfig"),

    require("plugins.treesitter"),
    require("plugins.todo-comments")
}, {
    checker = { enabled = false },
    defaults = { lazy = true, version = false },
    install = { missing = true },
})
```

==neovim v0.12.0 (nightly) - vim.packer ==
To setup the plugins for neovim 0.12.0, we can use it's newly (at this time) added vim.pack manager. we can do this to add a new plugins:
```
vim.pack.add({
	<package-link>
})
```
with the example of a package link is a github link that ends with a .nvim like this `https://github.com/stevearc/oil.nvim`
after that i managed individual package with its own scripts inside of the `plugins/` folder, by calling those scripts with `require('plugins.<scripts-name>')` 

here are each plugins i use explained and how to set them up (with context im using neovim 0.12 / nightly)

next i'll explain each plugins and how to set them up (on both package manager)
### stevearc/oil
Github : https://github.com/stevearc/oil.nvim
==neovim v0.11.0 - lazy ==
```
return {
    "stevearc/oil.nvim",
    lazy = false,
    keys = {
        { "-", "<CMD>Oil<CR>", desc = "Open Directory" },
    },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = { "permissions", "icon" },
            keymaps = {
                ["<C-c>"] = false,
                ["<M-h>"] = "action.select_split",
                ["q"] = "actions.close",
            },
            delete_to_trash = true,
            view_options = { show_hidden = true },
            skip_confirm_for_simple_edits = true,
        })
    end,
}
```
==neovim v0.12.0 (nightly) - vim.packer ==
```
require("oil").setup({
    default_file_explorer = true,
    columns = { "permissions", "icon" },
    keymaps = {
        ["<C-c>"] = false,
        ["<M-h>"] = "action.select_split",
        ["q"] = "actions.close"
    },
    delete_to_trash = true,
    view_options = { show_hidden = true },
    skip_confirm_for_simple_edits = true,
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Directory"})
```
Oil. very helpfull stuff, it's pretty much a file manager inside the terminal. the only keymaps needed is : `space`+`-`
it's literally a file manager that you can actually edit and delete stuff on. with the usual vim keybind.

### colorscheme
#### everviolet
Github : https://github.com/everviolet/nvim
==neovim v0.11.0 - lazy ==
*put this inside of return {}*
```
{
	"everviolet/nvim",
	name = "evergarden",
	lazy = false,
	priority = 1000,
	config = function()
		require("evergarden").setup({
			theme = {
				variant = "winter",
				accent = "blue",
			},
			editor = {
				transparent_background = true,
			},
		})
		vim.cmd.colorscheme("evergarden")
	end,
},
```
==neovim v0.12.0 (nightly) - vim.packer ==
```
require("evergarden").setup({
    theme = {
        variant = 'winter',
        accent = 'blue',
    },
    editor = {
        transparent_background = true,
    }
})
```
#### kanso
Github : https://github.com/webhooked/kanso.nvim
==neovim v0.11.0 - lazy ==
*put this inside of return {}*
```
{
	"webhooked/kanso.nvim",
	lazy = true,
	config = function()
		require("kanso").setup({
			transparent = true,
			foreground = "saturated",
		})
	end,
},

```
==neovim v0.12.0 (nightly) - vim.packer ==
```
require('kanso').setup({
    transparent = true,
    foreground = "saturated",
})
```
#### nightfox
Github : https://github.com/EdenEast/nightfox.nvim
==neovim v0.11.0 - lazy ==
*put this inside of return {}*
```
{
	"EdenEast/nightfox.nvim",
	lazy = true,
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true,
			},
		})
	end,
},
```
==neovim v0.12.0 (nightly) - vim.packer ==
```
require('nightfox').setup({
    options = {
        transparent = true,
    },
})
```
i can activate either one i want. with this line 

==both neovim v0.11.0 and v0.12 use the same command below==
```
vim.cmd("colorscheme evergarden")
```
just type in the theme name.

### kdheepak/lazygit
Github : https://github.com/kdheepak/lazygit.nvim
==neovimv0.11.0 - lazy==
```
return {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "LazyGit" },
    keys = {
        { "lg", "<CMD>LazyGit<CR>", desc = "Open LazyGit", silent = true },
    },
}
```
==neovim v0.12.0 (nightly) - vim.packer ==
```
vim.keymap.set("n", "lg", "<CMD>LazyGit<CR>", { silent = true, desc = "Open LazyGit" })
```
The most usefull things that i have ever used. so that everything is in one terminal and in one application. I can just type in space+l+g to open a pop-up terminal version of Github Desktop. so i can just push and pull easily. i also can resolve conflict easily here.
The basic stuff to do in lazygit to know is this :
- select all (*on files) : a
- commit : c 
- push : shift+p
- pull : p
- quit : q
- switch tab : arrow keys
that's all really. it's very easy to understand and use.

### nvim-mini/mini
#### How to set it up
Great thing about the mini plugins is i dont need to install all of them. it has 40+ plugins to work with that can be install individually. here are some of the mini plugins i used

I'll quickly go through the lazy setup. we'll use 1 .lua files
==neovimv0.11.0 - lazy==
```
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
```
in v0.12.0 we'll split mini.pick, mini.files, and the other smaller mini plugins
==neovim v0.12.0 (nightly) - vim.packer==
mini.pick
Github : https://github.com/nvim-mini/mini.pick
```
require("mini.pick").setup({
    mappings = {
        stop = 'q'
    },
    window = {
        config = function()
            local height = math.floor(vim.o.lines * 0.7)
            local width  = math.floor(vim.o.columns * 0.8)

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
-- Function to set highlight background to 'none'
local function set_hl_bg_none(group)
  vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
end

set_hl_bg_none("MiniPickBorder")
set_hl_bg_none("MiniPickPrompt")
set_hl_bg_none("MiniPickInput")
set_hl_bg_none("MiniPickResult")
set_hl_bg_none("NormalFloat") 

vim.keymap.set("n", "<leader>ff", MiniPick.builtin.files, { desc = "Main way to search file" })
vim.keymap.set("n", "<leader>fb", MiniPick.builtin.buffers, { desc = "Search a buffer" })
vim.keymap.set("n", "<leader>fg", MiniPick.builtin.grep_live, { desc = "Search a word inside parent directory" })

vim.keymap.set("n", "<leader>fe", function()
    MiniPick.builtin.grep({ pattern = "ERROR" })
end, { desc = "Search ERROR in all other instances of current project" })

vim.keymap.set("n", "<leader>fx", function()
    MiniPick.builtin.grep({ pattern = "FIXME" })
end, { desc = "Search FIXME in all other instances of current project" })

vim.keymap.set("n", "<leader>fd", function()
    MiniPick.builtin.grep({ pattern = "TODO" })
end, { desc = "Search TODO in all other instances of current project" })
```
mini.files 
Github : https://github.com/nvim-mini/mini.files
```
require("mini.files").setup({
    mappings = {
        go_in = '<Right>',
        go_in_plus = '<CR>',
        go_out = '<Left>',
        go_out_plus = '<M-CR>',
    },
    windows = {
        preview = true,
    },
})

vim.keymap.set("n", "<leader>mf", MiniFiles.open, { desc = "opening Mini Files Explorer" })
vim.keymap.set("n", "<leader>ef", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = "Open into current Opened file location" })
```
General mini plugins
Github :    
- icons : https://github.com/nvim-mini/mini.icons
- git : https://github.com/nvim-mini/mini-git
- comment : https://github.com/nvim-mini/mini.comment
- pairs : https://github.com/nvim-mini/mini.pairs
- surround : https://github.com/nvim-mini/mini.surround
- splitjoin : https://github.com/nvim-mini/mini.splitjoin
```
require('mini.icons').setup()
require('mini.comment').setup()
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.git').setup()
require('mini.splitjoin').setup()
```

Okay now i'll explain what each mini plugins does. we'll start with :
#### mini.pick 
Mini pick is like a quick search, just use the shortcut:
`space`+`ff`, it'll open up a window to search files in the current directory you open in (where you start nvim on cmd).
Other usefull keymaps inside mini.pick is :
- `tab` -> toggle preview file
- `shift`+`tab` -> toggle file info
- `ctrl`+`t` -> open in new tab
- `ctrl`+`s` -> open in split below
- `ctrl`+`V` -> open in split right
I've set up even some quick shortcut for opening mini.pick with a parameter set up :
- `space`+`ff` -> Open mini files normally
- `space`+`fb` -> Open mini files and search for buffer only
- `space`+`fg` -> Open mini files and search for words inside 
#### mini.files
Mini files is similar to oil in a way, but the purpose of mini files (atleast for me). is to better understand the structure the current projects. since it'll show which files belongs to which folder in a nice file explorer kinda way.
Here are the keymappings :
- `space`+`mf` -> open the current root directory
- `space`+`ef` -> show the current files location in relevance of the current root directory 
- inside mini.files / on mini.files open
	- `right-arrow` -> open the folder/file
	- `left-arrow`/`alt-enter` -> open the previous parent folder
	- `enter` -> open and close the mini.files *on picking a folder*

-- COMMENT : auto commenting with the keymaps being : 
-- -> normal then "gcc" -> will comment current line
-- -> visual/selected  then "gc" -> will comment current selected block
-- PAIRS : Auto pairs brackets and quotation.
-- SURROUND : Replace surrounding words bracket or something, example : 
-- "sa" + "any surrounding symbol" -> add the symbol around the selected/highlighted word
-- "sd" + "any surrounding symbol" -> delete the symbol around the selected/highlighted word
-- "sr" + "surrounding symbol that wanted to be changed" + "any surrounding symbol" -> replace the symbol around the selected/highlighted word
-- SPLIT JOIN : just to Toggle brackets to be one line or spread out
-- "gS" -> toggle split and join
-- GIT : just for statusline for now
