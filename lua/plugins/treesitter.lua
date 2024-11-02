local M = {}

M.source = 'nvim-treesitter/nvim-treesitter'
M.hooks = { post_checkout = function() vim.cmd('TSUpdate') end }

M.config = function()
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vimdoc', 'c', 'cpp' },
    highlight = { enable = true },
    auto_install = false,
  })
end

return M
