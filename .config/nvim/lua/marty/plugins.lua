return require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'
    use {'morhetz/gruvbox', as = 'gruvbox'}
    use 'fatih/vim-go'
    use 'vim-airline/vim-airline'
    use 'preservim/nerdtree'

    -- lsp plugins
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer' 
    -- cmp plugins
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lua'
end)
