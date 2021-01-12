let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = '<A-z>`````ff'
let g:Lf_ShortcutB = '<A-z>`````ff'
let g:Lf_WindowHeight = 0.4
let g:Lf_ShowRelativePath = 0
let g:Lf_CursorBlink = 1
let g:Lf_CacheDirectory = expand('~/.cache/vim/leaderf')
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.vscode']
let g:Lf_ShowHidden = 1
let g:Lf_ReverseOrder = 1
let g:Lf_PreviewHorizontalPosition = 'center'
" let g:Lf_StlColorscheme = 'gruvbox_material'
" let g:Lf_PopupColorscheme = 'gruvbox_material'
let g:Lf_PreviewResult = {
      \ 'File': 0,
      \ 'Buffer': 0,
      \ 'Mru': 0,
      \ 'Tag': 0,
      \ 'BufTag': 0,
      \ 'Function': 0,
      \ 'Line': 0,
      \ 'Colorscheme': 0,
      \ 'Rg': 0,
      \ 'Gtags': 0
      \}
let g:Lf_WildIgnore = {
      \ 'dir': ['.svn','.git','.hg', '.vscode', 'node_modules', 'dist'],
      \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
      \}
let g:Lf_RgConfig = [
      \ '--glob=!\.git/*',
      \ '--glob=!\.vscode/*',
      \ '--glob=!dist/*',
      \ '--glob=!node_modules/*',
      \ '--glob=!\.svn/*',
      \ '--glob=!\.hg/*',
      \ '--case-sensitive',
      \ has('win32') ? '--crlf' : '--no-crlf',
      \ '--multiline',
      \ '--hidden'
      \ ]
map <leader>f :LeaderfFile<CR>
map <leader>u :LeaderfFunction<CR>
map <leader>b :LeaderfBuffer<CR>
map <leader>g :Leaderf rg<CR>
map <leader>lc :LeaderfColorscheme<CR>
" map <leader>gg :Leaderf gtags<CR>

"" search word under cursor, the pattern is treated as regex, and enter normal mode directly
noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

"" search wxnoremapnoremaord under cureat as regex,
"" append the result to previous search results.
"" noremap <leader>fg :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>

"" search word under cursor literally only in current buffer
"noremap <leader>ff :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>

"" search word under cursor literally in all listed buffers
""noremap <C-D> :<C-U><C-R>=printf("Leaderf! rg -F --all-buffers -e %s ", expand("<cword>"))<CR>

"" search visually selected text literally, don't quit LeaderF after accepting an entry
""xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>

"" recall last search. If the result window is closed, reopen it.
noremap <leader>fo :<C-U>Leaderf! rg --recall<CR>


"" search word under cursor in *.h and *.cpp files.
""noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.h -g *.cpp", expand("<cword>"))<CR>
"" the same as above
""noremap <Leader>a :<C-U><C-R>=printf("Leaderf! rg -e %s -g *.{h,cpp}", expand("<cword>"))<CR>

"" search word under cursor in cpp and java files.
""noremap <Leader>b :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -t java", expand("<cword>"))<CR>

"" search word under cursor in cpp files, exclude the *.hpp files
""noremap <Leader>c :<C-U><C-R>=printf("Leaderf! rg -e %s -t cpp -g !*.hpp", expand("<cword>"))<CR>

"let g:Lf_GtagsAutoGenerate = 0
"let g:Lf_Gtagslabel = 'native-pygments'
"noremap <leader>gr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>gd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>go :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
"noremap <leader>gn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
"noremap <leader>gp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
