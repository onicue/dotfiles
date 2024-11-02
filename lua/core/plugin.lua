local M = {}

M.is_table = function(arg)
  return type(arg) == "table"
end

M.include = function(dir)
  for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/" .. dir, [[v:val =~ '\.lua$']])) do
    local file = dir .. "." .. file:gsub("%.lua$", "")
    local plugin = require(file)
    if not M.is_table(plugin) then
      goto continue
    end

    MiniDeps.add(plugin)

    if plugin.config then
      if plugin.lazy == true then
        MiniDeps.later( function() plugin.config() end)
      else
        MiniDeps.now( function() plugin.config() end)
      end
    end
    ::continue::
  end
end

M.start = function()
  local path_package = vim.fn.stdpath("data") .. "/site/"
  local mini_path = path_package .. "pack/deps/start/mini.nvim"
  if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing mini.nvim" | redraw')
    local clone_cmd = {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/echasnovski/mini.nvim",
      mini_path,
    }
    vim.fn.system(clone_cmd)
    vim.cmd("packadd mini.nvim | helptags ALL")
    vim.cmd('echo "Installed mini.nvim" | redraw')
  end

  require("mini.deps").setup({ path = { package = path_package } })
end

M.disable = function(args)
  if M.is_table(args) then
    for _, plugin in ipairs(args) do
      vim.g["loaded_" .. plugin] = 1
    end
  end
end

M.init = function(arg)
  M.start()
  M.disable(arg.disable)
  M.include(arg.conf_dir)
end

return M
