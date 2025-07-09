" MY (NEO)VIM CONFIGURATION
" All neovim specific configuration should be wrapped inside a has('nvim')
" Any lua configuration (such as plugin configs) are in .config/nvim/init.lua
" or in the lua heredoc at the end of this file

" === PLUGIN DEFINITIONS ===

scriptencoding utf-8

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'

" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasiser/vim-code-dark'

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

" Plug 'blueyed/vim-diminactive'

Plug 'vimwiki/vimwiki'

if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Plug 'nvim-tree/nvim-tree.lua'

    Plug 'windwp/nvim-autopairs'

    Plug 'HiPhish/rainbow-delimiters.nvim'

    Plug 'lewis6991/gitsigns.nvim'
    Plug 'f-person/git-blame.nvim'

    Plug 'lukas-reineke/indent-blankline.nvim'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'willothy/nvim-cokeline'

    Plug 'nvim-lualine/lualine.nvim'

    Plug 'ibhagwan/fzf-lua'

    Plug 'norcalli/nvim-colorizer.lua'

    Plug 'folke/zen-mode.nvim'
    " Plug 'folke/todo-comments.nvim'
    " Plug 'folke/which-key.nvim'

    Plug 'lambdalisue/vim-suda'

    Plug 'kdheepak/lazygit.nvim'

    " NEOVIM LSP PLUGINS
    Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
    " Plug 'dcampos/nvim-snippy'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'saadparwaiz1/cmp_luasnip'

    Plug 'onsails/lspkind.nvim'

    Plug 'hrsh7th/cmp-calc'
    Plug 'chrisgrieser/cmp-nerdfont'
    Plug 'hrsh7th/cmp-emoji'

    " I don't really care for either of these
    " dictionary completion is built in with <C-X><C-K>
    " but it only works with :set spell
    " Plug 'f3fora/cmp-spell'
    " Plug 'uga-rosa/cmp-dictionary'

    " Plug 'petertriho/cmp-git'

    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    Plug 'mikavilpas/yazi.nvim'

    Plug 'MeanderingProgrammer/render-markdown.nvim'
else
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }

    Plug 'junegunn/goyo.vim'

    Plug 'editorconfig/editorconfig-vim'

    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf.vim'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'catppuccin/vim', { 'as': 'catppuccin' }

    " Plug 'francoiscabrol/ranger.vim'
    Plug 'chriszarate/yazi.vim'
endif

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
if !has('nvim')
    set undodir=~/.tmp/undo
endif

" set backup
" set backupdir=~/.tmp/backup

set colorcolumn=90

let g:codedark_italics=1
" use the terminal background instead of codedark's default background
" doesn't work in gvim
if !has('gui_running')
    let g:codedark_transparent=1
endif
set background=dark
" colorscheme codedark
" colorscheme papercolor
if has('nvim')
    colorscheme catppuccin-macchiato
else
    colorscheme catppuccin_macchiato
endif

if has('gui')
    set guifont=DejaVu\ Sans\ Mono\ 14
    set guioptions=
endif

if exists('g:neovide')
    set guifont=DejaVu\ Sans\ Mono:h14
endif

set mouse=a

set foldmethod=indent
" set foldcolumn=1
" set foldlevel=99
set foldlevelstart=99
set foldenable

" i beam cursor
" needs to be in double quotes to work
if !has('nvim')
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
endif

vnoremap $ $h

" neovim needs this for gg to move to the start of the line
set startofline

" if has('nvim')
"     set laststatus=3
" endif

set signcolumn=yes

" enable indent guides using lead multi space
" not needed in nvim because the indent blankline plugin does it better
" based on the example in this readme: https://github.com/thaerkh/vim-indentguides
" The list chars here are based on the listchars in sensible, with tab changed to ▎
if !has('nvim')
    augroup Indent
        autocmd!
        autocmd BufEnter * execute 'setlocal listchars=tab:▎\ ,trail:-,extends:>,precedes:<,nbsp:+,multispace:▎' . repeat('\ ', &sw - 1)
        autocmd OptionSet shiftwidth execute 'setlocal listchars=tab:▎\ ,trail:-,extends:>,precedes:<,nbsp:+,multispace:▎' . repeat('\ ', &sw - 1)
    augroup END
else
    set listchars=tab:▎\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" <C-`> to open terminal
" doesn't work in nvim
if !has('nvim')
    if exists('$TMUX')
        nnoremap <c-@> :silent !tmux split-window -v<CR>
    else
        " ctrl + ` to open terminal
        nnoremap <c-@> :bel term<CR>
    endif
else
    if exists('$TMUX')
        nnoremap <c-t> :silent !tmux split-window -v<CR>
    endif
endif

augroup AutoSpell
    autocmd!
    autocmd FileType vimwiki,markdown,text,gitcommit setlocal spell
augroup END

nnoremap <leader>q :Bdelete<CR>
nnoremap <leader>w :w<CR>

if has('nvim')
    set exrc

    set mousemoveevent
endif

if has('nvim')
    " f2 to rename current symbol
    nnoremap <F2> :lua vim.lsp.buf.rename()<CR>
    " gd to go to definition
    nnoremap gd :lua vim.lsp.buf.definition()<CR>
endif

" === USER CONFIG END ===

" === PLUGIN CONFIG START ===

" === ULTISNIPS CONFIG ===

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" === AIRLINE CONFIG ===

if !has('nvim')
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
endif

" === GOYO CONFIG ===

if !has('nvim')
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
else
    " set goyo as alias for zen mode in neovim
    command! Goyo :ZenMode

    nnoremap <leader>z :ZenMode<CR>
endif

" === FZF CONFIG ===

silent! !git rev-parse --is-inside-work-tree > /dev/null 2>&1
if v:shell_error == 0
    noremap <C-p> :GFiles<CR>
    noremap <C-o> :GFiles?<CR>
else
    noremap <C-p> :Files<CR>
    noremap <C-o> :Files<CR>
endif

if has('nvim')
    nnoremap <leader>: :FzfLua command_history<CR>
    command! Commands :FzfLua commands

    nnoremap <leader>o :FzfLua lsp_document_symbols<CR>
    nnoremap <leader>a :FzfLua lsp_document_diagnostics<CR>

    command! CodeActions :FzfLua lsp_code_actions
    nnoremap <leader>ca :FzfLua lsp_code_actions<CR>
else
    nnoremap <leader>: :History:<CR>
endif

nnoremap <leader>b :Buffers<CR>
nnoremap <F1> :Buffers<CR>

if !has('nvim')
    inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
endif

" === NETRW CONFIG ===
" === VINEGAR CONFIG ===
" === NVIMTREE CONFIG ===
" === YAZI CONFIG ===
" === RANGER CONFIG ===

let g:netrw_winsize = 20

if has('nvim')
    nnoremap <leader>f :Yazi<CR>
else
    nnoremap <leader>f :Yazi<CR>
    " nnoremap <leader>f :Ranger<CR>
endif

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

" === LAZTGIT CONFIG ===

if has('nvim')
    nnoremap <leader>lg :LazyGit<CR>
endif

" === ALE CONFIG ===

" disable ale lsp to work better with coc
let g:ale_disable_lsp = 1

" overwrite unimpaired quickfix mappings to use ale
" includes errors from ale and coc, so preferred over ]g [g coc bindings
if has('nvim')
    nnoremap <silent> [q :lua vim.diagnostic.goto_prev()<CR>
    nnoremap <silent> ]q :lua vim.diagnostic.goto_next()<CR>
else
    nnoremap <silent> [q :ALEPrevious<CR>
    nnoremap <silent> ]q :ALENext<CR>
endif

if has('nvim')
    let g:ale_use_neovim_diagnostics_api = 1

    let g:ale_linters = {
        \ 'lua': [],
        \ 'rust': []
        \}
endif

" basic configuration for lsp support in ale
" considering replacing coc with ale,
" but there are some things not quite there yet
" would need replacement plugins for snippets, etc.
" if !has('nvim')
"     let g:ale_completion_enabled = 1
"     set omnifunc=ale#completion#OmniFunc

"     nnoremap gd :ALEGoToDefinition<CR>
" endif

" === GIT BLAME CONFIG ===
if has('nvim')
    nnoremap yogb :GitBlameToggle<CR>
    let g:gitblame_enabled = 0

    " let g:gitblame_virtual_text_column = 80
    let g:gitblame_delay = 0
    let g:gitblame_highlight_group = 'Question'
    let g:gitblame_message_when_not_committed = ''
    let g:gitblame_date_format = '%r'
    let g:gitblame_message_template = ' <author>  <date>  <summary>'
endif

" === LUA SNIP VIM CONFIG ===
if has('nvim')
    command! LuaSnipEdit lua require('luasnip.loaders').edit_snippet_files()<CR>
endif

" === AUTO PAIRS VIM CONFIG ===
if has('nvim')
    command! AutoPairsToggle lua require('nvim-autopairs').toggle()<CR>
endif

" === VIM WIKI CONFIG ===
let g:vimwiki_list = [{ 'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md' }]
let g:vimwiki_global_ext = 0

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

" === VIM SUDA CONFIG ===

if has('nvim')
    " the :w !sudo tee % trick does not work in neovim
    " vim-suda provides commands to act as a workaround
    " vim-eunuch also provides similar commands, but they rely on the tee
    " trick so they also do not work on neovim
    " alias suda commands to match eunuch's sudo commands
    command! SudoEdit SudaRead
    command! SudoWrite SudaWrite
endif

" === BEGIN COC CONFIG ===

if !has('nvim')

    " Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
    " delays and poor user experience
    set updatetime=300

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>":
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : '\<C-h>'

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call ShowDocumentation()<CR>

    function! ShowDocumentation()
      if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
      else
        call feedkeys('K', 'in')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor
    augroup CocHighlight
        autocmd!
        autocmd CursorHold * silent call CocActionAsync('highlight')
    augroup END

    " Symbol renaming
    nmap <leader>rn <Plug>(coc-rename)
    nmap <F2> <Plug>(coc-rename)

    " Formatting selected code
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup CocFormat
      autocmd!
      " Setup formatexpr specified filetype(s)
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying code actions to the selected code block
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying code actions at the cursor position
    nmap <leader>ac  <Plug>(coc-codeaction-cursor)
    " Remap keys for apply code actions affect whole buffer
    nmap <leader>as  <Plug>(coc-codeaction-source)
    " Apply the most preferred quickfix action to fix diagnostic on the current line
    " nmap <leader>qf  <Plug>(coc-fix-current)

    " Remap keys for applying refactor code actions
    nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
    xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
    nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

    " Run the Code Lens action on the current line
    nmap <leader>cl  <Plug>(coc-codelens-action)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Remap <C-f> and <C-b> to scroll float windows/popups
    if has('nvim-0.4.0') || has('patch-8.2.0750')
        nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : '\<C-f>'
        nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : '\<C-b>'
        inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? '\<c-r>=coc#float#scroll(1)\<cr>' : '\<Right>'
        inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? '\<c-r>=coc#float#scroll(0)\<cr>' : '\<Left>'
        vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : '\<C-f>'
        vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : '\<C-b>'
    endif

    " Use CTRL-S for selections ranges
    " Requires 'textDocument/selectionRange' support of language server
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer
    command! -nargs=0 Format :call CocActionAsync('format')

    " Add `:Fold` command to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline
    " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

    command! CocPairsToggle call CocAction('toggleExtension', 'coc-pairs')

    " === END COC CONFIG ===

    " === BEGIN COC SNIPPET CONFIG ===

    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)

    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)

    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<C-j>'

    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<C-k>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)

    " Use <leader>x for convert visual selected code to snippet
    xmap <leader>x  <Plug>(coc-convert-snippet)

endif

" === END COC SNIPPET CONFIG

" === BEGIN LUA CONFIG ===

if has('nvim')

lua << EOF
    vim.diagnostic.config({ virtual_text = true })

    -- === NVIMTREE CONFIG ===
    -- require('nvim-tree').setup()

    -- === IBL CONFIG and RAINBOW DELIMITERS CONFIG ===
    -- https://github.com/lukas-reineke/indent-blankline.nvim#rainbow-delimitersnvim-integration
    local highlight = {
        'RainbowRed',
        'RainbowYellow',
        'RainbowBlue',
        'RainbowOrange',
        'RainbowGreen',
        'RainbowViolet',
        'RainbowCyan',
    }

    local hooks = require('ibl.hooks')
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
        vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
        vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
        vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
        vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
        vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
        vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }

    require('ibl').setup({
        scope = { show_end = false, show_start = false, highlight = highlight }
    })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    -- === COKELINE CONFIG ===

    local macchiato = require("catppuccin.palettes").get_palette("macchiato")

    local get_hex = require('cokeline.hlgroups').get_hl_attr

    require('cokeline').setup({
        default_hl = {
            fg = function (buffer)
                return buffer.is_focused and macchiato.text or get_hex('Comment', 'fg')
            end,
            bg = function(buffer)
                if buffer.buf_hovered then
                    return macchiato.surface1
                else
                    return buffer.is_focused and macchiato.surface1 or macchiato.surface0
                end
            end
        },

        components = {
            {
                text = '',
                fg = function(buffer)
                    return buffer.is_focused and macchiato.mauve or macchiato.overlay2
                end,
                bg = macchiato.mantle
            },
            {
                text = function(buffer) return ' ' .. buffer.devicon.icon  end,
                fg = function(buffer)
                    -- return buffer.is_focused and buffer.devicon.color or get_hex('Comment', 'fg')
                    return buffer.devicon.color
                end,
            },
            {
                text = function(buffer) return buffer.unique_prefix end,
                fg = get_hex('Comment', 'fg'),
                italic = true,
            },
            {
                text = function(buffer) return buffer.filename .. ' ' end,
                bold = function(buffer) return buffer.is_focused end,
            },
            {
                text = function(buffer)
                    if buffer.diagnostics.errors > 0 then
                        return  ' ' .. buffer.diagnostics.errors .. ' '
                    end

                    return ''
                end,
                fg = get_hex('DiagnosticError', 'fg') or get_hex('LspDiagnosticsDefaultError', 'fg') or get_hex('DiffDelete', 'fg')
            },
            {
                text = function(buffer)
                    if buffer.diagnostics.warnings > 0 then
                        return '󰀪 ' .. buffer.diagnostics.warnings .. ' '
                    end

                    return ''
                end,
                fg = get_hex('DiagnosticWarn', 'fg') or get_hex('LspDiagnosticsDefaultWarning', 'fg') or get_hex('DiffText', 'fg')
            },
            {
                text = function(buffer)
                    if buffer.diagnostics.infos > 0 then
                        return '󰋽 ' .. buffer.diagnostics.infos .. ' '
                    end

                    return ''
                end,
                fg = get_hex('DiagnosticInfo', 'fg') or get_hex('LspDiagnosticsDefaultInformation', 'fg') or get_hex('Normal', 'fg')
            },
            {
                text = function(buffer)
                    if buffer.is_hovered then
                        return buffer.is_modified and '' or '󰅙'
                    else
                        return buffer.is_modified and '' or '󰅚'
                    end
                end,
                on_click = function(_, _, _, _, buffer)
                    buffer:delete()
                end
            },
            {
                text = ' '
            },
            {
                text = ' ',
                fg = function (buffer)
                    if buffer.buf_hovered then
                        return macchiato.surface1
                    else
                        return buffer.is_focused and macchiato.surface1 or macchiato.surface0
                    end
                end,
                bg = macchiato.mantle
            },
        }
    })

    -- === AUTO PAIRS CONFIG ===
    require('nvim-autopairs').setup({
        disable_filetype = { "markdown" }
    })

    -- === TELESCOPE CONFIG ===
    -- require('telescope').setup({
    --     extensions = {
    --         undo = {}
    --     }
    -- })

    -- === GITSIGNS CONFIG ===
    require('gitsigns').setup({
        on_attach = function(bufnr)
            local gitsigns = require('gitsigns')

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
                if vim.wo.diff then
                    vim.cmd.normal({']c', bang = true})
                else
                    gitsigns.nav_hunk('next')
                end
            end)

            map('n', '[c', function()
                if vim.wo.diff then
                    vim.cmd.normal({'[c', bang = true})
                else
                    gitsigns.nav_hunk('prev')
                    end
            end)

            -- Actions
            -- use h (hunk) for hunk specific bindings
            -- use g (git) for buffer wide bindings
            map('n', '<leader>hs', gitsigns.stage_hunk)
            map('n', '<leader>hr', gitsigns.reset_hunk)
            map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
            map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
            map('n', '<leader>hp', gitsigns.preview_hunk)
            map('n', '<leader>hu', gitsigns.undo_stage_hunk)
            map('n', '<leader>gs', gitsigns.stage_buffer)
            map('n', '<leader>gr', gitsigns.reset_buffer)
            -- use git-blame.nvim :GitBlameToggle or yogb
            -- map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
            -- map('n', '<leader>tb', gitsigns.toggle_current_line_blame)

            -- might want to have these be fugitive bindings?
            map('n', '<leader>gd', gitsigns.diffthis)
            map('n', '<leader>gD', function() gitsigns.diffthis('~') end)

            map('n', 'yogd', gitsigns.toggle_deleted)

            -- Text object
            map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
    })

    -- === FZF LUA CONFIG ===
    require('fzf-lua').setup({ 'fzf-vim' })

    -- === LUALINE CONFIG ===
    require('lualine').setup({
        options = {
            theme = 'catppuccin-mocha',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'ObsessionStatus', 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        }
    })

    -- === NVIM COLORIZER CONFIG ===
    require('colorizer').setup()

    -- === ZEN MODE CONFIG ===
    -- mimic goyo defaults
    require('zen-mode').setup({
        window = {
            height = 0.8,
            options = {
                signcolumn='no',
                number=false,
                relativenumber=false,
                colorcolumn='',
                spell=true,
                cursorline=true,
            }
        },
        on_open = function ()
            -- vim.fn['peekaboo#off']()
            vim.cmd('PencilSoft')
        end,
        on_close = function ()
            -- vim.fn['peekaboo#on']()
            vim.cmd('PencilOff')
        end
    })

    -- === TODO COMMENTS CONFIG ===
    -- require('todo-comments').setup()

    -- === RENDER MARKDOWN CONFIG ===
    -- use render markdown with vimwiki
    require('render-markdown').setup({
        file_types = { 'markdown', 'vimwiki' },
        heading = {
            --backgrounds = {},
            --position = 'inline',
            sign = false,
        },
        link = { enabled = false },
    })

    vim.treesitter.language.register('markdown', 'vimwiki')

    -- === LUASNIP CONFIG ===
    require("luasnip.loaders.from_snipmate").lazy_load()
    local ls = require("luasnip")

    -- vim.keymap.set({"i"}, "<Tab>", function() ls.expand() end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-j>", function() ls.jump( 1) end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-k>", function() ls.jump(-1) end, {silent = true})

    -- can't indent with this!
    -- vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
    -- vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end, {silent = true})

    -- === MASON CONFIG ===
    require('mason').setup()

    -- === CMP CONFIG ===
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    cmp.setup({
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
            end,
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ['<Tab>'] = cmp.mapping.confirm({ select = true }),
            -- ['<C-j>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
            { name = 'calc' },

            --[[
            -- Spell doesn't work as well as I'd like,
            -- So I disabled it in favor of dictionary
            {
                name = 'spell',
                option = {
                    keep_all_entries = false,
                    enable_in_context = function()
                        return true
                    end,
                    preselect_correct_word = false
                }
            },
            ]]--

            { name = 'emoji' }
        }, {
            { name = 'buffer' },
            -- { name = 'dictionary', keyword_length = 2 },
        }),
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol_text',
                maxwidth = 50,
                show_labelDetails = true
            })
        }
    })

    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    -- Set configuration for specific filetype.
    -- cmp.setup.filetype('gitcommit', {
    --     sources = cmp.config.sources({
    --         { name = 'git' },
    --     }, {
    --         { name = 'buffer' },
    --     })
    -- })
    -- require("cmp_git").setup()

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- require('cmp_dictionary').setup({
    --     paths = { "/usr/share/dict/words", "~/.config/nvim/spell/en.utf-8.add" },
    --     exact_length = 2
    -- })

    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- === LSP CONFIG CONFIG ===
    local lspconfig = require('lspconfig')
    lspconfig.clangd.setup({ capabilities = capabilities })
    lspconfig.cssls.setup({ capabilities = capabilities })
    lspconfig.dprint.setup({ capabilities = capabilities })
    lspconfig.fish_lsp.setup({ capabilities = capabilities })
    lspconfig.gdscript.setup({ capabilities = capabilities })
    lspconfig.html.setup({ capabilities = capabilities })
    lspconfig.jsonls.setup({ capabilities = capabilities })
    lspconfig.lua_ls.setup({ capabilities = capabilities })
    lspconfig.pyright.setup({ capabilities = capabilities })
    lspconfig.rust_analyzer.setup({ capabilities = capabilities })
    lspconfig.taplo.setup({ capabilities = capabilities })
    lspconfig.ts_ls.setup({ capabilities = capabilities })
    lspconfig.vimls.setup({ capabilities = capabilities })
EOF

endif

" === END LUA CONFIG ===
