local M = {}

local function run(opts, file)
  if opts then
    local status, interface_module = pcall(require, "core.interface." .. file)
    if status then
      interface_module.init(opts)
    else
      print("[interface] Failed to load module: " .. file)
    end
  end
end

M.init = function(opts)
  if not opts then
    return
  end

  if type(opts) ~= "table" then
    print("[interface] Invalid options: expected a table.")
    return
  end

  run(opts.tabline, "tabline");
  run(opts.statuscolumn, "statuscolumn");
  -- require("core.interface.statuscolumn")
  -- run(M.opts.statusline, "statusline");
end

return M
