-- vim.o.complete = ".,o"
-- vim.o.completeopt = "fuzzy,menuone,noselect"
-- vim.o.autocomplete = true
-- vim.o.pumheight = 7

vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})

-- NOTE: LUA
vim.lsp.config("lua_ls", {
    cmd = {
        vim.fn.stdpath("data") .. "/mason/bin/lua-language-server",
    },
    root_dir = vim.fs.dirname(vim.fs.find({'.git', '.vim', 'nvim'}, { upward = true })[1]),
    settings = { Lua = { diagnostics = { globals = {'vim'} } } },
})

-- NOTE: TAILWINDCSS
vim.lsp.config("tailwindcss", {
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = {
                    "class(Name)?=\"([^\"]*)\"",
                },
            },
        },
    },
})

-- NOTE: TS / JSX
vim.lsp.config("ts_ls", {
    settings = {
        javascript = {
            format = {
                enable = false,
            },
        },
    },
})

-- NOTE: OMNISHARP UNITY CSHARP
vim.lsp.config("omnisharp", {
    cmd = {
        vim.fn.stdpath("data") .. "/mason/bin/OmniSharp",
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid()),
    },
    filetypes = { "cs" },
    root_dir = function(fname)
        return vim.fs.root(fname, {
            ".sln",
            ".csproj",
            ".git",
            "ProjectSettings/ProjectVersion.txt", -- Unity
        })
    end,
    settings = {
        FormattingOptions = {
            EnableEditorConfigSupport = true,
        },
        RoslynExtensionsOptions = {
            EnableAnalyzersSupport = true,
            EnableImportCompletion = true,
        },
        Sdk = {
            IncludePrereleases = true,
        },
    },
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("omnisharp")


-- NOTE: LSP Keymap
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format) --Restart LSP

local signs = {
    [vim.diagnostic.severity.ERROR] = " ",
    [vim.diagnostic.severity.WARN]  = " ",
    [vim.diagnostic.severity.HINT]  = "󰠠 ",
    [vim.diagnostic.severity.INFO]  = " ",
}

vim.diagnostic.config({
    signs = { text = signs },
    virtual_text = true,
    underline = true,
    update_in_insert = false,
})
