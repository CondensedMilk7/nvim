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
Plug 'vim-airline/vim-airline'
Plug 'ghifarit53/tokyonight-vim' " color scheme
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'} " ranger file manager in vim
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " color highlighter
Plug 'https://github.com/leafgarland/typescript-vim' " TS support
Plug 'https://github.com/Quramy/vim-js-pretty-template'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/Shougo/vimproc.vim', {'do' : 'make'}
Plug 'https://github.com/Quramy/tsuquyomi'
Plug 'https://github.com/Valloric/YouCompleteMe'
Plug 'https://github.com/vim-syntastic/syntastic' " Syntax checking
Plug 'https://github.com/bdauria/angular-cli.vim' " Angular CLI for vim
call plug#end()

set termguicolors

" configure current color scheme
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
" set color scheme
colorscheme tokyonight 
hi Normal ctermbg=none guibg=none
hi EndOfBuffer guibg=NONE ctermbg=NONE

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

