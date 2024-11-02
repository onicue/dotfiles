local M = {}

function M.merge(defaults, overrides)
  for key, value in pairs(overrides) do
    if defaults[key] ~= nil then
      defaults[key] = value
    end
  end
  return defaults
end

return M
