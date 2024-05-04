local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
    [[  (`-')   (`-')  _                      _(`-')    (`-')  _ ]],
    [[  ( OO).->(OO ).-/  _             .->  ( (OO ).-> ( OO).-/ ]],
    [[,(_/----. / ,---.   \-,-----.(`-')----. \    .'_ (,------. ]],
    [[|__,    | | \ /`.\   |  .--./( OO).-.  ''`'-..__) |  .---' ]],
    [[ (_/   /  '-'|_.' | /_) (`-')( _) | |  ||  |  ' |(|  '--.  ]],
    [[ .'  .'_ (|  .-.  | ||  |OO ) \|  |)|  ||  |  / : |  .--'  ]],
    [[|       | |  | |  |(_'  '--'\  '  '-'  '|  '-'  / |  `---. ]],
    [[`-------' `--' `--'   `-----'   `-----' `------'  `------' ]],
}

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
  return "noirstar"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo "ready"]])
alpha.setup(dashboard.opts)
