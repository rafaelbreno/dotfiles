local lspconfig = require('lspconfig')

vim.lsp.config("roslyn", {
    cmd = {
        "dotnet",
        vim.fn.expand("~/bin/roslyn/content/LanguageServer/linux-x64/Microsoft.CodeAnalysis.LanguageServer.dll"),
        "--logLevel", "Information",
        "--extensionLogDirectory", vim.fn.expand("~/.local/state/nvim/roslyn"),
        "--stdio",
    },
    on_attach = require("util").on_attach,
    capabilities = require("util").capabilities,
})
