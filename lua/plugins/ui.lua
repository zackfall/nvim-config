return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim",
    },
    config = function()
      local neogit = require("neogit")
      vim.keymap.set("n", "<leader>ns", function()
        neogit.open({ kind = "split" })
      end, { desc = "Open Neogit" })
      vim.keymap.set("n", "<leader>nl", function()
        vim.cmd("Neogit log")
      end, { desc = "Open Neogit Logs" })
      vim.keymap.set("n", "<leader>nb", function()
        vim.cmd("Neogit branch")
      end, { desc = "Open Neogit branches" })
    end,
  },
}
