return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'moyiz/blink-emoji.nvim'
  },
  version = '*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'enter' },

    completion = {
      menu = {
        border = 'rounded',
        draw = {
          columns = {
            {
              'label', 'label_description', gap = 1
            },
            {
              'kind_icon', 'kind', gap = 1
            }
          }
        }
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = {
          border = 'rounded'
        }
      },
      ghost_text = {
        enabled = false
      },
    },

    signature = {
      enabled = true,
      window = {
        border = 'rounded',
      }
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'emoji' },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        emoji = {
          module = 'blink-emoji',
          name = 'Emoji',
          score_offset = 15,
          opts = { insert = true }
        }
      }
    },
  },
  opts_extend = { "sources.default" },
}
