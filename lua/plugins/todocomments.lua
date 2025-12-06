return {
  'folke/todo-comments.nvim',
  opts = {},
  keys = {
    { "<leader>sc", function() Snacks.picker.todo_comments() end, desc = "Todo Picker" }
  }
}
