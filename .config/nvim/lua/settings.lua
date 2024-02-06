vim.opt.number = true
vim.opt.rnu = true
vim.opt.cursorline = true

vim.opt.termguicolors = true
vim.cmd('colorscheme moonfly')

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.list = true
vim.opt.listchars = 'tab:| ,lead:·,trail:·,eol:↵'

require("luasnip.loaders.from_vscode").lazy_load()
