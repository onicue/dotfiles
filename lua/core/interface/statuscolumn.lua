local M = {}

local merge = require("core.utils.tbl").merge

M.opts = {}

local diagnostic_hl = {
  [vim.diagnostic.severity.ERROR] = "%#DiagnosticError#",
  [vim.diagnostic.severity.WARN] = "%#DiagnosticWarn#",
  [vim.diagnostic.severity.INFO] = "%#DiagnosticInfo#",
  [vim.diagnostic.severity.HINT] = "%#DiagnosticHint#"
}

local current_line_hl = "%#CursorLineNr#"
local non_current_line_hl = "%#LineNr#"

local function get_diagnostic_highlight(line_nr)
  local diagnostics = vim.diagnostic.get(0, { lnum = line_nr - 1 })
  if #diagnostics == 0 then
    return nil
  end

  -- Use the highest severity diagnostic to decide the color
  local highest_severity = diagnostics[1].severity
  for _, diag in ipairs(diagnostics) do
    if diag.severity < highest_severity then
      highest_severity = diag.severity
    end
  end

  return diagnostic_hl[highest_severity] or nil
end

function M.statuscolumn()
  local line_nr = vim.v.lnum
  local is_current = line_nr ==  vim.fn.line('.')
  local lnum = nil

  lnum = is_current and line_nr or vim.v.relnum

  local s = ''

  local diag_hl = get_diagnostic_highlight(line_nr)

  local line_hl = is_current and current_line_hl or non_current_line_hl

  local hl_group = diag_hl or line_hl

  if vim.v.virtnum ~= 0 then
    return s
  end

  if not is_current then
    s = s .. '%='
  end

  s = s .. hl_group .. lnum .. ' '

  return s
end

function M.init(opts)
  merge(M.opts, opts)

  if not vim.o.relativenumber then
    vim.o.relativenumber = true
  end

  _G.my_statuscolumn = M.statuscolumn

  local function update_statuscolumn()
    if vim.wo.number then
      vim.o.relativenumber = true
      _G.my_statuscolumn = M.statuscolumn
      vim.o.statuscolumn = "%!v:lua.my_statuscolumn()"
    else
      vim.o.statuscolumn = ""
      vim.o.relativenumber = false
    end
  end

  update_statuscolumn()

  vim.api.nvim_create_autocmd("OptionSet", {
    pattern = "number",
    callback = update_statuscolumn
  })
end

return M
