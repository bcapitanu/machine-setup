" Add Homebrew fzf to vim path
set rtp+=/opt/homebrew/opt/fzf

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'davidhalter/jedi-vim'   " alternative to YCM
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'dense-analysis/ale'
"Plug 'vim-scripts/indentpython.vim'
Plug 'rizzatti/dash.vim'
Plug 'darfink/vim-plist'
"Plug 'airblade/vim-gitgutter'  " provided by vim-fugitive
Plug 'vim-airline/vim-airline'
Plug 'sansyrox/vim-python-virtualenv'
Plug 'chrisbra/csv.vim'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " for language server support - Metals (scala)
Plug 'ryanoasis/vim-devicons'  " always load last!

" All of your plugins must be added before the following line
call plug#end()

" Put your non-Plugin stuff after this line

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let python_highlight_all=1
let g:ycm_autoclose_preview_window_after_completion=1

"python dev settings from here: https://realpython.com/vim-and-python-a-match-made-in-heaven/

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_args = "--ignore=E501,W391"
let g:autopep8_ignore="E501,W391"

" vim-python-virtualenv settings
let g:python3_host_prog='/opt/homebrew/bin/python3'

" NERDtree syntax highlight settings
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

set cursorline

set laststatus=2 " Always display the statusline in all windows
"set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"set tabstop=8 softtabstop=0 shiftwidth=4 smarttab

"set listchars=tab:▸\ ,eol:¬
set listchars=tab:→\ ,trail:·,precedes:«,extends:»,eol:¶
set number
set nofixendofline
set noeol

" Powerline setup
set guifont=JetBrainsMono\ Nerd\ Font:h15
"set guifont=SauceCodePro\ Nerd\ Font:h15
"set guifont=FiraCode\ Nerd\ Font:h15
let g:airline_powerline_fonts = 1
set macligatures

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#syntastic#enabled = 1

"Get the 2-space YAML as the default when hit carriage return after the colon
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType sh setlocal tabstop=2 softtabstop=2 shiftwidth=2

"""" coc.nvim settings
autocmd FileType json syntax match Comment +\/\/.\+$+
" Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>
"""" end coc.nvim settings

" Related to TAB completion https://stackoverflow.com/a/526940
set wildmode=longest:full,full

set encoding=UTF-8
