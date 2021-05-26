
vim.g.dashboard_session_directory = '~/.config/nvim/.sessions'
vim.g.dashboard_default_executive = 'telescope'
vim.cmd("let g:dashboard_default_executive = 'telescope'")

vim.cmd("let g:dashboard_session_directory = $HOME..'/.config/nvim/.sessions'")
-- vim.cmd("let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))")
vim.cmd("let packages = len(globpath('~/AppData/Local/nvim-dat/site/pack/packer/start', '*', 0, 1))")

vim.api.nvim_exec([[
    let g:dashboard_custom_footer = ['LuaJIT loaded '..packages..' packages']
]], false)

vim.g.dashboard_custom_section = {
    a = {description = {'  Reload Last Session            SPC q l'}, command = 'SessionLoad'},
    b = {description = {'  Recently Opened Files          SPC f r'}, command = 'Telescope oldfiles'},
    c = {description = {'  Open Project                   SPC f p'}, command = 'Telescope Project'},
    d = {description = {'  Jump to Bookmark               SPC f m'}, command = 'Telescope marks'},
    e = {description = {'  Find File                      SPC f  '}, command = 'Telescope find_files'},
    f = {description = {'  Find Word                      SPC g  '}, command = 'Telescope live_grep'},
    g = {description = {'  Open Neovim Configuration      SPC f e'}, command = ':e ~/AppData/Local/nvim/init.lua'},
}

vim.g.dashboard_custom_header = {
                 "=================     ===============     ===============   ========  ========",
                 "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
                 "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
                 "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
                 "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
                 "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
                 "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
                 "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
                 "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
                 "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
                 "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
                 "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
                 "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
                 "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
                 "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
                 "||.=='    _-'                                                     `' |  /==.||",
                 "=='    _-'                        N E O V I M                         \\/   `==",
                 "\\   _-'                                                                `-_   /",
                 " `''                                                                      ``'  ",
                 "                                                                               ",
}
