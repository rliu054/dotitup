" ---

set nocompatible " turns vi compatibility off.

" ---

let mapleader=" "

if filereadable(expand("~/.dotvim/plug.vim"))
  source ~/.dotvim/plug.vim
endif

" ---

set background=dark
colorscheme solarized8_high
set cursorline

" ---

syntax on
set regexpengine=1 " speeds up syntax highlighting
set number " displays line numbers.

" ---

" set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set foldmethod=indent
set foldlevelstart=20

" ---

set showbreak=⇇
set wrap

" ---

"" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" ---

set updatetime=250
set timeoutlen=500

" ---

set noswapfile
set nobackup
set nowb

" ---

set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set noshowmode                  " Don't Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set hidden

" ---

set wildmenu
set wildmode=longest,list,full
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=vendor/gems/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ---

set ignorecase
set smartcase
set hlsearch
nmap // :silent :nohlsearch<CR>
set incsearch

" ---

set scrolloff=15
set sidescrolloff=15
set sidescroll=1

" ---

" Display tabs and trailing spaces visually
set list listchars=tab:▸\ ,trail:·


" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.dotvim/backups > /dev/null 2>&1
  set undodir=~/.dotvim/backups
  set undofile
endif

" ---

source ~/.dotvim/settings.vim

" ---

set rtp+=/usr/local/opt/fzf

" ---
if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif

" ====== Handle GUI paste automatically ======
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
" function! WrapForTmux(s)
"   if !exists('$TMUX')
"     return a:s
"   endif

"   let tmux_start = "\<Esc>Ptmux;"
"   let tmux_end = "\<Esc>\\"

"   return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
" endfunction

" let &t_SI .= WrapForTmux("\<Esc>[?2004h")
" let &t_EI .= WrapForTmux("\<Esc>[?2004l")

" function! XTermPasteBegin()
"   set pastetoggle=<Esc>[201~
"   set paste
"   return ""
" endfunction

" inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
"
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction
