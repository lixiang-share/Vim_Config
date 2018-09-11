
call plug#begin('~/vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'ludovicchabant/vim-gutentags'
Plug 'aceofall/gtags.vim'
call plug#end()


" {{{{{ Vim常规配置
filetype on " 开启文件类型检测
syntax on " 开启语法高亮
set number " 显示行号
set relativenumber " 显示相对行号（这个非常重要，慢慢体会）
set hlsearch " 搜索结果高亮
set autoindent " 自动缩进
set smartindent " 智能缩进
set tabstop=4 " 设置 tab 制表符所占宽度为 4
set softtabstop=4 " 设置按 tab 时缩进的宽度为 4
set shiftwidth=4 " 设置自动缩进宽度为 4
set expandtab " 缩进时将 tab 制表符转换为空格
set encoding=utf-8
set langmenu=zh_CN
let $LANG = 'en_US.UTF-8'
set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936 " 文件编码
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=r
set guioptions-=b
set t_Co=256
set background=dark
colorscheme gruvbox
set ignorecase smartcase
" }}}}}

" {{{{{ 寄存器相关设置 
set clipboard+=unnamed " 共享剪贴板
" }}}}}


" {{{{{ 按键映射设置
xmap ga <Plug>(EasyAlign)
" }}}}}

" {{{{{ 各类插件设置

" NERDTREE 设置
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set guifont=Consolas:h10

" CtrlP 设置
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 400
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['setting.xml', '.p4ignore']
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" gtags
" cscope
set cscopetag                  " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope'   " 使用 gtags-cscope 代替 cscope


" gtags
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
 


let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
 "gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
 let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

 " 所生成的数据文件的名称
 let g:gutentags_ctags_tagfile = '.tags'

 " 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
  let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
  let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags
" 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
" }}}}}
