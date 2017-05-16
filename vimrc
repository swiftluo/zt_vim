" Configuration file for vim
" 关闭vi兼容模式
set nocompatible

" 解决插入模式下delete/backspce键失效问题
set backspace=2

" 关闭modelines
set modelines=0

" 永久显示行号"
set number!

" 开启鼠标定位“
set mouse=a

" 开启语法高亮"
syntax on

" 总是显示状态行
set laststatus=2

" 自动寻找tags文件
set tags=tags;
set autochdir

" 关闭文件类型检测
filetype off
filetype plugin indent on


" jj键映射<ESC> 非递归映射
inoremap jj <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vudlle插件管理                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'


""""""""""""""""""""""""""""""""""""""""""
"               文件树                   "
""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree'
nnoremap tt :exe 'NERDTreeToggle'<CR>
let g:NERDTreeIgnore=['\.pyc','\~$','\.swp']
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree


""""""""""""""""""""""""""""""""""""""""""
"          文件树git状态提示             "
""""""""""""""""""""""""""""""""""""""""""
Plugin 'Xuyuanp/nerdtree-git-plugin'
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '►'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'


""""""""""""""""""""""""""""""""""""""""""
"            airline主题                 "
""""""""""""""""""""""""""""""""""""""""""
Bundle 'altercation/vim-colors-solarized'
Plugin 'vim-airline'
"设置airline主题"
let g:airline_theme='bubblegum'
"显示顶部导航标签"
let g:airline#extensions#tabline#enabled = 1
"正确显示箭头符号"
let g:airline_powerline_fonts = 1


""""""""""""""""""""""""""""""""""""""""""
"            代码自动补全                "
""""""""""""""""""""""""""""""""""""""""""
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


""""""""""""""""""""""""""""""""""""""""""
"            自定义代码块补全            "
""""""""""""""""""""""""""""""""""""""""""
Plugin 'SirVer/ultisnips'
" 代码块集合
Plugin 'honza/vim-snippets'
" 兼容YCM 和 utilsnips
Bundle 'ervandew/supertab'
let g:UltiSnipsSnippetsDir        = $HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsListSnippets='<c-h>'
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1


""""""""""""""""""""""""""""""""""""""""""
"               快捷注释                 "
""""""""""""""""""""""""""""""""""""""""""
Bundle 'scrooloose/nerdcommenter'
" \cc 注释  \cu取消注释
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


""""""""""""""""""""""""""""""""""""""""""
"            异步语法检查                "
""""""""""""""""""""""""""""""""""""""""""
Plugin 'w0rp/ale'
" python 语法检查规则
Plugin 'nvie/vim-flake8'


" html 自动补全 默认展开键<c-y>+逗号
Bundle 'mattn/emmet-vim'


" vim命令模式集成git命令
Plugin 'tpope/vim-fugitive'


" 括号引号自动补全
Bundle 'Raimondi/delimitMate'
" for python docstring ", 特别有用
au FileType python let b:delimitMate_nesting_quotes = ['"']
" 关闭某些类型文件的自动补全
"au FileType mail let b:delimitMate_autoclose = 0


" markdown语法高亮
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


" markdown实时预览
Plugin 'suan/vim-instant-markdown'


" 文件搜索
Bundle 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


" 函数搜索
Bundle 'tacahiroy/ctrlp-funky'
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']


call vundle#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            vudlle----结束                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" <f5> 运行python程序
map <f5> :w<cr>:!python %<cr>

