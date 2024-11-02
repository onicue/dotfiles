return {
  opt = {
    clipboard = "unnamedplus",
    cmdheight = 0,
    laststatus = 3,
    list = true,
    number = true,
    relativenumber = true,
    cursorline = true,
    colorcolumn = "0",
    cursorcolumn = false,
    signcolumn = "no",
    guicursor = "n:block,i-ci-c:ver25,r-v-cr:hor50,a:blinkon0",
    pumblend = 15,
    winblend = 5,
    pumheight = 10,
    fillchars = {
      foldopen = "",
      foldclose = "",
      diff = "/",
      eob = " ",
    },

    termguicolors = true,
    spelllang = "en_us",
    spell = true,
    fileencoding = 'utf-8',
    confirm = false,

    wrap = true,
    tabstop = 2,
    shiftwidth = 0,
    numberwidth = 3,
    softtabstop = -1,
    expandtab = true,
    autoindent = false,
    hlsearch = false,
    showmatch = true,
    mouse = "",
    splitright = true,
    splitbelow = true,
    splitkeep = "topline",
    fixeol     = false,
    ignorecase = true,
    smartcase = true,
    smartindent = true,
    scrolloff = 10,
    visualbell = false,
    helpheight = 15,

    backup = false,
    backupcopy = "auto",
    backupdir = ("%s/backup//"):format(vim.fn.stdpath("state")),
    swapfile = false,
    hidden = true,
    writebackup = true,
    undofile = true,
    undolevels = 100,

    modifiable = true,
    showmode = false,
    -- breakindent = true,
    timeoutlen = 750,
    timeout = false,
    updatetime = 500,
    backupskip = { "*/.git/*", "*.gpg" },
    shortmess = {
      a = true,
      o = true,
      t = true,
      s = true,
      T = true,
      W = true,
      I = true,
      c = true,
      C = true,
      F = true,
      S = true,
    },

    remove = {
      complete = {
        "u", -- unload buffers
        "t", -- tag completion
      }
    }
  },
  g = {
    mapleader = " ",
    nord_underline = 1
  }
}
