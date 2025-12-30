
return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        capabilities.textDocument = capabilities.textDocument or {}
        capabilities.textDocument.semanticTokens = nil

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client then
                    vim.notify("LSP attached: " .. client.name, vim.log.levels.INFO, { title = "LSP" })
                end
            end,
        })

        local orig_log_handler = vim.lsp.handlers["window/logMessage"]
        vim.lsp.handlers["window/logMessage"] = function(err, result, ctx, config)
            if result and result.message == "nil" then
                return
            end
            if orig_log_handler then
                return orig_log_handler(err, result, ctx, config)
            end
        end

        vim.lsp.config("lua_ls", {
            cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
            root_dir = vim.fs.dirname(
                vim.fs.find({ ".git", ".vim", "nvim" }, { upward = true })[1]
            ),
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                },
            },
        })

        vim.lsp.config("tailwindcss", {
            capabilities = capabilities,
            settings = {
                tailwindCSS = {
                    experimental = {
                        classRegex = { 'class(Name)?="([^"]*)"' },
                    },
                },
            },
        })

        vim.lsp.config("ts_ls", {
            capabilities = capabilities,
            settings = {
                javascript = {
                    format = { enable = false },
                },
            },
        })

        vim.lsp.config("omnisharp", {
            autostart = true,
            capabilities = capabilities,
            cmd = {
                vim.fn.stdpath("data") .. "/mason/bin/OmniSharp",
                "--languageserver",
                "--hostPID",
                tostring(vim.fn.getpid()),
                "--useModernNet",
            },
            root_dir = vim.fs.root(0, { "*.sln", "*.csproj", ".git" }),
            filetypes = { "cs" },
            init_options = {
                semanticTokens = false,
            },
            on_init = function(client)
                client.server_capabilities.semanticTokensProvider = nil
            end,
            on_attach = function(client, bufnr)
                client.server_capabilities.semanticTokensProvider = nil
                pcall(vim.lsp.semantic_tokens.stop, bufnr, client.id)
            end,
            settings = {
                RoslynExtensionsOptions = {
                    EnableAnalyzersSupport = false,
                    EnableImportCompletion = true,
                    AnalyzeOpenDocumentsOnly = true,
                },
                MsBuild = {
                    LoadProjectsOnDemand = true,
                    EnablePackageAutoRestore = false,
                },
                OmniSharp = {
                    ExcludedPaths = {
                        "Assets",
                        "Library",
                        "Packages",
                        "Temp",
                        "Obj",
                        "Build",
                        "Builds",
                        ".git",
                    },
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
    end,
}
