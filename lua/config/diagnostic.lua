return {
  severity_sort = true,
  underline = true,
  update_in_insert = false,

  --can be false
  virtual_text = {
    spacing = 0,
    prefix = '-',--'',
    source = false,


    virt_text_hide = false,
    virt_text_pos = 'right_align',
    suffix = "",
    format = function(diagnostic) --change if u wanna see the messages
        return ""
      end
  },

  float = {
    source = "if_many"
  },

  -- change highlight
  -- signs = {
  --       text = {
  --           [vim.diagnostic.severity.ERROR] = '',
  --           [vim.diagnostic.severity.WARN] = '',
  --           [vim.diagnostic.severity.HINT] = '',
  --           [vim.diagnostic.severity.INFO] = '',
  --       },
  --       linehl = {
  --           [vim.diagnostic.severity.ERROR] = '',
  --           [vim.diagnostic.severity.WARN] = '',
  --           [vim.diagnostic.severity.HINT] = '',
  --           [vim.diagnostic.severity.INFO] = '',
  --       },
  --       numhl = {
  --           [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
  --           [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
  --           [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
  --           [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
  --       },
  -- },
}
