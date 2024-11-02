return {
  source = "iguanacucumber/magazine.nvim",
  name = "nvim-cmp",
  lazy = true,
  depends =
  {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'onsails/lspkind-nvim',
    --snip--
    'dcampos/nvim-snippy',
    'dcampos/cmp-snippy',
    --spell--
    'f3fora/cmp-spell',
  },

  config = function ()
    local cmp = require("cmp")
    cmp.setup({
      formatting = {
        format = require("lspkind").cmp_format({with_text = false, maxwidth = 30}),
      },

      snippet = {
        expand = function(args)
          require('snippy').expand_snippet(args.body)
        end,
      },

      completion = {
        keyword_length = 1,
        -- max_item_count = 5,
        -- keyword_pattern = ".*",
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp'},
        { name = 'snippy'},
        { name = 'nvim_lsp_signature_help'},
        { name = 'buffer'},
        -- { name = 'vimtex', },
        { name = 'path', option =  {
          trailing_slash = true,
        }},
        {
            name = "spell",
            option = {
                keep_all_entries = false,
                enable_in_context = function()
                    return true
                end,
                preselect_correct_word = true,
            },
        },
      })
    })


    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = 'buffer' },
      })
    })
  end
}
