" Copyright 2018 Tymoteusz Blazejczyk
"
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
"
"     http://www.apache.org/licenses/LICENSE-2.0
"
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.

" Skeleton empty functions replacements "
let g:skeleton_replacements = {}

" Skeleton override guard name macro "
function! g:skeleton_replacements.GUARDNAME()
    return toupper(expand('%:t:gs/[^0-9a-zA-Z_]/_/g'))
endfunction

" Open NERDTree, jump to it and open Tagbar "
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd l
autocmd VimEnter * Tagbar

" Maps "
" Fugitive "
nmap <Leader>gs :Gstatus<CR> :resize 30<CR>

" Commands "
map <F3> :NERDTreeToggle<CR>
map <F4> :TagbarToggle<CR>
map <F5> yaw :Ag --cc <C-R>" .<CR>
map <F6> :!ctags --fields=+l -R .<CR>
map <F8> :make<CR>

" Enable to use local .vimrc files "
set secure
set exrc
" Enable mouse for all Vim modes "
set mouse=a
" Aligned of next line  "
set shiftwidth=4
" Replace tabulation with space  "
set expandtab
" Use 4 space for Tab "
set ts=4
" Show line numbes "
set number
" Match
set showmatch
" Syntax highlight for files "
set syntax=on
" Show tabs "
" set listchars=tab:>-,eol:$
" Enable spell check language "
set spelllang=en_us
" Limit text width to 80 characters "
set textwidth=80
" Cursor offset "
set so=5
hi Comment ctermfg=26
hi Directory ctermfg=26

" Option used for vim-airline in terminal "
set laststatus=2
set encoding=utf-8
set term=xterm-256color
if has('gui_running')
    colorscheme torte
endif

let g:miniBufExplorerAutoStart = 1
let g:miniBufExplBuffersNeeded = 0

" Signify "
let g:signify_disable_by_default = 1
highligh SignifySignAdd     cterm=bold ctermbg=237 ctermfg=119
highligh SignifySignDelete  cterm=bold ctermbg=237 ctermfg=167
highligh SignifySignChange  cterm=bold ctermbg=237 ctermfg=227

" Ctrl-P "
let g:ctrlp_extensions = ['tag', 'buffertag']

" Airline "
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" Syntastic "
" let g:syntastic_check_on_wq = 0
" let g:syntastic_systemverilog_checkers = ["verilator"]

" YouCompleteMe "
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_python_interpreter = "/usr/bin/python3"

" Snippets "
let g:UltiSnipsListSnippets = "<c-l>"
let g:UltiSnipsExpandTrigger = "<c-e>"
let g:UltiSnipsJumpForwardTrigger = "<c-e>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "mysnippets"]

" Markdown "
let g:vim_markdown_folding_disabled = 1

" indentLine "
let g:indentLine_color_term = 239

" TagBar "
let g:tagbar_type_systemverilog = {
    \ 'ctagstype': 'systemverilog',
    \ 'kinds' : [
         \'A:assertions',
         \'C:classes',
         \'E:enumerators',
         \'I:interfaces',
         \'K:packages',
         \'M:modports',
         \'P:programs',
         \'Q:prototypes',
         \'R:properties',
         \'S:structs and unions',
         \'T:type declarations',
         \'V:covergroups',
         \'b:blocks',
         \'c:constants',
         \'e:events',
         \'f:functions',
         \'m:modules',
         \'n:net data types',
         \'p:ports',
         \'r:register data types',
         \'t:tasks',
     \],
     \ 'sro': '.',
     \ 'kind2scope' : {
        \ 'K' : 'package',
        \ 'C' : 'class',
        \ 'm' : 'module',
        \ 'P' : 'program',
        \ 'I' : 'interface',
        \ 'M' : 'modport',
        \ 'f' : 'function',
        \ 't' : 'task',
     \},
     \ 'scope2kind' : {
        \ 'package'   : 'K',
        \ 'class'     : 'C',
        \ 'module'    : 'm',
        \ 'program'   : 'P',
        \ 'interface' : 'I',
        \ 'modport'   : 'M',
        \ 'function'  : 'f',
        \ 'task'      : 't',
     \ },
     \}

function EditNewFilename()
  let l:filename = input("filename: ")
  exec ':wincmd l'
  exec "edit " . l:filename
endfunction

autocmd VimEnter * call NERDTreeAddMenuItem({
  \ 'text': '(t)New with template',
  \ 'shortcut': 't',
  \ 'callback' : 'EditNewFilename' })

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" " let Vundle manage Vundle
" " required!
Plugin 'VundleVim/Vundle.vim'

" " My bundles here:
" "
" " Original repos on GitHub
" " For more plugins see http://vimawesome.com
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-speeddating'
Plugin 'Tagbar'
Plugin 'tComment'
Plugin 'noahfrederick/vim-skeleton'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'rking/ag.vim'
" Plugin 'vhda/verilog_systemverilog.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Yggdroot/indentLine'
Plugin 'sickill/vim-monokai'
Plugin 'godlygeek/tabular'
Plugin 'gabrielelana/vim-markdown'
Plugin 'delimitMate.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'mhinz/vim-signify'
Plugin 'edkolev/tmuxline.vim'
Plugin 'edkolev/promptline.vim'
Plugin 'tpope/vim-dispatch'

call vundle#end()
filetype plugin indent on     " required!

" "
" " Brief help
" " :PluginList          - list configured bundles
" " :PluginInstall(!)    - install (update) bundles
" " :PluginSearch(!) foo - search (or refresh cache first) for foo
" " :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
" "
" " see :h vundle for more details or wiki for FAQ
" " NOTE: comments after Plugin commands are not allowed.
