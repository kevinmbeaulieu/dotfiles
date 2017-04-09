set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ap/vim-css-color'
Plugin 'justinmk/vim-sneak'
Plugin 'evidens/vim-twig'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on

" needed for vim-airline to display correctly
set laststatus=2
set noshowmode
set noruler
set noshowcmd

" Set leader key
let mapleader = 'm'

set cindent
set smartindent
set autoindent
set tabstop=4
filetype on
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set backspace=indent,eol,start

syntax on
colorscheme default

set listchars=tab:>-,trail:·
set list

set number

" highlight this column
set colorcolumn=101

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Remap escape
inoremap <Esc> <NOP>
inoremap kj <Esc>l
vnoremap <Esc> <NOP>
vnoremap kj <Esc>l
set timeoutlen=200

" Find/replace
nnoremap <Leader>r :%s//gc<Left><Left><Left>
nnoremap <Leader>rr :s//g<Left><Left>

" Save file
nnoremap ;j :w<Return>
nnoremap ;q :wq<Return>
nnoremap ;i :w<Return>li
nnoremap ;u :q!<Return>
inoremap ;j <Esc>:w<Return>
inoremap ;q <Esc>:wq<Return>
inoremap ;i <Esc>:w<Return>li
inoremap ;u <Esc>:q!<Return>
vnoremap ;j <Esc>:w<Return>
vnoremap ;q <Esc>:wq<Return>
vnoremap ;i <Esc>:w<Return>li
vnoremap ;u <Esc>:q!<Return>

" Navigate through git diffs
nmap gj <Plug>GitGutterNextHunk
nmap gk <Plug>GitGutterPrevHunk
nmap git <Plug>GitGutterEnable
nmap gc <Plug>GitGutterDisable
autocmd BufEnter * GitGutterEnable

" Colors for svndiff
hi GitGutterAdd      ctermfg=0 ctermbg=2 guibg='green'
hi GitGutterDelete   ctermfg=0 ctermbg=1 guibg='red'
hi GitGutterChange   ctermfg=0 ctermbg=3 guibg='yellow'
highlight SignColumn ctermbg=234

" Comment line
nnoremap <Leader>c 0i//<Esc>j
nnoremap <Leader>v 0xxj
nnoremap <Leader># 0i#<Esc>j
nnoremap <Leader>## 0xj
nnoremap <Leader>3 0i#<Esc>j
nnoremap <Leader>33 0xj

" Comment blocks (multiple languages)
vnoremap // :s#^#\/\/#<Return>:noh<Return>
vnoremap \\ :s#^\/\/##<Return>
vnoremap # :s#^#\##<Return>:noh<Return>
vnoremap ## :s#^\###<Return>
vnoremap " :s#^#\"#<Return>:noh<Return>
vnoremap "" :s#^\"##<Return>

" Tabs
nnoremap gn :tabnew<Space>
nnoremap gtr :tabp<Return>
nnoremap gtt :tabp<Return>
nnoremap g2t :tabn<Return>:tabn<Return>
nnoremap g2tt :tabp<Return>:tabp<Return>

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
  au!
  autocmd BufReadPost *
    \ if expand("<afile>:p:h") !=? $TEMP |
    \   if line("'\"") > 1 && line("'\"") <= line("$") |
    \     let JumpCursorOnEdit_foo = line("'\"") |
    \     let b:doopenfold = 1 |
    \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
    \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
    \        let b:doopenfold = 2 |
    \     endif |
    \     exe JumpCursorOnEdit_foo |
    \   endif |
    \ endif
  " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \   exe "normal zv" |
    \   if(b:doopenfold > 1) |
    \       exe  "+".1 |
    \   endif |
    \   unlet b:doopenfold |
    \ endif
augroup END

" Highlight current line
set cul
hi CursorLine term=none cterm=none ctermbg=117

" Indenting
nnoremap <Tab> >>
nnoremap <S-Tab> <<
inoremap [Z <Esc><<i

" Add spaces in normal mode
nmap <Space> i<Space>kj

" Backspace in normal mode
nmap <Backspace> hx

" Return in normal mode
nmap <Return> i<Return>kjk0d$j^

"Insert matching curly brace
inoremap {{ {__<Esc>v$h"ax"bx0i<Tab><Esc>o}<Esc>0dwkv^h"cyjpa_<Esc>"ap0"dx^h"dp<S-o><Esc>"cpk<<jj<<^lxxkA
inoremap {) {__<Esc>v$h"ax"bx0i<Tab><Esc>o}<Esc>0dwkv^h"cyjpa_<Esc>"ap0"dx^h"dpA);<Esc><S-o><Esc>"cpk<<jj<<^lxxkA

" Set line number color
hi LineNr ctermfg=238
hi CursorLineNr ctermfg=234

" Smart case searching
:set ignorecase
:set smartcase

" Center current line on startup
autocmd VimEnter * :normal zz

" Tab selected block
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

" Insert single character (use: isc)
nnoremap is i<Space><Esc>r

" Append single character (use: asc)
nnoremap as a<Space><Esc>r

" Append single character to end of line (usc: Asc)
nnoremap As A<Space><Esc>r

" Copy current line, paste below, replace a word (use: yyUp/Down)
nnoremap yy Vyp:s//g<Left><Left>

" Delete text without overwriting standard yank register
nnoremap dd "_dd
nnoremap D "_D
nnoremap d "_d
vnoremap d "_d

" Reload .vimrc
nnoremap <Leader>s :so ~/.vimrc<Return>

" Change entire word
nnoremap cw ciw

" Delete entire word
nnoremap dw diw

" Unhighlight last search
nnoremap <Leader>o :noh<Return>

" Add end PHP tag, indent new line
inoremap <Leader><Leader>p <?php<Return>?><Esc><S-o><Tab>

" Insert 2 lines down
nnoremap oo o<Return>
