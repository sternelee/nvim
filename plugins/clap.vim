" :call clap#installer#build_maple()
noremap <Leader>c :Clap<Cr>
noremap <silent>fb :Clap buffers<Cr>
noremap <silent>ff :Clap files<Cr>
noremap <silent>fe :Clap filer<Cr>
noremap <silent>fG :Clap grep<Cr>
noremap <silent>fg :Clap grep2<Cr>
let g:clap_insert_mode_only = v:true
let g:clap_current_selection_sign = { 'text': '->', 'texthl': 'ClapCurrentSelectionSign', 'linehl': 'ClapCurrentSelection' }
let g:clap_selected_sign = { 'text': ' ·', 'texthl': 'ClapSelectedSign', 'linehl': 'ClapSelected' }
let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case --hidden -g "!node_modules/"'

let g:clap_fuzzy_match_hl_groups = [
		 \ [118 , '#9922ff'] ,
		 \ [82  , '#a236ff'] ,
		 \ [46  , '#ab49ff'] ,
		 \ [48  , '#bd70ff'] ,
		 \ [49  , '#c684ff'] ,
		 \ [50  , '#f287ca'] ,
		 \ [51  , '#f075c3'] ,
		 \ [87  , '#ef63bb'] ,
		 \ [123 , '#ed51b3'] ,
		 \ [159 , '#eb40ab'] ,
		 \ [195 , '#e92ea4'] ,
		 \ ]
