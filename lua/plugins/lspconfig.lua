local capabilities = require("blink.cmp").get_lsp_capabilities()
capabilities.textDocument = capabilities.textDocument or {}
capabilities.textDocument.semanticTokens = nil

vim.lsp.config("lua_ls", {
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
    root_dir = vim.fs.dirname(vim.fs.find({ ".git", ".vim", "nvim" }, { upward = true })[1]),
    capabilities = capabilities,
    settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})

vim.lsp.config("tailwindcss", {
    capabilities = capabilities,
    settings = {
        tailwindCSS = {
            experimental = {
                classRegex = { "class(Name)?=\"([^\"]*)\"" },
            },
        },
    },
})

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    settings = { javascript = { format = { enable = false } } },
})

vim.lsp.config("omnisharp", {
    autostart = true,
    capabilities = capabilities,
    cmd = {
        vim.fn.stdpath("data") .. "/mason/bin/OmniSharp",
        "--languageserver",
        "--hostPID",
        tostring(vim.fn.getpid()),
    },
    root_dir = vim.fs.root(0, { "*.sln", "*.csproj", ".git" }),
    filetypes = { "cs" },
    init_options = { semanticTokens = false },
    on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end,
    on_attach = function(client, bufnr)
        pcall(vim.lsp.semantic_tokens.stop, bufnr, client.id)
        client.server_capabilities.semanticTokensProvider = nil
    end,
    handlers = {
        ["textDocument/semanticTokens/full"] = function() end,
        ["textDocument/semanticTokens/range"] = function() end,
        ["textDocument/inlayHint"] = function() end,
    },
    settings = {
        RoslynExtensionsOptions = {
            EnableAnalyzersSupport = true,
            EnableImportCompletion = true,
        },
    },
})

vim.lsp.enable("html")
vim.lsp.enable("cssls")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("laravel_ls")
vim.lsp.enable("omnisharp")

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = false,
})
