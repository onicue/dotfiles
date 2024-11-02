local function closeTab()
    local current = vim.fn.tabpagenr()
    local total = vim.fn.tabpagenr('$')

    if total == 1 then
      vim.notify("Cannot close the tab, you have only one tab", vim.log.levels.WARN)
      return
    end

    vim.cmd("tabc")
    if current > 1 then
      vim.cmd("tabp")
    end
end

return {
  {"n", "<leader>bn", "<cmd>bn<cr>"},
  {"n", "<leader>bp", "<cmd>bp<cr>"},

  {"n", "<leader>qq", "<cmd>w | bd<cr>"},
  {"n", "<leader>qz", "<cmd>bd<cr>"},

  {"i", "<C-l>", "<S-Right>"},
  {"i", "<C-h>", "<S-Left>"},

  {"v", "<", "<gv"},
  {"v", ">", ">gv"},
  {"n", "<", "<<"},
  {"n", ">", ">>"},

  {{"n", "v"}, 'j', "v:count == 0 ? 'gj' : 'j'", {expr = true}},
  {{"n", "v"}, 'k', "v:count == 0 ? 'gk' : 'k'", {expr = true}},

  {"n", "<leader>mk", "<cmd>lnext<CR>zz"},
  {"n", "<leader>mj", "<cmd>lprev<CR>zz"},

  {"t", "<ESC>", "<C-\\><C-n>"},

  {{"n", "v"}, "<leader>p", [["+p]]},
  {{"n", "v"}, "<leader>y", [["+y]]},
  {{"n", "v"}, "<leader>Y", [["+Y]]},
  {{"n", "v"}, "<leader>d", [["_d]]},

  {"n", "<leader>au", function ()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end},

  {"n", "[d", function()
                vim.diagnostic.goto_next()
                vim.diagnostic.open_float()
              end},
  {"n", "]d", function()
                vim.diagnostic.goto_prev()
                vim.diagnostic.open_float()
              end},
  {"n", "J", vim.diagnostic.open_float},
  {"n", "gd", function() vim.lsp.buf.definition() end},
  {"n", "<leader>fe", "<cmd>lua MiniFiles.open()<cr>"},

  {"n", "<leader>tn", "<cmd>tabnext<cr>"}, --gt
  {"n", "<leader>tp", "<cmd>tabprevious<cr>"}, --gT
  {"n", "<leader>tc", closeTab},
  {"n", "<leader>t-", "<cmd>-tabmove<cr>"},
  {"n", "<leader>t+", "<cmd>+tabmove<cr>"},
  {"n", "<leader>ts", "<cmd>tab split<cr>"},

  {"n", "z=", "<cmd>FzfLua spell_suggest<cr>"},

  {"n", "<leader>ff", "<cmd>FzfLua files<cr>"},
}
