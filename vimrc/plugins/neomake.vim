""autodetect the existence of commands and select the faster one(rg > ag > grep)
"let g:neomakemp_grep_command = "rg"
""following is default value
"let g:neomakemp_exclude_files=['*.jpg', '*.png', '*.min.js', '*.swp', '*.pyc','*.out','*.o']
"let g:neomakemp_exclude_dirs=[ '.git', 'bin', 'log', 'build', 'node_modules', '.bundle', '.tmp','.svn' ]
""search words on current cursor.
"nmap <Leader>ng <Plug>(neomakemp_global_search)
""run commands from user input
"nmap <Leader>nr <Plug>(neomakemp_run_command)
""search words from user input(regular expression)
"nmap <Leader>nG <Plug>(neomakemp_global_search2)
""search word on current cursor in exist buffers
"nmap <Leaderf>nb <Plug>(neomakemp_global_search_buf)
""search word in current file
"nmap <Leaderf>nf <Plug>(neomakemp_global_search_cur_file)
