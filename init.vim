" ==================== basic attributes ====================

filetype plugin indent on
syntax on
let mapleader=" "
let &t_ut=''
set encoding=utf-8
set showcmd
set autochdir
set number
set relativenumber
set cursorline
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set list
set listchars=tab:\┆\ ,trail:▫
set scrolloff=5
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set textwidth=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw
set visualbell
set updatetime=100
set signcolumn=yes
set virtualedit=block
set backspace=indent,eol,start
set laststatus=2
set wildmenu
set hlsearch
set incsearch
set mouse=

exec "nohlsearch"



" ==================== other useful settings ====================

" ===
" === visual enhancement
" ===
" different modes have different cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" ===
" === function enhancement
" ===
" every time you enter a file, the cursor will return to the previous position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === terminal color
" ===
" use 256-Color（t_Co:terminal Color）
set t_Co=256
" use True-Color
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" turn on nvim's True-Color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1



" ==================== base mapping ====================

" ===
" === basic
" ===
noremap ; :
noremap S :w<CR>
noremap Q :q<CR>
noremap k i
noremap K I
noremap l u


" ===
" === search
" ===
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>


" ===
" === other
" ===
vnoremap Y "+y
inoremap <c-y> <ESC>A<CR>{}<ESC>i<CR><ESC>ko
noremap <silent> <LEADER>o za
noremap ` ~
noremap <C-c> zz
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>"_c4l
noremap <LEADER>sc :set spell!<CR>
noremap <LEADER>sw :set wrap!<CR>



" ==================== cursor movement ====================

" ===
" === normal
" ===
"     ^
"     u
" < n   i >
"     e
"     v
noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l
noremap <silent> U 5k
noremap <silent> E 5j
noremap <silent> N 0
noremap <silent> I $
noremap <silent> gu gk
noremap <silent> ge gj
noremap W 5w
noremap B 5b
noremap h e
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>
noremap <silent> \v v$h


" ===
" === insert
" ===
inoremap <C-a> <ESC>A


" ===
" === command
" ===
" <M>:alt
cnoremap <M-u> <Up>
cnoremap <M-e> <Down>
cnoremap <M-n> <Left>
cnoremap <M-i> <Right>
cnoremap <M-k> <S-Left>
cnoremap <M-a> <S-Right>



" ==================== split screen operations ====================

noremap s <nop>
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>
noremap <LEADER>w <C-w>w
noremap <leader>u <c-w>k
noremap <leader>e <c-w>j
noremap <leader>n <c-w>h
noremap <leader>i <c-w>l
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>
noremap sh <C-w>t<C-w>K
noremap sv <C-w>t<C-w>H
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H
noremap <LEADER>q <C-w>j:q<CR>
noremap qf <C-w>o



" ==================== window operations ====================

noremap tu :tabe<CR>
noremap tU :tab split<CR>
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>



" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term gcc % -o %< && time ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
        exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'racket'
		set splitbelow
		:sp
		:res -5
		term racket %
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc



" ==================== vim-plugins ====================

call plug#begin('$HOME/.config/nvim/plugged')

" make nvim pretty
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'theniceboy/nvim-deus'

" practical plugins
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'

" git
Plug 'lewis6991/gitsigns.nvim'


" enhanced file type highlighting
Plug 'nvim-treesitter/nvim-treesitter'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'dhruvasagar/vim-table-mode'
Plug 'mzlogin/vim-markdown-toc'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" coding
Plug 'preservim/tagbar'
Plug 'luochen1990/rainbow'
Plug 'gcmt/wildfire.vim'

" input method automatic switching
Plug 'lilydjwg/fcitx.vim'

"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()



" ==================== coc-extensions ====================

let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-explorer',
    \ 'coc-translator',
    \ 'coc-diagnostic',
    \ 'coc-syntax',
    \ 'coc-gitignore',
    \ 'coc-import-cost',
    \ 'coc-prettier',
    \ 'coc-lists',
    \ 'coc-snippets',
    \ 'coc-yank',
    \ 'coc-clangd',
    \ 'coc-pyright']



" ==================== coc.nvim-configuration ====================
" ===
" === complete with <TAB> and <CR>
" ===
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


inoremap <silent><expr> <c-o> coc#refresh()


nnoremap <LEADER>h :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

nmap <leader>rn <Plug>(coc-rename)



" ==================== vim-plugins-configuration ====================

" ===
" === vim-airline
" ===
let g:airline_theme='deus'


" ===
" === nvim-deus
" ===
set background=dark
colorscheme deus
let g:deus_termcolors=256


" ===
" === undotree
" ===
nnoremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc


" ===
" === goyo
" ===
noremap <LEADER>gy :Goyo<CR>
let g:goyo_width = 95
let g:goyo_height = 100


" ===
" === rainbow
" ===
let g:rainbow_active = 1


" ===
" === treesitter
" ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
	-- one of "all", "language", or a list of languages
	ensure_installed = {"c", "cpp", "java", "python", "vim", "json", "lua"},
	highlight = {
		enable = true,              -- false will disable the whole extension
		disable = {},  -- list of language that will be disabled
	},
}
EOF



" ===
" === gitsigns
" ===
lua <<EOF
require('gitsigns').setup({
	signs = {
    add          = { hl = 'GitSignsAdd'   , text = '▎', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    change       = { hl = 'GitSignsChange', text = '░', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '▔', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '▒', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
  },
})
EOF
nnoremap H :Gitsigns preview_hunk_inline<CR>
nnoremap <LEADER>gr :Gitsigns reset_hunk<CR>
nnoremap <LEADER>gb :Gitsigns blame_line<CR>
nnoremap <LEADER>g- :Gitsigns prev_hunk<CR>
nnoremap <LEADER>g= :Gitsigns next_hunk<CR>


" ===
" === wildfire
" ===
map <c-b> <Plug>(wildfire-quick-select)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "it"],
    \ "html,xml" : ["at", "it"],
\ }


" ===
" === markdown-preview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_theme = 'light'


" ===
" === vim-mode-table
" ===
noremap <LEADER>tm :TableModeToggle<CR>
let g:table_mode_cell_text_object_i_map = 'k<Bar>'


" ===
" === vim-markdown-toc
" ===
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'


" ===
" === tagbar
" ===
nmap tb :TagbarToggle<CR>


" ==================== coc-extensions-configuration ====================

" ===
" === coc-translator
" ===
nmap ts <Plug>(coc-translator-p)


" ===
" === explorer
" ===
nmap tt :CocCommand explorer<CR>


" ===
" === explorer
" ===
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-n>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
