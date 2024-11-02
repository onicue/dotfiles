return {
  source = "aserowy/tmux.nvim",
  config = function()
    require("tmux").setup({
      copy_sync = {
        sync_clipboard = true,
      }
    })
  end
}
