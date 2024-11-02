local function augroup(name)
  return vim.api.nvim_create_augroup( name, { clear = true })
end

-- highlighting copied text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup("YankHighlight"),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

-- remove extra spaces
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = augroup('remove_extra_spaces'),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]
