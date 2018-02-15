set nocompatible

" Plug {{{

call plug#begin('~/.vim/bundle')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neco-syntax'
Plug 'SirVer/ultisnips'
Plug 'Valloric/ListToggle'
Plug 'Valloric/MatchTagAlways', {'for': ['html', 'md', 'liquid']}
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
Plug 'bkad/CamelCaseMotion'
Plug 'bronson/vim-visual-star-search'
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'christoomey/vim-sort-motion'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'fszymanski/deoplete-emoji'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'hynek/vim-python-pep8-indent'
Plug 'jalvesaq/Nvim-R', {'for': 'r'}
Plug 'janko-m/vim-test', {'for': 'python'}
Plug 'jgdavey/tslime.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-dirvish'
Plug 'kana/vim-textobj-user'
Plug 'kshenoy/vim-signature'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'machakann/vim-highlightedyank'
Plug 'pgdouyon/vim-evanesco'
Plug 'rbonvall/vim-textobj-latex', {'for': 'tex'}
Plug 'rhysd/github-complete.vim'
Plug 'shime/vim-livedown', {'for': 'markdown'}
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'skywind3000/asyncrun.vim'
Plug 'spacewander/vim-coloresque'
Plug 'tfnico/vim-gradle'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/braceless.vim'
Plug 'tweekmonster/spellrotate.vim'
Plug 'ujihisa/neco-look'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'whatyouhide/vim-textobj-xmlattr', {'for': ['html', 'md', 'liquid']}
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'zchee/deoplete-jedi', {'for': 'python'}

" Always load special fonts last
Plug 'ryanoasis/vim-devicons'

call plug#end()

" }}}

" System {{{

" Enable spell checking
syntax spell toplevel

" Make changes automatically saved during Qdo
set autowrite

" Enable spell checking
set spell spelllang=en_us,en_gb
set mousemodel=popup

" Disable spell checking in source code
au BufNewFile,BufRead,BufEnter *.c    set nospell
au BufNewFile,BufRead,BufEnter *.h    set nospell
au BufNewFile,BufRead,BufEnter *.cpp  set nospell
au BufNewFile,BufRead,BufEnter *.hpp  set nospell
au BufNewFile,BufRead,BufEnter *.java set nospell
au BufNewFile,BufRead,BufEnter *.sh   set nospell
au BufNewFile,BufRead,BufEnter *.xml  set nospell
au BufNewFile,BufRead,BufEnter *.sql  set nospell
au BufNewFile,BufRead,BufEnter *.bib  set nospell

" Disable spell checking in quickfix
augroup quickfix
  autocmd!
  autocmd FileType qf setlocal nospell
augroup END

" Ignore these directories
set wildignore+=*/build/**
set wildignore+=*/.git/*
set wildignore+=*.class
set wildignore+=*/tmp/*

" Set levels for history an undo
set history=1000
set undolevels=1000

" Set persistent undo
set undofile
set undodir=~/.vim/undo

" Source the vimrc file
command! Reload :source $MYVIMRC

" }}}

" Display Improvements {{{

" Display encoding to UTF-8
set encoding=utf-8

" Display italics in terminal
set t_ZH=[3m
set t_ZR=[23m

" Do not display the welcome message
set shortmess=Ic

" Display customized colorscheme
colorscheme orangehybrid

" Display line wraps
command! Wrap set textwidth=120
command! NoWrap set textwidth=0
command! StandardWrap set textwidth=80
set wrap linebreak nolist

" Display of line numbers
set number
set relativenumber

" Display screen redraws faster
set nocursorcolumn
set nocursorline
set ttyfast

" Syntax highlight the first 200 characters
" command! FastSyntax set synmaxcol=200

" Display linebreaks and tabs
set linebreak
set showbreak=━━
set breakindent
set tabstop=4

" Insert spaces for tab
set expandtab
set smarttab
set shiftround

" Display problematic whitespace
set listchars=tab:▸▹,trail:•,extends:#,precedes:#,nbsp:⌻
set list

" Display with faster timeouts in the TUI
set timeoutlen=1000 ttimeoutlen=10

" Display matching parentheses
set showmatch

" Run the matchit macro for tag matching
runtime macros/matchit.vim

" Display indentation
set autoindent
set copyindent
set shiftwidth=2
set smartindent

" Display goes to the next line
set whichwrap+=<,>,h,l,[,]

" Do not display spaces at end of line
set nojoinspaces

" Highlight yanked region
let g:highlightedyank_highlight_duration = 250

" Display the location list and quickfix window
let g:lt_location_list_toggle_map = '<leader>c'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" Display and configure the airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#tabline#buffer_idx_mode = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t:.'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#whitespace#checks = ['indent', 'trailing', 'mixed-indent-file']
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
set laststatus=2

" Create an empty airline_symbols variable
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Define symbols for the airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 'A-Z✔'
let g:airline_symbols.notexists = '  '
let g:airline_symbols.whitespace = 'Ξ'

" Do not display the standard status line
set noshowmode

" Display version control details in gutter
let g:gitgutter_async = 1
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 1
let g:gitgutter_signs = 1

" configure
set signcolumn=yes
set updatetime=1000

" Use a different symbol in the gutter
let g:gitgutter_sign_removed_first_line = '^'

" Configure the display of parentheses matching
let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'jinja' : 1,
      \ 'liquid' : 1,
      \}

" Display the syntax group for the symbol under the cursor
map <F4> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
map <F5> :call SyntaxAttr()<CR>

" }}}

" Folding {{{

function! FancyFoldText()
  let line = getline(v:foldstart)
  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')
  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . ' ' . repeat(" ",fillcharcount-8) . foldedlinecount . ' lines ' . ' '
endfunction
set foldtext=FancyFoldText()

" }}}

" Tags {{{

" Specify where the tags are stored
set tags=./tags;/,tags;/

" Configure tag generation with easytags
let g:easytags_ignored_filetypes = ''
let g:easytags_dynamic_files = 1
let g:easytags_updatetime_warn = 0
let g:easytags_always_enabled = 1
let g:easytags_async = 1

" }}}

" Programming Languages {{{

" Automatically identify the filetype for the plugins
" and always use syntax highlighting
filetype indent plugin on | syn on

" Configure settings for different file types
augroup configurationgroupforfiletypes
  autocmd!

  " Set the completion function for different file types
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType tex set omnifunc=vimtex#complete#omnifunc
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  autocmd FileType gitcommit setlocal omnifunc=github_complete#complete

  " Enable spellcheck for the git commit messages
  autocmd FileType gitcommit setlocal spell

  " Configuration for Java programming filetype
  autocmd Filetype java compiler gradle

  " Configuration for Python programming language
  autocmd Filetype python setlocal softtabstop=4
  autocmd Filetype python setlocal shiftwidth=4
  autocmd FileType python BracelessEnable

  " Force hard wrapping for configuration files
  autocmd FileType conf set formatoptions+=t

  " When linting is costly in Java, only perform it in normal mode
  autocmd Filetype java call SetJavaLintingOptions()
  function! SetJavaLintingOptions()
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_delay = 500
    let g:ale_lint_on_enter = 0
  endfunction

  " When linting is costly in LaTeX, only perform it in normal mode
  autocmd Filetype tex call SetLatexLintingOptions()
  function! SetLatexLintingOptions()
    let g:ale_lint_on_text_changed = 'normal'
    let g:ale_lint_delay = 500
    let g:ale_lint_on_enter = 0
  endfunction

augroup END

" Syntax highlighting for Java
let java_highlight_all=1
let java_highlight_functions=1
let java_highlight_functions=1
let java_highlight_java_lang_ids=1
let java_space_errors=1
let java_comment_strings=1

" Plugin configuration for R
let R_assign = 2
let R_openpdf = 0
let R_show_args = 1

" Force Jedi to use version 3
let g:jedi#force_py_version = 3

" Format Python code according to the PEP8 standard
let g:formatter_yapf_style = 'pep8'

" Indenting for HTML
au BufRead,BufNewFile *.html set filetype=html
let g:html_indent_inctags = 'html,body,head,tbody,div'

" Do not perform folding inside of Markdown
let g:pandoc#modules#disabled = ['folding']

" Preview the Markdown
let g:livedown_autorun = 0
let g:livedown_open = 0
let g:livedown_port = 4200

" Autodetect CSV
autocmd BufRead,BufNewFile *.csv,*.dat set filetype=csv

" Define linting for email
let g:ale_linter_aliases = {'mail': 'tex', 'liquid': 'markdown'}

" }}}

" LaTeX {{{

" Configure vimtex
let g:vimtex_fold_enabled = 0
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_index_show_help = 0
let g:vimtex_view_method = 'mupdf'
let g:vimtex_view_mupdf_options = '-r 288'

" Conceal option
set conceallevel=2
let g:tex_conceal= 'adgms'
hi Conceal ctermbg=NONE ctermfg=172

" Use tex over plaintex
let g:tex_flavor = 'tex'

" Vimtex (and Fzf with YCM) requires
set hidden

" }}}

" Completion {{{

" Define basic completion function
set omnifunc=syntaxcomplete#Complete

" Define the dictionaries
set dictionary-=/usr/share/dict/american-english
set dictionary+=/usr/share/dict/american-english

" Completion includes dictionaries
set complete-=k complete+=k
set complete+=kspell
set complete+=]

" Completion menus
set completeopt=longest,menuone
set wildmenu
set wildmode=longest:full,full

" YCM is used with Vim
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_filetype_blacklist = {
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \}

" YCM uses python (python3 is also an option)
let g:ycm_server_python_interpreter = '/usr/bin/python'

" YCM and Deoplete are compatible with UltiSnips
let g:UltiSnipsExpandTrigger="<C-k>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsListSnippets = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger='<C-s-k>'
let g:UltiSnipsJumpBackwardTrigger=""

" YCM is compatible with the tmux-complete
let g:tmuxcomplete#trigger = 'omnifunc'

" YCM is compatible with the vimtex
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
      \ 're!\\hyperref\[[^]]*',
      \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\(include(only)?|input){[^}]*',
      \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
      \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
      \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
      \ 're!\\usepackage(\s*\[[^]]*\])?\s*\{[^}]*',
      \ 're!\\documentclass(\s*\[[^]]*\])?\s*\{[^}]*',
      \ ]

" YCM will not echo messages (nor will searches)
set noshowmode

" Infer the case when doing completion
set infercase

" }}}

" Basic Keyboard Movement {{{

" Disable the arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap jk <ESC>
inoremap <ESC> <NOP>

" Define the leaders
let maplocalleader=','
let mapleader=','

" Move through CamelCase text
call camelcasemotion#CreateMotionMappings('<leader>')

" Navigate through wrapped text
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Navigate to the next linting warning/error
nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Quickly switch between two recent buffers
function! SwitchBuffer()
  b#
endfunction
nmap <C-u> :call SwitchBuffer()<CR>

" }}}

" Advanced Search Highlighting {{{

" Incrementally highlight the search matches
set incsearch

" Support the highlighting of words
nnoremap <silent><expr> <Leader>i (&hls && v:hlsearch ? ':set nohlsearch' : ':set hlsearch')."\n"

" Carefully ignore the case of words when searching
set ignorecase
set smartcase

" }}}

" Advanced Keyboard Movement with easymotion {{{

" Make f and s movements use easymotion
nmap f <Plug>(easymotion-s)
nmap s <Plug>(easymotion-s2)
nmap <leader>e <Plug>(easymotion-next)
nmap <leader>E <Plug>(easymotion-prev)

" Change the color scheme
hi link EasyMotionTarget Type
hi link EasyMotionShade Comment
hi link EasyMotionIncSearch Type
hi link EasyMotionIncCursor Type
hi link EasyMotionMoveHL Type

" Do not create the shaded background
let g:EasyMotion_do_shade = 0

" Use uppercase letters
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'

" }}}

" Text Manipulation {{{

" Insert a blank line at end of line
nmap oo Ojk

" Insert a blank line at cursor
nnoremap oO i<CR><ESC>

" Support the backspace key in insert mode
set backspace=indent,eol,start

" Interactive EasyAlign in visual mode (e.g., 'vipga')
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g., gaip)
nmap ga <Plug>(EasyAlign)

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Toggle off the auto-completion of pairs
let g:AutoPairsShortcutToggle = '<leader>apt'

" Remove trailing whitespace
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" Fix a misspelling with next-best word
nmap <silent> zn <Plug>(SpellRotateForward)
nmap <silent> zp <Plug>(SpellRotateBackward)
vmap <silent> zn <Plug>(SpellRotateForwardV)
vmap <silent> zp <Plug>(SpellRotateBackwardV)

" Toggle the display of spelling mistakes
nmap <silent> <leader>s :set spell!<CR>

" }}}

" File System {{{

augroup dirvishconfiguration
  autocmd!

  " Disable spell checking for the Dirvish buffers
  autocmd FileType dirvish setlocal nospell

  " Enable :Gstatus and friends
  autocmd FileType dirvish call fugitive#detect(@%)

  " Map `gr` to reload the Dirvish buffer
  autocmd FileType dirvish nnoremap <silent><buffer> gr :<C-U>Dirvish %<CR>

  " Map `gh` to hide dot-prefixed files
  " To toggle this, press `R` to reload
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d<cr>
augroup END

" }}}

" Fugitive {{

" Run Fugitive commands asynchronously using AsyncRun
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" }}}

" FZF {{

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion for words, paths, files, and lines in the buffer
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Define a custom command for loading MRU files with FZF
command! FZFMru call fzf#run({
      \  'source':  v:oldfiles,
      \  'sink':    'e',
      \  'options': '-m -x +s --no-bold --cycle',
      \  'down':    '25%')}

" Load hidden files
command! FZFHidden call fzf#run({
      \  'source':  'ag --hidden --ignore .git -l -g ""',
      \  'sink':    'e',
      \  'options': '-m -x +s --no-bold --cycle',
      \  'down':    '25%'})

" Load non-hidden files
command! FZFMine call fzf#run({
      \  'source':  'ag --ignore .git -l -g ""',
      \  'sink':    'e',
      \  'options': '-m -x +s --no-bold --cycle',
      \  'down':    '25%'})

" Define key combinations
nmap <C-h> :FZFHidden<CR>
nmap <C-p> :FZFMine<CR>
nmap <Space>g :Tags <CR>
nmap <Space>t :BTags <CR>
nmap <Space>b :BLines <CR>
nnoremap <Tab> :Buffers<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" Add in a format string for controlling how FZF git logs
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(blue)%C(bold)%cr"'

" Configure the fzf statusline in Neovim
function! s:fzf_statusline()
  " Define colors for the statusline
  highlight fzf1 ctermfg=110 ctermbg=235
  highlight fzf2 ctermfg=110 ctermbg=235
  highlight fzf3 ctermfg=110 ctermbg=235
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

" Set the colors for the statusline
augroup configurationgroupforfzf
  autocmd! User FzfStatusLine call <SID>fzf_statusline()
augroup END

" }}}

" Tmux {{{

" Send commands to tmux pages
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
let g:tslime_always_current_session = 1

" }}}

" Testing {{{

" Run all/part of a test suite
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

" Run the test suite async and display in quickfix
let test#strategy = "tslime"

" }}}

" Neovim Display and Configuration {{{

" Do not use a different cursor shape
if has("nvim")
  set guicursor=
endif

" Use nvr for remove communication
if has("nvim")
  let g:vimtex_latexmk_progname = 'nvr'
endif

" Leave using a different command than ESC
if has("nvim")
  inoremap <ESC> <C-\><C-n>
  tnoremap jk <C-\><C-n>
  nmap oo O<ESC>
endif

" Use the new inccommand
if has("nvim")
  set inccommand=split
endif

" Set the clipboard to use xclip (not xsel)
if has("nvim")
  let g:clipboard = {
        \   'name': 'NeovimClipboard',
        \   'copy': {
        \      '+': 'xclip -i -selection clipboard',
        \      '*': 'xclip -i -selection clipboard',
        \    },
        \   'paste': {
        \      '+': 'xclip -o -selection clipboard',
        \      '*': 'xclip -o -selection clipboard',
        \   },
        \   'cache_enabled': 1,
        \ }
endif

" Highlight trailing spaces
if has("nvim")
  highlight ExtraWhitespace ctermfg=172 ctermbg=234
  match ExtraWhitespace /\s\+$\|\t/
  augroup extra_whitespace
    autocmd!
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
  augroup END
endif

" Control FZF windows
if has("nvim")
  command! FZFMru call fzf#run({
        \  'source':  v:oldfiles,
        \  'sink':    'e',
        \  'options': '-m -x +s --no-bold --cycle',
        \  'down':    '10%',
        \  'window':  'enew'})
  command! FZFHidden call fzf#run({
        \  'source':  'ag --hidden --ignore .git -l -g ""',
        \  'sink':    'e',
        \  'options': '-m -x +s --no-bold --cycle',
        \  'window':  'enew'})
  command! -bang FZFMine call fzf#run({
        \  'source':  'ag --ignore .git -l -g ""',
        \  'sink':    'e',
        \  'options': '-m -x +s --no-bold --cycle',
        \  'down':    '100%',
        \  'window':  'enew'})
  let g:fzf_layout = { 'window': 'enew' }
endif

" Configure completion with deoplete
if has("nvim")
  " Disable YCM and enable deoplete
  let g:loaded_youcompleteme = 1
  let g:deoplete#enable_at_startup = 0
  let g:deoplete#auto_complete_delay = 1
  let g:deoplete#max_abbr_width = 40
  autocmd InsertEnter * call deoplete#enable()

  " Configure deoplete so that it uses tabs
  let g:SuperTabDefaultCompletionType = "<C-n>"
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

  " Change the source rankings
  call deoplete#custom#set('buffer', 'rank', 500)
  call deoplete#custom#set('tag', 'rank', 400)
  call deoplete#custom#set('ultisnips', 'rank', 300)
  call deoplete#custom#set('tmux', 'rank', 200)
  call deoplete#custom#set('look', 'rank', 100)

  " Register Java's completion function with deoplete
  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.java = [
        \ 'javacomplete#Complete'
        \]

  " Register a GitHub completion function with deoplete
  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.gitcommit = [
        \ 'github_complete#complete'
        \]

  " Configure deoplete to work with LaTeX and vimtex plugin
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif
  let g:deoplete#omni#input_patterns.tex = '\\(?:'
        \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
        \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
        \ . '|hyperref\s*\[[^]]*'
        \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
        \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|usepackage(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|\w*'
        \ .')'

  " Configure deoplete to work with GitHub issue completion
  let g:deoplete#omni#input_patterns.gitcommit = '#[0-9]*'
endif

if has("nvim")
  " disable jedi-vim's completion engine, use all features otherwise
  let g:jedi#auto_vim_configuration = 0
  let g:jedi#completions_enabled = 0
endif

" }}}
