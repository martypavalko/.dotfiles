return require('packer').startup(function(use)

	use 'wbthomason/packer.nvim'
    use {'morhetz/gruvbox', as = 'gruvbox'}
    use 'fatih/vim-go'
    use 'vim-airline/vim-airline'
    use 'preservim/nerdtree'
    use 'ycm-core/YouCompleteMe'

end)
