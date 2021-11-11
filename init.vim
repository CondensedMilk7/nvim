source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/plug-config/coc.vim

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ghifarit53/tokyonight-vim'
Plug 'neovim/node-host', { 'do': 'npm install -g neovim' }
Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
call plug#end()

set termguicolors

" configure current color scheme
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
" set color scheme
colorscheme tokyonight 
hi Normal ctermbg=none guibg=none
hi EndOfBuffer guibg=NONE ctermbg=NONE
" choose highlight method for vim-hexokinase
let g:Hexokinase_highlighters = [ 'virtual' ]
