source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'sheerun/vim-polyglot' " multiple language support
Plug 'nvim-lualine/lualine.nvim' " statusline
Plug 'kyazdani42/nvim-web-devicons' " icons for statusline
" Plug 'vim-airline/vim-airline' " Airline
Plug 'folke/tokyonight.nvim', { 'branch': 'main' } " color scheme
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'} " ranger file manager in vim
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " color highlighter
Plug 'https://github.com/leafgarland/typescript-vim' " TS support
Plug 'https://github.com/Quramy/vim-js-pretty-template' " JS syntax
Plug 'https://github.com/pangloss/vim-javascript' " JS support
Plug 'https://github.com/Shougo/vimproc.vim', {'do' : 'make'}
Plug 'https://github.com/Quramy/tsuquyomi'
Plug 'https://github.com/Valloric/YouCompleteMe' " Autocomplete
Plug 'https://github.com/vim-syntastic/syntastic' " Syntax checking
Plug 'https://github.com/bdauria/angular-cli.vim' " Angular CLI for vim
Plug 'mattn/emmet-vim' " emmet abbreviations
Plug 'godlygeek/tabular' " Dependency for vim-markdown
Plug 'plasticboy/vim-markdown' " Markdown support
Plug 'junegunn/goyo.vim' " Distraction free writing (for markdown)
"Plug 'reedes/vim-pencil' " Features for writers
call plug#end()

set termguicolors

" configure current color scheme
let g:tokyonight_style = 'night' " available: night, storm

" set color scheme
colorscheme tokyonight 

" Background transparency
"hi Normal ctermbg=none guibg=none
"hi EndOfBuffer guibg=NONE ctermbg=NONE

" Color highlight values
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

" Allow TypeScript plugin to display compilation errors
" in the QuickFix window
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" JavaScript template string syntax support
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces

" Syntax checking config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] 

" Activate angular CLI in nvim if directory contains @angular in node_modules
autocmd VimEnter * if globpath('.,..','node_modules/@angular') != '' | call angular_cli#init() | endif

" Disable folding in markdown by default
let g:vim_markdown_folding_disabled = 1

" Enable vim pencil on specific file types
"set nocompatible
"filetype plugin on       
"
"augroup pencil
"  autocmd!
"  autocmd FileType markdown,mkd call pencil#init()
"  autocmd FileType text         call pencil#init()
"augroup END

" Enable emmet just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Lualine Configuration

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END
