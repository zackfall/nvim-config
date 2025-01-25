return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = {
"",
"",
"",
"",
[[ ______      ________       ______       ______       ______       ______      ]],
[[/_____/\    /_______/\     /_____/\     /_____/\     /_____/\     /_____/\     ]],
[[\:::__\/    \::: _  \ \    \:::__\/     \:::_ \ \    \:::_ \ \    \::::_\/_    ]],
[[   /: /      \::(_)  \ \    \:\ \  __    \:\ \ \ \    \:\ \ \ \    \:\/___/\   ]],
[[  /::/___     \:: __  \ \    \:\ \/_/\    \:\ \ \ \    \:\ \ \ \    \::___\/_  ]],
[[ /_:/____/\    \:.\ \  \ \    \:\_\ \ \    \:\_\ \ \    \:\/.:| |    \:\____/\ ]],
[[ \_______\/     \__\/\__\/     \_____\/     \_____\/     \____/_/     \_____\/ ]],
"",
"",
"",
"",
	},
        center = {
	  {
	    icon = ' ',
	    icon_hl = 'Title',
	    desc = 'New File            ',
            desc_hl = 'String',
            key = 'n',
            key_hl = 'Number',
            -- key_format = ' %s', -- remove default surrounding `[]`
            action = 'enew'
	  },
	  {
  	    icon = '󰍉 ',
	    icon_hl = 'Title',
            desc = 'Find File           ',
            desc_hl = 'String',
            key = 'f',
            key_hl = 'Number',
            -- key_format = ' %s', -- remove default surrounding `[]`
            action = 'lua require"telescope.builtin".find_files(require("telescope.themes").get_dropdown({}))'
          },
	  {
  	    icon = ' ',
	    icon_hl = 'Title',
            desc = 'Configuration       ',
            desc_hl = 'String',
            key = 'c',
            key_hl = 'Number',
            -- key_format = ' %s', -- remove default surrounding `[]`
            action = 'edit ~/.config/nvim/init.lua'
          },
	  {
  	    icon = '󰌑 ',
	    icon_hl = 'Title',
            desc = 'Exit                ',
            desc_hl = 'String',
            key = 'q',
            -- keymap = 'q',
            key_hl = 'Number',
            -- key_format = ' %s', -- remove default surrounding `[]`
            action = 'q'
          }
	}
      }
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons', opts = {} } }
}
