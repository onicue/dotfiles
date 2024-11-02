local M = {}

M.source = 'ibhagwan/fzf-lua'
M.depends = { 'nvim-tree/nvim-web-devicons' }
M.lazy = true

M.config = function()
  require("fzf-lua").setup({
    fzf_colors = true,
    keymap = {
      builtin = {
        ["<C-d>"] = "preview-page-down",
        ["<C-u>"] = "preview-page-up",
      },
    },
  })
end

return M
