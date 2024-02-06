return {
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup {}
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local servers = { "rust_analyzer", "pyright", "tsserver", "lua_ls", "phpactor" }

            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities,
                }
            end

            require'lspconfig'.volar.setup{
              filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
            }
        end
    },
}
