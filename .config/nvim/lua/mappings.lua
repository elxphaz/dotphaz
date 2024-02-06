local bind = vim.keymap.set

bind("n", "<leader>fe", ":Ex<CR>")
bind('n', '<leader>d', ":bdelete<CR>")
bind('n', '<leader>ft', ":Neotree<CR>")

-- Telescope
local builtin = require('telescope.builtin')
bind('n', '<leader>sf', builtin.find_files, {})
bind('n', '<leader>lg', builtin.live_grep, {})
bind('n', '<leader>b', builtin.buffers, {})
bind('n', '<leader>ht', builtin.help_tags, {})
bind('n', '<leader>?', builtin.oldfiles, {})

-- Lsp
bind('n', '<space>e', vim.diagnostic.open_float)
bind('n', '[d', vim.diagnostic.goto_prev)
bind('n', ']d', vim.diagnostic.goto_next)
bind('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    bind('n', 'gD', vim.lsp.buf.declaration, opts)
    bind('n', 'gd', vim.lsp.buf.definition, opts)
    bind('n', 'K', vim.lsp.buf.hover, opts)
    bind('n', 'gi', vim.lsp.buf.implementation, opts)
    bind('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    bind('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    bind('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    bind('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    bind('n', '<space>D', vim.lsp.buf.type_definition, opts)
    bind('n', '<space>rn', vim.lsp.buf.rename, opts)
    bind({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    bind('n', 'gr', vim.lsp.buf.references, opts)
    bind('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
