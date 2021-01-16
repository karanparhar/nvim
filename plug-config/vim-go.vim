" go
" vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
 let l:file = expand('%')
 if l:file =~# '^\f\+_test\.go$'
   call go#test#Test(0, 1)
 elseif l:file =~# '^\f\+\.go$'
   call go#cmd#Build(0)
 endif
endfunction
let g:go_def_mode = 'gopls'
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_term_mode = "split"
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "15s"
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_fmt_fail_silently = 1
let g:go_addtags_transform = "camelcase"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_extra_types = 1
" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'


autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup go

 au!
 au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
 au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
 au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
 au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

 " au FileType go nmap <leader>gd <Plug>(go-def-tab)
 " au FileType go nmap <leader>gv <Plug>(go-doc-tab)
 " au FileType go nmap <leader>gb <Plug>(go-doc-browser)

 au FileType go nmap <leader>r  <Plug>(go-run)
