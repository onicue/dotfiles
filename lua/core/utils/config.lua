local M = {}

local function remove_values(scope, setting, values)
  if vim[scope][setting] and vim[scope][setting].remove then
    vim[scope][setting]:remove(values)
  else
    print("Error: parameter " .. setting .. " does not support removal")
  end
end

local function append_values(scope, setting, values)
  if vim[scope][setting] and vim[scope][setting].append then
    vim[scope][setting]:append(values)
  else
    vim[scope][setting] = values
  end
end

M.set_options = function(opts)
  for scope, options in pairs(opts) do
    for setting, value in pairs(options) do
      if setting == "remove" then
        for setting_to_remove, values in pairs(value) do
          remove_values(scope, setting_to_remove, values)
        end
      elseif type(value) == "table" then
        append_values(scope, setting, value)
      else
        vim[scope][setting] = value
      end
    end
  end
end

M.set_keymaps = function(keys)
  vim.schedule(function()
      for _, mapping in ipairs(keys) do
          local num_elements = #mapping

          if num_elements < 3 or num_elements > 4 then
              print("Неверный формат бинда:", vim.inspect(mapping))
              goto continue
          end

          local mode = mapping[1]
          local keys = mapping[2]
          local command = mapping[3]
          local opts = num_elements == 4 and mapping[4] or { noremap = true, silent = true }
          vim.keymap.set(mode, keys, command, opts)

          ::continue::
      end
  end)
end

return M
