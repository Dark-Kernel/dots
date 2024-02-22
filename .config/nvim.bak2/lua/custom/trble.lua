local status, plug = pcall(require, "Plug")
if (not status) then
  print("Packer is not installed")
  return
end

-- " plugins
-- vim.fn['call plug#begin']()

-- Plug 'https://github.com/L3MON4D3/LuaSnip.git'
-- Plug 'https://github.com/ap/vim-css-color'
-- Plug 'https://github.com/vim-airline/vim-airline'
-- Plug 'https://github.com/preservim/nerdtree' --" sidebar files tree
-- Plug 'https://github.com/tpope/vim-commentary' --" commenting
-- Plug 'https://github.com/tpope/vim-surround' --" surrounding qutoes, tags, etc
-- Plug 'https://github.com/ryanoasis/vim-devicons' --" some dev icons 
-- Plug 'https://github.com/dylanaraps/wal.vim' --" pywal colorscheme
-- Plug 'https://github.com/junegunn/fzf.vim' --" vim fzf 
-- Plug 'hrsh7th/nvim-cmp'
-- Plug 'rafamadriz/friendly-snippets'
-- Plug 'williamboman/mason.nvim'
-- Plug 'neovim/nvim-lspconfig'
-- Plug 'hrsh7th/cmp-buffer'
-- Plug 'hrsh7th/cmp-nvim-lsp'
-- Plug 'https://github.com/hrsh7th/nvim-cmp.git'
-- Plug 'hrsh7th/vim-vsnip'
-- Plug 'nvim-treesitter/nvim-treesitter' 
-- Plug 'shime/vim-livedown'
-- Plug 'iamcco/markdown-preview.nvim'
-- Plug 'https://github.com/ycm-core/YouCompleteMe.git'
-- Plug 'folke/trouble.nvim'

-- call plug#end()")




require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

