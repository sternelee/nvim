" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   refactor = {
"     highlight_definitions = { enable = true },
" 		highlight_current_scope = { enable = true },
" 		navigation = {
" 	    enable = true,
" 		  keymaps = {
" 		    goto_definition = "gnd",
" 		    list_definitions = "gnD",
" 		    list_definitions_toc = "gO",
" 		    goto_next_usage = "<a-*>",
" 		    goto_previous_usage = "<a-#>",
" 		  },
" 		  },
"   },
"   playground = {
"     enable = true,
"     disable = {},
"     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
"     persist_queries = false -- Whether the query persists across vim sessions
"   },
"   textobjects = {
"     select = {
"       enable = true,
"       keymaps = {
"         -- You can use the capture groups defined in textobjects.scm
"         ["af"] = "@function.outer",
"         ["if"] = "@function.inner",
"         ["ac"] = "@class.outer",
"         ["ic"] = "@class.inner",
"       },
"     },
"   },
" }
" EOF