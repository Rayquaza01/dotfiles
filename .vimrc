call plug#begin("~/vimfiles/plugged")
Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'reedes/vim-pencil'
Plug 'romainl/vim-qf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'w0rp/ale'
call plug#end()
if !has("gui_running")
    " special cursors
    if exists('$TMUX')
        let &t_SI = "\ePtmux;\e\e[5 q\e\\"
        let &t_EI = "\ePtmux;\e\e[2 q\e\\"
    else
        let &t_SI = "\e[5 q"
        let &t_EI = "\e[2 q"
    endif
    if has("win32")
        " ConEmu support
        set term=xterm
        let &t_AB="\e[48;5;%dm"
        let &t_AF="\e[38;5;%dm"
        inoremap <Char-0x07F> <BS>
        nnoremap <Char-0x07F> <BS>
    endif
endif
if has("win32")
    set guifont=Roboto_Mono_for_Powerline:h11:cANSI:qDRAFT "patched font from here: https://github.com/yurakl/fonts
    set guioptions=+c "makes vim more consoley
endif
set t_Co=256
set background=light
set bo=all "makes vim quiet
set tabstop=4
set shiftwidth=4
set expandtab "tabs to spaces
set softtabstop=4 "backspace 4 times
set hlsearch
set number "numbers on side
set relativenumber
set undofile
set undodir=~/vimfiles/Undo/ "enables undofile
set backup
set backupdir=~/vimfiles/Backup/ "enables backupdir
set hidden "allows buffers to be hidden
set colorcolumn=90 "color 90th column as reference
colorscheme PaperColor
" use gs for git status
nnoremap gs :Gstatus<CR>
" Enter in ins-completion-menu confirms item
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" prevent $ in ins mode from selecting new line
vnoremap $ $h
" ignore .gitignore files in ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" show buffers at top
let g:airline#extensions#tabline#enabled = 1
" indent html script and style tags correctly
let g:html_indent_style1 = "inc"
let g:html_indent_script1 = "inc"
" fix commentary on ahk files
autocmd FileType autohotkey setlocal commentstring=;\ %s

" ale conifgs
" use quickfix instead of location list
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" open quickfix after lint (if applicable)
let g:ale_open_list = 1
" disable echo for errors (fixes cursor disappearing error)
let g:ale_echo_cursor = 0
" disable sign gutter
let g:ale_set_signs = 0
" only lint on save
let g:ale_lint_on_text_changed = "never"
let g:ale_lint_on_insert_leave = 1

" https://coderwall.com/p/1b30wg/use-solarized-in-your-vim-use-light-during-the-day-and-dark-at-night
if strftime("%H") >= 6 && strftime("%H") <= 20
  set background=light
else
  set background=dark
endif

augroup Linting
    autocmd!
    " ale fixers only prettier for js, css, json, md
    " autopep8 for py
    autocmd FileType javascript,css,json,markdown let b:ale_fixers = ["prettier"]
    autocmd FileType python let b:ale_fixers = ["autopep8"]
    " only use pycodestyle for linting on python
    autocmd FileType python let b:ale_linters = ["pycodestyle"]
    " fix before saving
    " autocmd BufWritePre *.js,*.css,*.py ALEFix
augroup END

augroup CSV
    autocmd!
    " compact csv before saving
    autocmd BufWritePre *.csv %UnArrangeColumn
    " expand csv on read, after saving
    autocmd BufRead,BufWritePost *.csv %ArrangeColumn!
augroup END

augroup Help
    autocmd!
    autocmd FileType python setlocal keywordprg=:Dispatch\ pydoc\ <cword>
    autocmd FileType javascript,html,css setlocal keywordprg=:Dispatch\ mdn\ <cword>
    autocmd FileType markdown setlocal keywordprg=:Dispatch\ diction\ <cword>\ -d
augroup END
