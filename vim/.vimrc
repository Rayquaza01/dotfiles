" MY (NEO)VIM CONFIGURATION
" All neovim specific configuration should be wrapped inside a has('nvim')
" Any lua configuration (such as plugin configs) are in .config/nvim/init.lua
" or in the lua heredoc at the end of this file

" === PLUGIN DEFINITIONS ===

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
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasiser/vim-code-dark'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'simnalamburt/vim-mundo'

Plug 'tpope/vim-dispatch'

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-obsession'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'easymotion/vim-easymotion'

Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-easy-align'

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" prose
Plug 'preservim/vim-pencil'

" follow symlinks, allow version control on dotfiles when editing symlinks
" https://github.com/tpope/vim-fugitive/issues/147#issuecomment-506960242
Plug 'aymericbeaumet/vim-symlink'
Plug 'moll/vim-bbye'

if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'nvim-tree/nvim-tree.lua'

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
else
    Plug 'junegunn/goyo.vim'

    Plug 'editorconfig/editorconfig-vim'

    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf.vim'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'francoiscabrol/ranger.vim'
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
colorscheme codedark
" colorscheme papercolor
" colorscheme catppuccin-macchiato

if has('gui')
    set guifont=DejaVu\ Sans\ Mono\ 14
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
if !has('nvim')
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
endif

vnoremap $ $h

" neovim needs this for gg to move to the start of the line
set startofline

if has('nvim')
    set laststatus=3
endif

" enable indent guides using lead multi space
" not needed in nvim because of indent blank line plugin
if !has('nvim')
    command! EnableIndentGuides execute 'setlocal listchars+=tab:\|\ ,leadmultispace:\|' . repeat('\ ', &sw - 1)
    command! DisableIndentGuides execute 'setlocal listchars-=tab:\|\ ,leadmultispace:\|' . repeat('\ ', &sw - 1)
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
    autocmd FileType markdown,text,gitcommit setlocal spell
augroup END

" nnoremap <leader>x :bd<CR>
" nnoremap <leader>w :w<CR>

" === USER CONFIG END ===

" === PLUGIN CONFIG START ===

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" === AIRLINE CONFIG ===

if !has('nvim')
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1

    let g:airline_theme='codedark'

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
    endfunction

    function! s:goyo_leave()
        PencilOff
        setlocal nospell
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
else
    " set goyo as alias for zen mode in neovim
    command! Goyo :ZenMode
endif

" === FZF CONFIG ===

silent! !git rev-parse --is-inside-work-tree > /dev/null 2>&1
if v:shell_error == 0
    noremap <C-p> :GFiles<CR>
    noremap <C-o> :GFiles?<CR>
else
    noremap <C-p> :Files<CR>
endif

if has('nvim')
    nnoremap <leader>h :FzfLua command_history<CR>
    command! Commands :FzfLua commands
else
    nnoremap <leader>h :History:<CR>
endif

nnoremap <leader>b :Buffers<CR>
nnoremap <F1> :Buffers<CR>

if !has('nvim')
    inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
endif


" === VINEGAR CONFIG ===
" === NVIMTREE CONFIG ===

let g:netrw_winsize = 20

if has('nvim')
    nnoremap <leader>n :NvimTreeToggle<CR>
    nnoremap - :echo 'Did you mean :NvimTreeToggle?'<CR>
else
    nnoremap <leader>n :Lexplore<CR>
    nnoremap - :echo 'Did you mean :Lexplore?'<CR>
endif

" === EASYALIGN CONFIG

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" === MUNDO CONFIG ===

nnoremap <leader>u :MundoToggle<CR>

" === FUGITIVE CONFIG ===

command Gpush G push

" === ALE CONFIG ===

" disable ale lsp to work better with coc
let g:ale_disable_lsp = 1

" overwrite unimpaired quickfix mappings to use ale
" includes errors from ale and coc, so preferred over ]g [g coc bindings
nnoremap <silent> [q :ALEPrevious<CR>
nnoremap <silent> ]q :ALENext<CR>

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

" === OBSESSION CONFIG ===
" use autocmd to autoload obsession. fixes compat with rainbow delimiters
" https://github.com/tpope/vim-obsession/issues/17#issuecomment-229144719

autocmd VimEnter * nested
    \ if !argc() && empty(v:this_session) && filereadable('Session.vim') && !&modified |
    \   source Session.vim |
    \ endif

" === BEGIN COC CONFIG ===

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
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
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
nmap <leader>qf  <Plug>(coc-fix-current)

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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" === END COC SNIPPET CONFIG

" === BEGIN LUA CONFIG ===

if has('nvim')

lua << EOF
    -- === NVIMTREE CONFIG ===
    require('nvim-tree').setup()

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

    -- from https://github.com/nvim-lualine/lualine.nvim/blob/6a40b530539d2209f7dc0492f3681c8c126647ad/lua/lualine/themes/codedark.lua#L4
    local codedark_colors = {
        gray     = '#3C3C3C',
        lightred = '#D16969',
        blue     = '#569CD6',
        pink     = '#C586C0',
        black    = '#262626',
        white    = '#D4D4D4',
        green    = '#608B4E',
    }

    local get_hex = require('cokeline.hlgroups').get_hl_attr

    require('cokeline').setup({
        default_hl = {
            fg = function (buffer)
                return buffer.is_focused and codedark_colors.white or get_hex('Comment', 'fg')
            end,
            bg = function(buffer)
                return buffer.is_focused and codedark_colors.black or codedark_colors.gray
            end
        },

        components = {
            {
                text = function(buffer) return ' ' .. buffer.devicon.icon  end,
                fg = function(buffer) return buffer.devicon.color end,
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
                        return  '󰅚 ' .. buffer.diagnostics.errors .. ' '
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
                    return buffer.is_modified and '' or ''
                end,
                on_click = function(_, _, _, _, buffer)
                    buffer:delete()
                end
            },
            {
                text = ' ',
            },
        }
    })

    -- === GITSIGNS CONFIG ===
    require('gitsigns').setup()

    -- === FZF LUA CONFIG ===
    require('fzf-lua').setup({ 'fzf-vim' })

    -- === LUALINE CONFIG ===
    require('lualine').setup({
        options = {
            theme = 'codedark',
            component_separators = '',
            section_separators = ''
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename', vim.pesc('coc#status'), vim.pesc('b:coc_current_function') },
            lualine_x = { 'ObsessionStatus', 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
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
                spell=true
            }
        },
        on_open = function ()
            vim.fn['peekaboo#off']()
            vim.cmd('PencilSoft')
        end,
        on_close = function ()
            vim.fn['peekaboo#on']()
            vim.cmd('PencilOff')
        end
    })
EOF

endif

" === END LUA CONFIG ===
