set encoding=utf-8
set number
set relativenumber
set noswapfile
set scrolloff=7
set colorcolumn=80

set tabstop=4
set smarttab
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

filetype indent on      " load filetype-specific indent files

map A a
map B b
map C c
map D d
map E e
map F f
map G g
map H h
map I i
map J j
map K k
map L l
map M m
map N n
map O o
map P p
map Q q
map R r
map S s
map T t
map U u
map V v
map W w
map X x
map Y y
map Z z


call plug#begin('~/.vim/plugged')
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'fatih/vim-go', { 'for': 'go' }

Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-surround'

Plug 'tc50cal/vim-terminal'

" Telescope 
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'


" Theme
Plug 'sontungexpt/witch'

" Neo tree
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'


call plug#end()


lua << EOF

require("witch").setup{}



vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.fn.sign_define("DiagnosticSignError",
                   {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
                   {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
                   {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
                   {text = "", texthl = "DiagnosticSignHint"})

require("nvim-web-devicons").setup{}

require("neo-tree").setup({})




require('telescope').setup{                                                                     
--  defaults   = {},                                                                            
--  pickers    = {},                                                                            
  extensions = {                                                                                
    fzf = {                                                                                     
      fuzzy = true,                    -- false will only do exact matching                     
      override_generic_sorter = true,  -- override the generic sorter                           
      override_file_sorter = true,     -- override the file sorter                              
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"                    
    }                                                                                           
  }                                                                                             
}                                                                                   
require('telescope').load_extension('fzf')

vim.g.mapleader = " "

-- NeoTree
vim.keymap.set('n', '<leader>e', ':Neotree float float<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')
EOF

" Telescope bindings
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>


" Netrw file explorer settings
let g:netrw_banner = 0 " hide banner above files
let g:netrw_liststyle = 3 " tree instead of plain view
let g:netrw_browse_split = 3 " vertical split window when Enter pressed on file

