require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "tailwindcss",
        "ts_ls",
        "laravel_ls",
        "omnisharp@1.39.11",
    },
    auto_update = false,
    run_on_start = false,
})
