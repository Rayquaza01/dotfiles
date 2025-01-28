" MY (SIMPLE) VIM CONFIGURATION
" For use in smaller setups where nvim or certain features such as lsp are not
" needed, or can't be setup

" === PLUGIN DEFINITIONS ===

scriptencoding utf-8

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'

" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" colorschemes
Plug 'simnalamburt/vim-mundo'

Plug 'tpope/vim-dispatch'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'easymotion/vim-easymotion'

" Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'

Plug 'dense-analysis/ale'

" prose
Plug 'preservim/vim-pencil'

" follow symlinks, allow version control on dotfiles when editing symlinks
" https://github.com/tpope/vim-fugitive/issues/147#issuecomment-506960242
Plug 'aymericbeaumet/vim-symlink'
Plug 'moll/vim-bbye'

Plug 'junegunn/goyo.vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'catppuccin/vim', { 'as': 'catppuccin' }

" Plug 'francoiscabrol/ranger.vim'
Plug 'chriszarate/yazi.vim'

Plug 'SirVer/ultisnips'
call plug#end()

" === USER CONFIG ===

set t_Co=256
set termguicolors

nnoremap <SPACE> <Nop>
let g:mapleader=' '

set number
set relativenumber

set ignorecase

set hlsearch

set list

set hidden

set softtabstop=4
set shiftwidth=4
set expandtab

set undofile
set undodir=~/.vim/undo

" set backup
" set backupdir=~/.vim/backup

set colorcolumn=90

set background=dark
colorscheme catppuccin_macchiato

if has('gui_running')
    set guifont=CodeNewRoman\ Nerd\ Font\ Mono\ 16
    set guioptions=
endif

set mouse=a

set foldmethod=indent
" set foldcolumn=1
" set foldlevel=99
set foldlevelstart=99
set foldenable

" i beam cursor
" needs to be in double quotes to work
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

vnoremap $ $h

" neovim needs this for gg to move to the start of the line
set startofline

set signcolumn=yes

" enable indent guides using lead multi space
" not needed in nvim because the indent blankline plugin does it better
" based on the example in this readme: https://github.com/thaerkh/vim-indentguides
" The list chars here are based on the listchars in sensible, with tab changed to ▎
augroup Indent
    autocmd!
    autocmd BufEnter * execute 'setlocal listchars=tab:▎\ ,trail:-,extends:>,precedes:<,nbsp:+,multispace:▎' . repeat('\ ', &sw - 1)
    autocmd OptionSet shiftwidth execute 'setlocal listchars=tab:▎\ ,trail:-,extends:>,precedes:<,nbsp:+,multispace:▎' . repeat('\ ', &sw - 1)
augroup END

" <C-`> to open terminal
" doesn't work in nvim
if exists('$TMUX')
    nnoremap <c-@> :silent !tmux split-window -v<CR>
else
    " ctrl + ` to open terminal
    nnoremap <c-@> :bel term<CR>
endif

augroup AutoSpell
    autocmd!
    autocmd FileType vimwiki,markdown,text,gitcommit setlocal spell
augroup END

nnoremap <leader>q :Bdelete<CR>
nnoremap <leader>w :w<CR>

" === USER CONFIG END ===

" === PLUGIN CONFIG START ===

" === ULTISNIPS CONFIG ===

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" === AIRLINE CONFIG ===

let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" let g:airline_theme='codedark'
let g:airline_theme='catppuccin_macchiato'

" airline use unicode symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.maxlinenr = '≡ '
let g:airline_symbols.colnr = '㏇'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.spell = '✓'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" === GOYO CONFIG ===

function! s:goyo_enter()
    PencilSoft
    setlocal spell
    setlocal cursorline
endfunction

function! s:goyo_leave()
    PencilOff
    setlocal nospell
    setlocal nocursorline
endfunction

augroup Goyo
    autocmd!
    autocmd User GoyoEnter nested call <SID>goyo_enter()
    autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup END

nnoremap <leader>z :Goyo<CR>

" === FZF CONFIG ===

silent! !git rev-parse --is-inside-work-tree > /dev/null 2>&1
if v:shell_error == 0
    noremap <C-p> :GFiles<CR>
    noremap <C-o> :GFiles?<CR>
else
    noremap <C-p> :Files<CR>
    noremap <C-o> :Files<CR>
endif

nnoremap <leader>: :History:<CR>

nnoremap <leader>b :Buffers<CR>
nnoremap <F1> :Buffers<CR>

inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')

" === NETRW CONFIG ===
" === VINEGAR CONFIG ===
" === NVIMTREE CONFIG ===
" === YAZI CONFIG ===
" === RANGER CONFIG ===

let g:netrw_winsize = 20

nnoremap <leader>f :Yazi<CR>

nnoremap <leader>n :Lexplore<CR>
nnoremap - :echo 'Did you mean :Lexplore?'<CR>

" === EASYALIGN CONFIG

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" === MUNDO CONFIG ===

nnoremap <leader>u :MundoToggle<CR>

" === FUGITIVE CONFIG ===

command! Gpush G push

" === ALE CONFIG ===

" disable ale lsp to work better with coc
let g:ale_disable_lsp = 1

" overwrite unimpaired quickfix mappings to use ale
" includes errors from ale and coc, so preferred over ]g [g coc bindings
nnoremap <silent> [q :ALEPrevious<CR>
nnoremap <silent> ]q :ALENext<CR>

" basic configuration for lsp support in ale
" considering replacing coc with ale,
" but there are some things not quite there yet
" would need replacement plugins for snippets, etc.
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

nnoremap gd :ALEGoToDefinition<CR>

" === OBSESSION CONFIG ===
" use autocmd to autoload obsession. fixes compat with rainbow delimiters
" https://github.com/tpope/vim-obsession/issues/17#issuecomment-229144719

augroup ObsessionRestore
    autocmd!
    autocmd VimEnter * nested
        \ if !argc() && empty(v:this_session) && filereadable('Session.vim') && !&modified |
        \   source Session.vim |
        \ endif
augroup END

" === ULTISNIP CONFIG ===
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:UltiSnipsEditSplit="vertical"
