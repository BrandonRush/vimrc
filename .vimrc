  " Some basics:
	set encoding=utf-8      " Unicode set number              " Show lines numbers
	set nocompatible        " Disable compatibility Mmode
  set autoindent          " copy indent from current line when starting a new line
  set autoread            " autoreload the file in Vim if it has been changed outside of Vim
  set background=dark
  set cursorline
  set expandtab           " convert <TAB> key-presses to spaces
  set hlsearch
  set mouse=a             " Enable mouse support
  set nostartofline
  set number
  set relativenumber
  set ruler
  set shiftwidth=2        " set a <TAB> key-press equal to 2 spaces
  set showcmd
  set showmatch
  set showmode
  set smartindent         " even better autoindent (e.g. add indent after '{')
  set spelllang=en
  set splitbelow
  set splitright
  set tabstop=2           " number of spaces per <TAB> 
  set virtualedit=onemore
  set visualbell
  set whichwrap+=<,>,h,l,[,]
  set wildmenu
  set wrap                " Wrap lines
  set wildmode=longest,list,full
  set omnifunc=syntaxcomplete#Complete

  filetype plugin on
	syntax on               
  set t_Co=256
  colorscheme onedark

  " Mappings
  let mapleader = ","
  inoremap jk <C-c>l
  inoremap kj <C-c>l
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
  " noremap <S-l> gt
  " noremap <S-h> gT
  " nmap <silent> n  <Plug>(ale_previous_wrap)
  nmap <silent> m <Plug>(ale_next_wrap)
  cmap w!! w !sudo tee > /dev/null %
  map <silent> <leader>w :w<CR>
  map <silent> <leader>q :q<CR>
  map <silent> <leader>n :noh<CR>


  " Highlighting helper commands
  map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

  nmap <leader>sp :call <SID>SynStack()<CR>
  function! <SID>SynStack()
    if !exists("*synstack")
      return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
  endfunc

  map <leader>sa :so $VIMRUNTIME/syntax/hitest.vim<CR>
  noremap <silent> <leader>re :so ~/.vimrc<CR>

  map <leader>mp :w!<CR>:w!/tmp/vim-markdown.md<CR>:!pandoc -s -f markdown -t html -o /tmp/vim-markdown.html /tmp/vim-markdown.md<CR>:!chromium /tmp/vim-markdown.html > /dev/null 2> /dev/null&<CR><CR>

  " Plugins
  call plug#begin('~/.vim/plugged')

  " Syntax
    Plug 'sheerun/vim-polyglot'
    Plug 'w0rp/ale'
    Plug 'maximbaz/lightline-ale'
    Plug 'alvan/vim-closetag'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    " Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
    Plug 'ajh17/VimCompletesMe'

    " Insertion
    Plug 'jiangmiao/auto-pairs'
    Plug 'mattn/emmet-vim' 
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-unimpaired'
    Plug 'vim-scripts/loremipsum'
    Plug 'ctrlpvim/ctrlp.vim'

    " Formatting
    " Plug 'prettier/vim-prettier', {'do': 'yarn install'}
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } 
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'danro/rename.vim'

    " Selection
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'justinmk/vim-sneak'
    Plug '/usr/bin/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'francoiscabrol/ranger.vim'

    " Interface
    Plug 'itchyny/lightline.vim'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'ap/vim-css-color'
    Plug 'terryma/vim-smooth-scroll'
    Plug 'tomasiser/vim-code-dark'
    Plug 'mkitt/tabline.vim'

    " Nerdtree and Git
    Plug 'scrooloose/nerdtree'
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'airblade/vim-gitgutter'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons' "Must be added last

  call plug#end()

  " Plugin options
  set laststatus=2    " make lightline work correctly
  set noshowmode      " make vim statusline disappear
  set signcolumn="yes" " make signs column always show up"
  set pyxversion=3

  let g:indentLine_char = '┆'

  " Nerdtree
  map <silent> <C-n> :NERDTreeTabsToggle<CR>

  " Custom styling
  set fillchars+=vert:\ 

  let g:NERDTreeFileExtensionHighlightFullName = 1
  let g:NERDTreeExactMatchHighlightFullName = 1
  let g:NERDTreePatternMatchHighlightFullName = 1
  let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
  let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
  let g:NERDTreeLimitedSyntax = 1
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1

  " Prettier config
  " let g:prettier#autoformat = 0
  " autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
  " augroup FiletypeGroup
  "     autocmd!
  "     au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  " augroup END

  let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
  let g:ale_linters = {'jsx': ['stylelint', 'eslint']}

  let g:ale_fixers = {
  \   'javascript': ['prettier'],
  \   'css': ['prettier'],
  \   'json': ['prettier'],
  \   'jsx': ['prettier'],
  \}
  let g:ale_fix_on_save = 1



  " let g:ale_pattern_options = {
  " \   '.*\.js$': {'ale_enabled': 0},
  " \   '.*\.jsx$': {'ale_enabled': 0},
  " \   '.*\.json$': {'ale_enabled': 0}
  " \}



  " Lightline config
  let g:lightline = {}

  let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }

  let g:lightline.component_expand = {
        \  'linter_checking': 'lightline#ale#checking',
        \  'linter_warnings': 'lightline#ale#warnings',
        \  'linter_errors': 'lightline#ale#errors',
        \  'linter_ok': 'lightline#ale#ok',
        \ }

  let g:lightline.component_type = {
        \     'linter_checking': 'left',
        \     'linter_warnings': 'warning',
        \     'linter_errors': 'error',
        \     'linter_ok': 'left',
        \ }

  let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],['charvaluehex','fileformat','fileencoding','filetype','percent','lineinfo']] }

  " Indent Plugin
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_enable_on_vim_startup = 1

  " Auto Close Plugin
  let g:closetag_filenames = '*.js,*,jsx,*.html,*.xhtml,*.phtml'

  " Latex live view
  let g:livepreview_previewer = 'mupdf.inotify'

  " Markdown tables
  let g:table_mode_corner='|'

  " ctrl-p
  let g:ctrlp_show_hidden = 1
  let g:ctrlp_custom_ignore = {
    \ 'dir':  'node_modules',
    \ }
