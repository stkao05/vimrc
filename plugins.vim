""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'dense-analysis/ale'
Plug 'jlanzarotta/bufexplorer'
Plug 'ajh17/VimCompletesMe'
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdcommenter'

call plug#end()


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""

let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
map <leader>o :BufExplorer<cr>


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
" => ALE
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


""""""""""""""""""""""""""""""
" CTRL-P
""""""""""""""""""""""""""""""

map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <leader>f :Autoformat<CR>

let g:formatdef_prettier = '"prettier --stdin-filepath ".@%'
let g:formatters_javascript = ['prettier']
let g:formatters_javascriptreact = ['prettier']
let g:formatters_less = ['prettier']

" disable default fallback method, as they are slow
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
