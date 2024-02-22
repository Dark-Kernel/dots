
" lua require('lua.mine.completion')
" lua require('lua.mine.lsp_config')
require("mine")
"lua require('lua.custom.trble')

" Move line up and down.
nnoremap K :m .-2<CR>==
nnoremap J :m .+2<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+2<CR>gv=gv

" buffer keymaps 
nnoremap tk :bnext<CR>
nnoremap tj :bprev<CR>

"nmap gm :LivedownToggle<CR>

" set number 		  " For line number in vim 
set number relativenumber  " For hybrid numbering
set tabstop=4             " How many spaces to enter for each tab
syntax on 
"colorscheme delek
set incsearch  " Search as you type
set shiftwidth=2  " How many spaces to indent code blocks
filetype on " detect file type
filetype indent on " indentation according to file type
set mouse=a
set hlsearch              " Highlight matches while searching
set background=dark       " Turn dark mode on
hi clear CursorLine
augroup CLClear
  autocmd! ColorScheme * hi clear CursorLine
augroup END
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey
set cursorline
" set clipboard=unnamedplus
vmap <C-c> "+y
set completeopt-=preview 

" Show status line
"set laststatus=2
"set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
set showcmd
" Don’t keep results highlighted after searching...
set nohlsearch
" ...just highlight as we type
"


" plugins
call plug#begin()

Plug 'https://github.com/L3MON4D3/LuaSnip.git'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree' " sidebar files tree
Plug 'https://github.com/tpope/vim-commentary' " commenting
Plug 'https://github.com/tpope/vim-surround' " surrounding qutoes, tags, etc
Plug 'https://github.com/ryanoasis/vim-devicons' " some dev icons 
Plug 'https://github.com/dylanaraps/wal.vim' " pywal colorscheme
Plug 'https://github.com/junegunn/fzf.vim' " vim fzf 
Plug 'hrsh7th/nvim-cmp'
Plug 'rafamadriz/friendly-snippets'
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'https://github.com/hrsh7th/nvim-cmp.git'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-treesitter/nvim-treesitter' 
Plug 'shime/vim-livedown'
Plug 'iamcco/markdown-preview.nvim'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'folke/trouble.nvim'

call plug#end()


" MD preview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'qutebrowser'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
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
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']



" tabedit

"set stal=2
"set showtabline=1
"highlight link TabNum Special
"nnoremap <C-i> :tabnext<CR>
"map <S-Tab> gt
"set guitablabel=\[%N\]\ %t\ %M


" Airline 

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='wal'


" vim-terminal
nnoremap <C-l> :TerminalSplit zsh<CR>



" Autocompletion

"inoremap <expr><TAB> coc#pum#visible() ? coc#_select_confirm() : "<Tab>"
" inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"


" Vim fzf 

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nnoremap <C-f> :Files ./<CR>


" NerdTree -

let g:NERDSpaceDelims = 1 
let g:NERDTreeWinSize=get(g:,'NERDTreeWinSize', 25)
let g:NERDTreeChDirMode=get(g:,'NERDTreeChDirMode',1)
let g:NERDTreeShowHidden =1 
"let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


" 
" Autocompletion	

lua << EOF

local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-bb>'] = cmp.mapping.scroll_docs(4),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<TAB>'] = cmp.mapping.confirm({ select = true }),
    }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  }),
})

EOF

" g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
let g:neovide_transparency = 0.0
let g:transparency = 70.8
let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))


 
" telescope 
" nnoremap ff <cmd>Telescope find_files<cr>
" nnoremap fg <cmd>Telescope live_grep<cr>
" lua require('core.telescope')
" set TelescopeColor = wal





