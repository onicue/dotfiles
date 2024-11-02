local default_title = "MyVim"

return function(msg, level, title)
  level = level or vim.log.levels.INFO
  title = title or default_title
  vim.notify(msg, level, {
    title = title,
  })
end
