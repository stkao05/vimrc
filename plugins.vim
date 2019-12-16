""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
call pathogen#infect('~/vimrc/plugins/{}')
call pathogen#helptags()


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" CTRL-P
""""""""""""""""""""""""""""""

map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$|\v[\/]node_modules$',
  "\ 'file': '\v\.(py)$'
  "\ }


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore = ['\.pyc$', '\.coffee.*\.js', '\.es6\..*\.js', '\.swp', '.*\~']
let g:NERDTreeWinSize=50
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowBookmarks=1

map <leader><leader> :NERDTreeToggle<cr>
map <leader>. :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" vim-multiple-cursors Setup {{{
function! Multiple_cursors_before()
    call youcompleteme#DisableCursorMovedAutocommands()
endfunction

function! Multiple_cursors_after()
    call youcompleteme#EnableCursorMovedAutocommands()
endfunction
" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline config (force color)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="luna"




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [], 'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_open = 0

function! ToggleSyntasticCheck()
    if g:syntastic_open
        SyntasticToggleMode
        SyntasticReset
        let g:syntastic_open = 0
    else
        SyntasticToggleMode
        SyntasticCheck
        let g:syntastic_open = 1
    endif
endfunction

nmap <leader>s :call ToggleSyntasticCheck()<cr>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Emmet (Zen coding)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_mode='a'
"let g:user_emmet_install_global = 0
"autocmd FileType mako,tmpl,gotplhtml,htmldjango,html,css,swig EmmetInstall



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto closing of the preview window when the user accepts the offered completion string.
let g:ycm_autoclose_preview_window_after_completion=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => jedi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType python let g:jedi#auto_initialization = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" re-mapping go-def command to open in buffer instead of tab
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>t :TagbarToggle<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>f :Autoformat<CR>

let g:formatdef_prettier = '"prettier --stdin-filepath ".@%'
let g:formatters_javascript = ['prettier']
let g:formatters_less = ['prettier']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag searching and cope displaying
"
" We use ack.vim and configure it to use ag instead of ack
" because ag is much faster than ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev Ack Ack!
nmap <leader>a :Ack<Space>
" When you press gv you Ack after the selected text
vnoremap <leader>a :call VisualSelection('gv', '')<CR>
let g:ackprg = 'ag --nogroup --nocolor --column --vimgrep --path-to-ignore ~/.agignore'




function! VisualSelectAndEscape()
    let l:saved_reg = @"
    execute "normal! vgvy"

    let g:searchStr = escape(@", '"\\/.*$%^~[]()')
    let g:searchStr = substitute(g:searchStr, "\n$", "", "")
endfunction





let g:flake8_show_in_gutter = 1
let g:flake8_show_in_gutter = 1





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => https://github.com/lukaszkorecki/CoffeeTags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:CoffeeAutoTagDisabled=<0 or 1>     " Disables autotaging on save (Default: 0 [false])
let g:CoffeeAutoTagFile="~/.coffee_tags"
" let g:CoffeeAutoTagIncludeVars=<0 or 1>  " Includes variables (Default: 0 [false])
" let g:CoffeeAutoTagTagRelative=<0 or 1>  " Sets file names to the relative path from the tag file location



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => https://github.com/maxbrunsfeld/vim-yankstack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <C-p> <Plug>yankstack_substitute_older_paste
vnoremap <C-P> <Plug>yankstack_substitute_newer_paste


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ultisnips
" https://github.com/sirver/ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jsdoc
" https://github.com/heavenshell/vim-jsdoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>d <Plug>(jsdoc)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-json https://github.com/elzr/vim-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal = 0




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

nmap <silent> <C-[> <Plug>(ale_previous_wrap)
nmap <silent> <C-]> <Plug>(ale_next_wrap)

let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'python': []
            \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ListToggle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>x'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>z :Goyo<cr>

"nnoremap <leader>z :call ToggleGoyo()<cr>

"function! ToggleGoyo()
    "if &goyo_on
        "setlocal goyo_on = 0
		"call Goyo!()
    "else
        "setlocal goyo_on = 1
		"call Goyo()
    "endif
"endfunction
