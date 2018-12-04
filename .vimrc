call plug#begin("~/vimfiles/plugged")
Plug 'chrisbra/csv.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
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
call plug#end()
if !has("gui_running")
    " special cursors
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
    if has("win32")
        " ConEmu support
        set term=xterm
        set t_Co=256
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
" Ctrl-S for save
nnoremap <c-s> :w<CR>
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
" let g:AutoCloseProtectedRegions = ['Comment']
let g:html_indent_style1 = "inc"
let g:html_indent_script1 = "inc"
autocmd FileType autohotkey setlocal commentstring=;\ %s
" format with prettier on save
let g:prettier#autoformat = 0
command! Format :normal gggqG

augroup Linting
    autocmd!
    autocmd FileType javascript setlocal makeprg=eslint\ --format\ unix
    autocmd FileType python setlocal makeprg=pycodestyle\ --ignore=E501
    autocmd FileType python setlocal formatprg=autopep8\ -
    autocmd FileType cpp setlocal makeprg=gcc\ -fsyntax-only
    autocmd FileType markdown setlocal makeprg=proselint
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
    autocmd BufRead,BufWritePost *.js,*.py,*.cpp,*.md silent Make <afile>
augroup END

augroup CSV
    autocmd!
    autocmd BufWritePre *.csv %UnArrangeColumn
    autocmd BufRead,BufWritePost *.csv %ArrangeColumn!
augroup END

augroup Help
    autocmd!
    autocmd FileType python setlocal keywordprg=:Dispatch\ pydoc\ <cword>
    autocmd FileType javascript,html,css setlocal keywordprg=:Dispatch\ mdn\ <cword>
    autocmd FileType markdown setlocal keywordprg=:Dispatch\ diction\ <cword>\ -d
augroup END
