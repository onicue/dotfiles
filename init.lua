if vim.fn.has("nvim-0.10") == 0 then
  error("Neovim version 0.10 or higher is required")
  vim.cmd('quit')
end

local M = require("config")
local utils = require("core.utils.config")

require("core.autocmds")

if M.diagnostic then
  vim.diagnostic.config(M.diagnostic)
end

utils.set_options(M.options)
utils.set_keymaps(M.mappings)

require("core.plugin").init(M.plugins)
require("core.base46").load_theme(M.theme)
require("core.interface").init(M.interface)
