set nocompatible

" ===
" Platform specific settings. Configure your platform in platform.vim, in this dir.
" ===
runtime platform.vim

if g:platform ==? "linux"
    "autocmd VimLeave * set guicursor=a:ver35-blinkon0
    "set guicursor=
    let supported_terminals=["alacritty", "st-256color", "xterm-256color", "screen", "screen-256color"]
    if index(supported_terminals, $TERM) != -1 && has("termguicolors")
        set termguicolors
    else
        set notermguicolors

        autocmd ColorScheme dracula hi Visual cterm=reverse
    endif
elseif g:platform ==? "xterm"
    set notermguicolors
    set guicursor=
    set t_Co=
    autocmd ColorScheme dracula hi Visual cterm=reverse
else
    set termguicolors
endif
" ===

" ===
" Choose the mapleaders, in my case the spacebar.
" ===
let mapleader = " "
let maplocalleader = " "
" ===

" ===
" Enable mouse support
" ===
set mouse=a
" ===

" ===
" Set basic options
" ===
filetype plugin on

set autoindent
set autoread
set backspace=indent,eol,start
set breakindent
set breakindentopt=shift:4
set clipboard=unnamedplus
set confirm
set diffopt=filler,vertical
set expandtab
set ignorecase
set incsearch
set linebreak
set list
set listchars=trail:·,tab:•\ ,extends:⟩,precedes:⟨
set number
set relativenumber
set scrolloff=1
set shiftwidth=4
set shortmess=a
set smartcase
set smartindent
set softtabstop=4
set splitbelow
set splitright
set wrap

syntax enable
" ===


" ===
" Set config variables, in order to change options by only modifying these variable values.
" Sometimes this can also change the plugins used/needed.
" ===
let g:http_server = ''

let g:jobs = []

let g:manual_fold_autoload = 1

let g:tex_indent_items = 0
let g:tex_items = ''

let g:use_airline = 1
let g:use_alt_colorschemes = 1
let g:use_arm_syntax = 0
let g:use_asciidoctor = 1
let g:use_asm_indent = 1
let g:use_async = 1
let g:use_autocomplete=1
let g:use_bufkill = 1
let g:use_buftabline = 1
let g:use_clang_format = 0
let g:use_coc = 0
let g:use_comfortable_motion = 0
let g:use_cpp = 1
let g:use_font = 0
let g:use_fswitch = 1
let g:use_fugitive = 1
let g:use_indentguides = 0
let g:use_javacomplete = 0
let g:use_latexmk = 0
let g:use_livedown = 0
let g:use_nerdcommenter = 1
let g:use_nerdtree = 1
let g:use_pandoc = 0
let g:use_polyglot = 0
let g:use_python = 1
let g:use_rust = 1
let g:use_sound = 0
let g:use_sxhkd = 1
let g:use_templator = 0
let g:use_utf8 = 1
let g:use_vimtex = 1
let g:ycm_clang = ''
let g:ycm_confirm_extra_conf = 0
let g:ycm_filetype_whitelist = {'cpp': 1}
let g:ycm_java = ''
" ===

" ===
" As the previous settings should be seen as 'default' settings, we prvoide a
" way to set custom values for these.
" Here we load them.
" ===
runtime custom.vim
" ===

" ===
" Now these settings get applied.
" ===
if g:use_utf8 == 1
    set encoding=utf-8
endif

if g:use_autocomplete == 3
    let g:ycm_clang = ' --clang-completer' " or '--clangd-completer' or ''
    let g:ycm_java = ' --java-completer' " or ''
endif

if g:use_font == 1
    set showbreak=↳
endif
" ===

" ===
" Begin vim-plug section
" ===
call plug#begin()
" ===

" ===
" Core
" ===
if g:use_async == 1
    Plug 'skywind3000/asyncrun.vim'
endif

if g:use_sound == 1
    Plug 'https://github.com/timeyyy/orchestra.nvim.git'
    Plug 'https://github.com/timeyyy/bubbletrouble.symphony.git'
    Plug 'https://github.com/timeyyy/clackclack.symphony'
endif

if g:use_airline == 1
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
endif

if g:use_comfortable_motion == 1
    Plug 'yuttie/comfortable-motion.vim'
endif

if g:use_nerdcommenter == 1
    Plug 'scrooloose/nerdcommenter'
endif
" ===

" ===
" Visualizers
" ===
if g:use_buftabline == 1
    Plug 'ap/vim-buftabline'
endif
if g:use_nerdtree == 1
    Plug 'scrooloose/nerdtree'
endif
if g:use_bufkill == 1
    Plug 'qpkorr/vim-bufkill'
endif
" ===

" ===
" Syntax & Custom indents
" ===
if g:use_pandoc == 1
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'vim-pandoc/vim-pandoc-syntax'
endif

if g:use_indentguides == 1
    Plug 'thaerkh/vim-indentguides'
endif

if g:use_polyglot == 1
    Plug 'sheerun/vim-polyglot'
endif

if g:use_vimtex == 1
    Plug 'lervag/vimtex'
endif

if g:use_arm_syntax == 1
    Plug 'ARM9/arm-syntax-vim'
endif

if g:use_asm_indent == 1
    Plug 'philj56/vim-asm-indent'
endif

if g:use_sxhkd == 1
    Plug 'kovetskiy/sxhkd-vim'
endif

if g:use_clang_format==1
    Plug 'rhysd/vim-clang-format'
endif

if g:use_fswitch == 1
    Plug 'derekwyatt/vim-fswitch'
endif
" ===

" ===
" Git
" ===
if g:use_fugitive == 1
    Plug 'tpope/vim-fugitive'
endif
" ===

" ===
" Autocompletion
" ===
if g:use_autocomplete == 1
    Plug 'DustVoice/VimCompletesMe'
elseif g:use_autocomplete == 2
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
elseif g:use_autocomplete == 3
    Plug 'ycm-core/YouCompleteMe'
endif

if g:use_javacomplete == 1
    Plug 'artur-shaik/vim-javacomplete2'
endif
" ===

" ===
" CoC
" ===
if g:use_coc == 1
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
" ===

" ===
" Rust
" ===
if g:use_rust == 1
    Plug 'rust-lang/rust.vim'
endif
" ===

" ===
" Special functionality
" ===
if g:use_python == 1
    Plug 'dhruvasagar/vim-table-mode'
endif

if g:use_livedown == 1
    Plug 'shime/vim-livedown'
endif
" ===

" ===
" Templating
" ===
if g:use_templator == 1
    Plug 'DustVoice/templator_vim'
endif
" ===

" ===
" Colorscheme
" ===
Plug 'dracula/vim',{'as':'dracula'}
if g:use_alt_colorschemes == 1
    Plug 'ajmwagar/vim-deus'
    Plug 'chriskempson/base16-vim'
endif
" ===

" ===
" End vim-plug section
" ===
call plug#end()
" ===

" ===
" clang-format
" ===
if g:use_clang_format == 1
    let g:clang_format#detect_style_file = 1
    let g:clang_format#enable_fallback_style = 1

    let g:clang_format#style = "Microsoft"
    let g:clang_format#style_options = {
                \ "BasedOnStyle" : "Microsoft",
                \ "AccessModifierOffset" : -4,
                \ "AlignAfterOpenBracket" : "Align",
                \ "AlignConsecutiveAssignments" : "false",
                \ "AlignConsecutiveDeclarations" : "false",
                \ "AlignEscapedNewlinesLeft" : "false",
                \ "AlignOperands" : "true",
                \ "AlignTrailingComments" : "false",
                \ "AllowAllParametersOfDeclarationOnNextLine" : "false",
                \ "AllowShortBlocksOnASingleLine" : "false",
                \ "AllowShortCaseLabelsOnASingleLine" : "false",
                \ "AllowShortFunctionsOnASingleLine" : "All",
                \ "AllowShortIfStatementsOnASingleLine" : "false",
                \ "AllowShortLoopsOnASingleLine" : "false",
                \ "AlwaysBreakAfterDefinitionReturnType" : "None",
                \ "AlwaysBreakAfterReturnType" : "None",
                \ "AlwaysBreakBeforeMultilineStrings" : "false",
                \ "AlwaysBreakTemplateDeclarations" : "true",
                \ "BinPackArguments" : "false",
                \ "BinPackParameters" : "false",
                \ "BreakAfterJavaFieldAnnotations" : "false",
                \ "BreakBeforeBinaryOperators" : "NonAssignment",
                \ "BreakBeforeBraces" : "Allman",
                \ "BreakBeforeTernaryOperators" : "true",
                \ "BreakConstructorInitializersBeforeComma" : "false",
                \ "BreakStringLiterals" : "false",
                \ "ColumnLimit" : 0,
                \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "true",
                \ "ConstructorInitializerIndentWidth" : 4,
                \ "ContinuationIndentWidth" : 4,
                \ "Cpp11BracedListStyle" : "false",
                \ "DerivePointerAlignment" : "false",
                \ "DisableFormat" : "false",
                \ "ExperimentalAutoDetectBinPacking" : "false",
                \ "IndentCaseLabels" : "true",
                \ "IndentWidth" : 4,
                \ "IndentWrappedFunctionNames" : "true",
                \ "KeepEmptyLinesAtTheStartOfBlocks" : "false",
                \ "Language" : "Cpp",
                \ "MaxEmptyLinesToKeep" : 1,
                \ "NamespaceIndentation" : "Inner",
                \ "PointerAlignment" : "Left",
                \ "ReflowComments" : "false",
                \ "SortIncludes" : "true",
                \ "SpaceAfterCStyleCast" : "true",
                \ "SpaceBeforeAssignmentOperators" : "true",
                \ "SpaceBeforeParens" : "ControlStatements",
                \ "SpaceInEmptyParentheses" : "false",
                \ "SpacesInAngles" : "false",
                \ "SpacesInCStyleCastParentheses" : "false",
                \ "SpacesInContainerLiterals" : "true",
                \ "SpacesInParentheses" : "false",
                \ "SpacesInSquareBrackets" : "false",
                \ "Standard" : "Cpp11",
                \ "TabWidth" : 4,
                \ "UseTab" : "Never" }

    let g:clang_format#auto_format = 1
    let g:clang_format#auto_format_on_insert_leave = 0

    autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
    autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

    nmap <Leader>ct :ClangFormatAutoToggle<CR>
endif
" ===

" ===
" arm-assembly
" ===
function! SetupArm()
    execute('set filetype=arm')
endfunction

au BufNewFile,BufRead *.s,*.S call SetupArm() " arm = armv6/7
" ===

" ===
" Indentguides config
" ===
if g:use_indentguides
    let g:indentguides_spacechar = '•'
    let g:indentguides_tabchar = '|'
    let g:indentguides_firstlevel = 1
endif
" ===

" ===
" When to use 'normal' tabs
" ===
autocmd FileType make setlocal noexpandtab
autocmd FileType Makefile setlocal noexpandtab
" ===

" ===
" Colorscheme
" ===
colorscheme dracula
" ===

" ===
" Function to delete a 'stuck'
" swap file for the current buffer
" ===
function! DeleteFileSwaps()
    write
    let l:output = ''
    redir => l:output
    silent exec ':sw'
    redir END
    let l:current_swap_file = substitute(l:output, '\n', '', '')
    let l:base = substitute(l:current_swap_file, '\v\.\w+$', '', '')
    let l:swap_files = split(glob(l:base.'\.s*'))
    " delete all except the current swap file
    for l:swap_file in l:swap_files
        if !empty(glob(l:swap_file)) && l:swap_file != l:current_swap_file
            call delete(l:swap_file)
            echo "swap file removed: ".l:swap_file
        endif
    endfor
    " Reset swap file extension to `.swp`.
    set swf! | set swf!
    echo "Reset swap file extension for file: ".expand('%')
endfunction
command! DeleteFileSwaps :call DeleteFileSwaps()
" ===

" ===
" Comfortable Motion setup
" ===
if g:use_comfortable_motion == 1
    let g:comfortable_motion_no_default_key_mappings = 1
    let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
    nnoremap <silent> <C-e> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 1)<CR>
    nnoremap <silent> <C-y> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -1)<CR>
    nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
    nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
endif
" ===

" ===
" Setup F11/S-F11 for fullscreen/maximize toggle
" ===
function! FullScreenToggle()
    if exists('g:neovide')
        let g:neovide_fullscreen = !g:neovide_fullscreen
    else
        if g:GuiWindowFullScreen==1
            call GuiWindowFullScreen(0)
        else
            call GuiWindowFullScreen(1)
        endif
    endif
endfunction

function! MaximizedToggle()
    if g:GuiWindowMaximized==1
        call GuiWindowMaximized(0)
    else
        call GuiWindowMaximized(1)
    endif
endfunction

if exists('g:neovide')
	nnoremap <silent> <F11> :call FullScreenToggle()<CR>
else
	nnoremap <silent> <F11> :call MaximizedToggle()<CR>
    nnoremap <silent> <S-F11> :call FullScreenToggle()<CR>
endif
" ===

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" ===
" Disable polyglot for latex files
" ===
if g:use_polyglot == 1
    let g:vim_markdown_conceal = 0
endif
" ===

" ===
" Setup vimtex
" ===
if g:use_vimtex == 1
    let g:polyglot_disabled = ['latex', 'tex']

    let g:tex_flavor='latex'
    "let g:vimtex_syntax_packages = {'hyperref':{'load':2}, 'listings':{'load':2}, 'luacode':{'load':2}, 'minted':{'load':2}}
    let g:vimtex_format_enabled = 1
    let g:vimtex_indent_enabled = 1

    "let g:vimtex_indent_ignored_envs = ['document']
    "let g:vimtex_syntax_minted = [{'lang':'text'}, {'lang':'console'}]

    let g:vimtex_compiler_enabled = 0
    "let g:vimtex_compiler_latexmk = {'backend':'nvim', 'background':1, 'build_dir':'', 'callback':1, 'continuous':1, 'executable':'latexmk', 'options':['-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode', '-lualatex', '-shell-escape']}

    "let g:vimtex_quickfix_mode = 1
    "let g:vimtex_quickfix_open_on_warning = 0

    let g:vimtex_view_enabled = 0
    let g:vimtex_view_general_viewer = ''

    "if g:platform ==? "windows" || g:platform ==? "windows_portable"
        "let g:vimtex_view_enabled = 1
        "let g:vimtex_view_general_viewer = 'SumatraPDF'
        "let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
        "let g:vimtex_view_general_options_latexmk = '-reuse-instance'
    "elseif g:platform ==? "termux"
        "let g:vimtex_view_enabled = 1
        "let g:vimtex_view_general_viewer = 'termux-open'
    "else
        "let g:vimtex_view_enabled = 0
        "let g:vimtex_view_general_viewer = ''
    "endif

    "let g:vimtex_fold_enabled=1

    au BufNewFile,BufRead *.cls call execute('set filetype=tex')
" ===
endif
" ===

" ===
" Setup javacomplete
" ===
if g:use_javacomplete==1
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
endif
" ===

" ===
" Setup deoplete
" ===
if g:use_autocomplete==2
    let g:deoplete#enable_at_startup = 1
endif
" ===

" ===
" Setup YouCompleteMe
" ===
if g:use_autocomplete == 3
    nnoremap <leader>ygg :YcmCompleter GoToImprecise<CR>
    nnoremap <leader>yg :YcmCompleter GoTo<CR>

    nnoremap <leader>ytt :YcmCompleter GetTypeImprecise<CR>
    nnoremap <leader>yt :YcmCompleter GetType<CR>

    nnoremap <leader>ydd :YcmCompleter GetDocImprecise<CR>
    nnoremap <leader>yd :YcmCompleter GetDoc<CR>

    nnoremap <leader>yf :YcmCompleter FixIt<CR>

    nnoremap <leader>yq :YcmDiags<CR>

    nnoremap <leader>yy :YcmCompleter<Space>

    nnoremap <leader>yr :YcmRestartServer<CR>
endif
" ===

" ===
" Setup CoC
" ===
if g:use_coc == 1
    set updatetime=300

    set shortmess+=c

    set signcolumn=yes

    inoremap <silent><expr> <C-Space> coc#refresh()

    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
        else
            execute '!' . &keywordprg . " " . expand('<cword>')
        endif
    endfunction

    autocmd CursorHold * silent call CocActionAsync('highlight')

    nmap <leader>rn <Plug>(coc-rename)

    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    nmap <leader>ac  <Plug>(coc-codeaction)
    nmap <leader>qf  <Plug>(coc-fix-current)

    if has('nvim-0.4.0') || has('patch-8.2.0750')
        nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
        inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
        vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
        vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    command! -nargs=0 Format :call CocAction('format')
    command! -nargs=? Fold :call CocAction('fold', <f-args>)
    command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

    nnoremap <silent> <leader>y :<C-u>CocList -A --normal yank<CR>

    let g:coc_global_extensions = ['coc-clangd', 'coc-cmake', 'coc-html', 'coc-html-css-support', 'coc-java', 'coc-json', 'coc-lists', 'coc-markdownlint', 'coc-omnisharp', 'coc-prettier', 'coc-pyright', 'coc-rust-analyzer', 'coc-sh', 'coc-snippets', 'coc-xml', 'coc-yank']
endif
" ===

" ===
" Setup fswitch
" ===
if g:use_fswitch == 1
    nnoremap <leader>s :FSHere<CR>
endif
" ===

" ===
" Setup python
" ===
if g:use_python == 1
    let g:table_mode_corner_corner='+'
    let g:table_mode_header_fillchar='='
endif
" ===

" ===
" Setup airline
" ===
if g:use_airline == 1
    let g:airline_powerline_fonts = 1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
        if g:use_font == 0
            let g:airline_left_sep = ''
            let g:airline_right_sep = ''
            let g:airline_symbols.linenr = '␊'
            let g:airline_symbols.linenr = '␤'
            let g:airline_symbols.linenr = '¶'
            let g:airline_symbols.branch = '⎇'
            let g:airline_symbols.paste = 'ρ'
            let g:airline_symbols.paste = 'Þ'
            let g:airline_symbols.paste = '∥'
            let g:airline_symbols.whitespace = 'Ξ'
        endif
    endif

    " ===
    " unicode symbols
    " ===
    " let g:airline_left_sep = '»'
    " let g:airline_left_sep = '▶'
    " let g:airline_right_sep = '«'
    " let g:airline_right_sep = '◀'
    " let g:airline_symbols.linenr = '␊'
    " let g:airline_symbols.linenr = '␤'
    " let g:airline_symbols.linenr = '¶'
    " let g:airline_symbols.branch = '⎇'
    " let g:airline_symbols.paste = 'ρ'
    " let g:airline_symbols.paste = 'Þ'
    " let g:airline_symbols.paste = '∥'
    " let g:airline_symbols.whitespace = 'Ξ'
    " ===

    " ===
    " airline symbols
    " ===
    " let g:airline_left_sep = ''
    " let g:airline_left_alt_sep = ''
    " let g:airline_right_sep = ''
    " let g:airline_right_alt_sep = ''
    " let g:airline_symbols.branch = ''
    " let g:airline_symbols.readonly = ''
    " let g:airline_symbols.linenr = ''
    " ===

    let g:airline_theme = "dracula"
endif
" ===

" ===
" Setup sound
" ===
if g:use_sound==1
    call orchestra#prelude()

    call orchestra#set_tune('bubbletrouble')
endif
" ===

" ===
" Setup livedown
" ===
if g:use_livedown == 1
    let g:livedown_autorun = 0
    let g:livedown_open = 1
    let g:livedown_port = 1337
    let g:livedown_browser = "firefox -P livedown"
    let g:confirm_new_file = 1
    let g:wiki_history = {}

    nmap <leader>m :LivedownToggle<CR>
endif
" ===

" ===
" Setup Nerdtree
" ===
if g:use_nerdtree == 1
    map <leader>n :NERDTreeToggle<CR>
endif
" ===

" ===
" Setup pandoc
" ===
if g:use_pandoc == 1
    let g:pandoc#syntax#conceal#use = 0
    let g:pandoc#formatting#mode="sa"
    let g:pandoc#formatting#smart_autoformat_on_cursormoved=1

    let g:data = []
    function! g:JobHandler(job_id, data, event)
        if a:event == 'stdout' || a:event == 'stderr'
            echom '>> ' . substitute(join(a:data), "\^M", "\r", "g")
        else
            echom 'Job ' . a:job_id . ' finished'

            let index = 0
            while index < len(g:jobs)
                let item = g:jobs[index]
                if item == a:job_id
                    call remove(g:jobs, index)
                endif
                let index = index + 1
            endwhile

            if string(a:data) != "0"
                echoerr 'Program terminated with exit code ' . string(a:data)
            endif
        endif

        "call append(line('$'), str)
    endfunction

    let g:callbacks = {
                \ 'on_stdout': function('g:JobHandler'),
                \ 'on_stderr': function('g:JobHandler'),
                \ 'on_exit': function('g:JobHandler')
                \ }

    let g:callbacks_no_out = {
                \ 'on_exit': function('g:JobHandler')
                \ }

    "function! Stdout(job_id, data, event)
    "echom 'Job ' . a:job_id . ': >>' . join(a:data)
    "" echom 'stdout: ' . a:data[0]
    "endfunction

    " function! Stderr(job_id, data, event)
    " 	echoerr 'Job ' . a:job_id . ': >>' . join(a:data)
    " endfunction

    "function! PrintFinished(job_id, data, event)
    "echom 'Job ' . a:job_id . ' finished with exit code: ' . string(a:data)
    "endfunction

    function! OpenPdf()
        if g:use_async==1
            let pdf_path = ""

            if g:latex_use_outdir==1
                let pdf_path = expand('%:r') . "_" . g:latex_outdir . "/" . expand('%:t:r') . ".pdf"
            else
                let pdf_path = expand('%:r') . ".pdf"
            endif

            let pdf_job = jobstart(g:pdf_viewer . " " . pdf_path)
            echom "Started PDF-Viewer with job_id " . pdf_job
            "execute("AsyncRun " . g:pdf_viewer . " " . expand('%:r') . ".pdf")
            let g:open_pdf=0
        else
            execute("!" . g:pdf_viewer. " " . expand('%:r') . ".pdf")
        endif
    endfunction

    function! ConvertPandoc(attr)
        let command = ""
        if a:attr == "md-to-pdf"
            let command = "pandoc -s " . @% . " --from=markdown+escaped_line_breaks -o " . expand('%:r') . ".pdf"
        elseif a:attr == "md-html-to-pdf"
            let command = "pandoc --katex --highlight-style=zenburn -t html5 --css=file:///D:/Pandoc/katex_style.css " . @% . " -o " . expand('%:r') . ".pdf"
        elseif a:attr == "md-to-html"
            let command = "pandoc " . @% . " -s --katex --css=file:///D:/Pandoc/katex_style.css -o " . expand('%:r') . ".html"
        elseif a:attr == "latex-to-pdf"
            let command = "pandoc " . @% . " -s -o " . expand('%:r') . ".pdf"
        endif

        " if g:use_async==1
        " execute("AsyncRun " . command)
        " else
        "let g:pandoc#command#autoexec_command="call jobstart('pandoc -s " . @% . " --from=markdown -o " . expand('%:r') . ".pdf')"
        if g:use_async==1
            " let g:current_job = jobstart('pandoc -s ' . expand('%') . ' --from=markdown -o ' . expand('%:r') . '.pdf', {'out_io': 'buffer', 'out_name': g:pandoc_output})
            " let g:current_job = jobstart(command, {'out_io': 'buffer', 'out_name': g:pandoc_output})
            " let g:current_job = jobstart(command, {'on_stdout': function('Stdout'), 'on_stderr': function('Stdout'), 'on_exit': function('PrintFinished')})
            "
            if len(g:jobs) > 0
                let index = 0
                while index < len(g:jobs)
                    let item = g:jobs[index]
                    call jobstop(item)
                    let index = index + 1
                endwhile
            endif
            let current_job = jobstart(command, g:callbacks)
            call insert(g:jobs, current_job)
            echom 'Running ' . command . ' with Job-Nr. ' . current_job
        else
            execute("!" . command)
            echom "Compilation finished"
        endif
        " endif

        if g:open_pdf==1
            call OpenPdf() normal <CR>
        endif
    endfunction

    function! g:ExitedWithCode(job_id, data, event)
        echom "Job " . a:job_id . " exited with code: " . string(a:data)
    endfunction

    function! ConvertPandocPdfLatexDebug()
        let command = "pandoc " . @% . " -s -o " . expand('%:r') . ".tex"

        let output = ""
        if g:latex_use_outdir==1
            let output = "-output-directory=" . expand('%:r') . "_" . g:latex_outdir
        else
            let output = ""
        endif

        if g:latexmk_use==1
            let pdf_command = "latexmk -pdf -halt-on-error -shell-escape " . output . " " . expand('%:r') . ".tex"
        else
            let pdf_command = "pdflatex -shell-escape " . output . " " . expand('%:r') . ".tex"
        endif

        execute("!" . command)
        execute("!" . pdf_command)
    endfunction

    function! ConvertPandocPdfLatex()
        let command = "pandoc " . @% . " -s -o " . expand('%:r') . ".tex"

        let output = ""
        if g:latex_use_outdir==1
            let output = "-output-directory=" . expand('%:r') . "_" . g:latex_outdir
        else
            let output = ""
        endif

        if g:latexmk_use==1
            let pdf_command = "latexmk -pdf -halt-on-error -shell-escape " . output . " " . expand('%:r') . ".tex"
            let pdf_cleanup = "latexmk -c " . output . " " . expand('%:r') . ".tex"
        else
            let pdf_command = "pdflatex -shell-escape " . output . " " . expand('%:r') . ".tex"
        endif

        if g:use_async==1
            if len(g:jobs) > 0
                let index = 0
                while index < len(g:jobs)
                    let item = g:jobs[index]
                    call jobstop(item)
                    let index = index + 1
                endwhile
            endif

            let current_job = jobstart(command, g:callbacks)
            call insert(g:jobs, current_job)
            echom 'Running ' . command . ' with Job-Nr. ' . current_job

            call jobwait([current_job], 30000)

            echom "Conversion from " . @% . " to " . expand('%:r') . ".tex finished"

            let current_job = jobstart(pdf_command, g:callbacks_no_out)
            call insert(g:jobs, current_job)
            echom 'Running ' . pdf_command . ' with Job-Nr. ' . current_job

            let result = jobwait([current_job], 120000)

            if result[0]==-1
                echom "Generation of " . expand('%:r') . ".pdf timed out"
            elseif result[0]==-2
                echom "Generation of " . expand('%:r') . ".pdf terminated"
            elseif result[0]==-3
                echom "INVALID JOB-ID: Generation of " . expand('%:r') . ".pdf terminated"
            else
                echom "Generation of " . expand('%:r') . ".pdf finished"

                if g:latexmk_use==1
                    if g:latexmk_clean==1
                        let current_job = jobstart(pdf_cleanup, g:callbacks)
                        call insert(g:jobs, current_job)
                        echom 'Running' . pdf_cleanup . ' with Job-Nr. ' . current_job

                        call jobwait([current_job], 30000)

                        echom "Cleaned up for " . expand('%:r')
                    endif
                endif
            endif
        else
            execute("!" . command)
            echom "Conversion finished"
            execute("!" . pdf_command)
            echom "Compilation finished"

            if g:latexmk_use==1
                execute("!" . pdf_cleanup)
                echom "Cleanup finished"
            endif
        endif
    endfunction

    nmap <leader>pm :call ConvertPandoc("md-to-pdf")<CR><CR>
    nmap <leader>pM :call ConvertPandoc("md-html-to-pdf")<CR><CR>
    nmap <leader>ph :call ConvertPandoc("md-to-html")<CR><CR>
    nmap <leader>pl :call ConvertPandocPdfLatex()<CR><CR>
    nmap <leader>pd :call ConvertPandocPdfLatexDebug()<CR>
    nmap <leader>pp :AsyncStop<CR>:call OpenPdf()<CR>
    nmap <leader>po :AsyncStop<CR>:AsyncRun<Space>sumatrapdf<Space>

    function! ToggleCompileOnSave()
        if g:compile_on_save == 1
            let g:compile_on_save=0
            echom "Compile on save is now turned OFF"
        else
            let g:compile_on_save=1
            echom "Compile on save is now turned ON"
        endif
    endfunction

    nmap <leader>pc :call ToggleCompileOnSave()<CR>

    function! ConvertPandocOnSave(args)
        if g:compile_on_save == 1
            call ConvertPandoc(a:args)
            execute "normal \<CR>"
        endif
    endfunction

    "autocmd FileType pandoc autocmd BufWritePost <buffer> call ConvertPandoc(g:pandoc_default) | execute("normal \<CR>")
    autocmd FileType pandoc silent autocmd BufWritePost <buffer> silent! call ConvertPandocOnSave(g:pandoc_default)
    " autocmd FileType tex silent autocmd BufWritePost <buffer> silent! call ConvertPandoc("latex-to-pdf")
endif
" ===


" ===
" Setup latexmk
" ===
if g:use_latexmk == 1
    function! ConvertPdfLatexDebug()
        if g:latexmk_use==1
            let pdf_command = "latexmk -pdf -halt-on-error -shell-escape " . output . " " . expand('%:r') . ".tex"
        else
            let pdf_command = "pdflatex -shell-escape " . output . " " . expand('%:r') . ".tex"
        endif

        execute("!" . command)
        execute("!" . pdf_command)
    endfunction

    function! ConvertPdfLatex()
        let pdf_command = "latexmk -pdf -halt-on-error -shell-escape " . expand('%:r') . ".tex"
        let pdf_cleanup = "latexmk -c " . expand('%:r') . ".tex"

        if len(g:jobs) > 0
            let index = 0
            while index < len(g:jobs)
                let item = g:jobs[index]
                call jobstop(item)
                let index = index + 1
            endwhile
        endif

        let current_job = jobstart(pdf_command, g:callbacks_no_out)
        call insert(g:jobs, current_job)
        echom 'Running ' . pdf_command . ' with Job-Nr. ' . current_job

        let result = jobwait([current_job], 120000)

        if g:latexmk_clean==1
            let current_job = jobstart(pdf_cleanup, g:callbacks)
            call insert(g:jobs, current_job)
            echom 'Running' . pdf_cleanup . ' with Job-Nr. ' . current_job

            call jobwait([current_job], 30000)

            echom "Cleaned up for " . expand('%:r')
        endif
    endfunction

    function! CleanLatexDir(full)
        if a:full==0
            let clean="c"
        else
            let clean="C"
        endif

        let curr_dir = getcwd()
        execute("cd " . expand('%:p:h'))

        "let pdf_cleanup = "latexmk -" . clean . " " . expand('%:r') . ".tex"

        let pdf_cleanup = "latexmk -" . clean

        execute("!" . pdf_cleanup)
        execute("cd " . curr_dir)
    endfunction

    "nnoremap <leader>ll :call ConvertPdfLatex()<CR><CR>
    "nnoremap <leader>lL :call ConvertPdfLatexDebug()<CR><CR>
    nnoremap <leader>lc :call CleanLatexDir(0)<CR><CR>
    nnoremap <leader>lC :call CleanLatexDir(1)<CR><CR>
    "nnoremap <localleader>ll :call ConvertPdfLatex()<CR><CR>
    "nnoremap <localleader>lL :call ConvertPdfLatexDebug()<CR><CR>
    "nnoremap <localleader>lc :! latexmk -c<CR><CR>
    "nnoremap <localleader>lC :! latexmk -C<CR><CR>
endif
" ===

" ===
" Setup Asciidoctor
" ===
if g:use_asciidoctor == 1
    function! AsciidoctorConvert()
        execute("!asciidoctor " . expand('%'))
    endfunction
    function! AsciidoctorPdfConvert()
        execute("!asciidoctor-pdf " . expand('%'))
    endfunction
    function! AsciidoctorEpubConvert()
        execute("!asciidoctor-epub3 " . expand('%'))
    endfunction

    nmap <leader>aa :call AsciidoctorConvert()<CR>
    nmap <leader>ap :call AsciidoctorPdfConvert()<CR>
    nmap <leader>ae :call AsciidoctorEpubConvert()<CR>

    nmap <leader>ant i[.lightbox, cols="^2,^2", {LIGHTBOX}]<CR>\|===<CR>\|===<CR><ESC>kk
    nmap <leader>ani aimage:./images/picture.jpg[picture, {POPUP}]<ESC>
endif
" ===

" ===
" Don't schow relative numbers in insert mode, but show them in normal mode
" ===
autocmd BufWinEnter,BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufWinLeave,BufLeave,FocusLost,InsertEnter  * set norelativenumber
" ===

"hi LineNr guifg=#B0BEC5
"hi CursorLineNr guifg=#64FFDA

" ===
" General maps (at the bottom to overwrite everything)
" ===
nnoremap <silent> <leader>cd :cd %:p:h<CR>
nnoremap <silent> <leader>lcd :lcd %:p:h<CR>

tnoremap <Esc> <C-\><C-n>

nnoremap <leader>+ <C-W>+
nnoremap <leader>- <C-W>-
nnoremap <leader>< <C-W><
nnoremap <leader>> <C-W>>
nnoremap <leader>_ <C-W>_
nnoremap <leader><BAR> <C-W><BAR>
nnoremap <leader>= <C-W>=
nnoremap <leader>T <C-W>T

nmap <leader>h :noh<CR>

nmap <leader>. :bnext<CR>
nmap <leader>, :bprev<CR>
" ===

" ===
" Setup C++ specific stuff
" ===
if g:use_cpp == 1
    function! CPP_Include_Guard()
        let guard_name = input("Please input the guard name:\n")
        if guard_name != ""
            execute("normal! mZ")
            execute("normal! gg")
            if getline(".") =~ "\."
                execute("normal! O")
            endif
            execute("normal! O#ifndef " . guard_name)
            execute("normal! o#define " . guard_name)
            execute("normal! G")
            if getline(".") =~ "\."
                execute("normal! o")
            endif
            execute("normal! o#endif // " . guard_name)
            execute("normal! `Z")
        endif
    endfunction

    function! CPP_Comment_File()
        let file_desc = input("Please input a short file description:\n")
        if file_desc != ""
            let class_name = input("Please input a class name or leave empty:\n")
            execute("normal! mZ")
            execute("normal! O/**")
            execute("normal! o")
            execute("normal! S	@file " . expand("%:t"))
            execute("normal! o@author DustVoice")
            execute("normal! o")
            if class_name != ""
                execute("normal! o@class " . class_name)
                execute("normal! o")
            endif
            execute("normal! o" . file_desc)
            execute("normal! o*/")
            execute("normal! <<")
            execute("normal! `Z")
        endif
    endfunction

    function! CPP_Comment_Method()
        let func_desc = input("Please input a short function description:\n")
        if func_desc != ""
            execute("normal! O/**")
            execute("normal! o")
            execute("normal! S	" . func_desc)
            execute("normal! o*/")
            execute("normal! <<")
            execute("normal! k$")
        endif
    endfunction

    command! CppIncludeGuard :call CPP_Include_Guard()
    command! CppCommentFile :call CPP_Comment_File()
    command! CppCommentMethod :call CPP_Comment_Method()

    let b:current_syntax = "custom"

    syntax keyword cppCustomNamespace juce
    syntax keyword cppCustomNamespace PDFHummus

    hi def link cppCustomNamespace Constant
endif
" ===

" ===
" Background
" ===
nmap <leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" ===
