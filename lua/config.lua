return {
  plugins = {
    conf_dir = "plugins",
    disable = require("config.disable")
  },
  options = require("config.options"),
  mappings = require("config.keymap"),
  diagnostic = require("config.diagnostic"),
  interface = {
    tabline = {
      num = true,
      modified = true,
    },
    -- statusline = {}, --in future
    statuscolumn = {
      num = true
    },
  },
  theme = {
    color_base = "base46",
    theme = "jellybeans",
    transparency = false,
  }
}
