local M = {}

M.source = 'neovim/nvim-lspconfig'
M.depends = {
  "onicue/lsp-installer",
}

M.config = function()
  local lsp = require("lspconfig")
  require("lsp-installer").setup({
    ensure_installed = {"cmake", "cpp", "texlab"},
    servers_dir = "core.servers",
    lsp = {
      ["clangd"] = {
        capabilities = capabilities,
        root_dir = lsp.util.root_pattern('compile_commands.json', 'CMakeLists.txt', '.git'),
        cmd = {"clangd", "--clang-tidy", "--background-index", "--header-insertion=never"}
      },
      ["texlab"] = {
        -- on_new_config = function(new_config, new_root_dir)
        --   new_config.settings.texlab.rootDirectory = new_root_dir
        -- end,
        settings = {
          texlab = {
            auxDirectory = ".",
            build = {
              executable = "tectonic",
              args = {
                "-X",
                "compile",
                "%f",
                "--synctex",
                "--keep-logs",
                "--keep-intermediates"
              },
              forwardSearchAfter = false,
              onSave = true
            },
            forwardSearch = {
              executable = "zathura",
              args = { "--synctex-forward", "%l:1:%f", "%p" }
            },
            chktex = {
              onOpenAndSave = false,
              onEdit = true
            },
            lint = {
              onSave = true
            }
          }
        }
      }
    }
  })
end

return M
