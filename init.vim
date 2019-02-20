set nocompatible

runtime platform.vim

if g:platform ==? "linux"
    if g:platform ==? "termux"
        set notermguicolors
    endif

    autocmd VimLeave * set guicursor=a:ver35-blinkon0
    set guicursor=
else
    set termguicolors
endif

set mouse=a

let mapleader="-"
let maplocalleader="-"

set wrap linebreak nolist
set breakindent
set breakindentopt=shift:4

set list
set listchars=trail:·,tab:•\ ,extends:⟩,precedes:⟨
set shortmess=a
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set diffopt=filler,vertical

let g:use_utf8=1

let g:use_autocomplete=0

if g:platform ==? "windows" || g:platform ==? "windows_portable"
    let g:use_autocomplete == 3
    let g:ycm_clang = ' --clang-completer' " or '--clangd-completer' or ''
    let g:ycm_java = ' --java-completer' " or ''
else
    let g:use_autocomplete == 1
    let g:ycm_clang = ''
    let g:ycm_java = ''
endif

let g:use_javacomplete=0

let g:use_comfortable_motion=0

let g:use_python=1
let g:use_async=1
let g:use_airline=1
let g:use_sound=0

if g:platform ==? "windows_portable"
    let g:use_font = 0
else
    let g:use_font = 1
endif

if g:use_utf8 == 1
    set encoding=utf-8
endif

let g:use_deoplete=1
let g:use_pandoc_markdown=1
let g:compile_on_save=0
let g:open_pdf=0
let g:pdf_viewer="sumatrapdf"
let g:pandoc_output="pandoc_output"
let g:pandoc_default="md-to-pdf"
let g:latexmk_use=1
let g:latexmk_clean=1
let g:latex_use_outdir=0
let g:latex_outdir="output"

let g:tex_indent_items=0
let g:tex_items=''

let g:manual_fold_autoload=1

let g:jobs=[]

let g:http_server=''

runtime custom.vim


if g:use_font == 1
    set showbreak=↳
endif

call plug#begin()

" ====================================
" Core ===============================
" ====================================
if g:use_async==1
    Plug 'skywind3000/asyncrun.vim'
endif

if g:use_sound==1
    Plug 'https://github.com/timeyyy/orchestra.nvim.git'
    Plug 'https://github.com/timeyyy/bubbletrouble.symphony.git'
    Plug 'https://github.com/timeyyy/clackclack.symphony'
endif

if g:use_airline==1
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
endif

Plug 'scrooloose/nerdcommenter'

if g:use_comfortable_motion==1
    Plug 'yuttie/comfortable-motion.vim'
endif
" ====================================

" ====================================
" Visualizers ========================
" ====================================
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdtree'
Plug 'DustVoice/vim-indentguides'
" ====================================

" ====================================
" Syntax & Custom indents ============
" ====================================
if g:use_pandoc_markdown==1
    Plug 'vim-pandoc/vim-pandoc-syntax'
endif
Plug 'DustVoice/vim-pandoc'

Plug 'DustVoice/vim-polyglot'

Plug 'DustVoice/vimtex'

Plug 'ARM9/snes-syntax-vim'

Plug 'philj56/vim-asm-indent'
" ====================================

" ====================================
" Git ================================
" ====================================
Plug 'tpope/vim-fugitive'
" ====================================

" ====================================
" Autocompletion =====================
" ====================================
if g:use_autocomplete == 1
    Plug 'ajh17/VimCompletesMe'
elseif g:use_autocomplete == 2
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
elseif g:use_autocomplete == 3
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' . g:ycm_clang . g:ycm_java }
endif

if g:use_javacomplete==1
    Plug 'artur-shaik/vim-javacomplete2'
endif
" ====================================

" ====================================
" Special functionality ==============
" ====================================
if g:use_python==1
    Plug 'dhruvasagar/vim-table-mode'
endif

Plug 'shime/vim-livedown'
" ====================================

" Templating =========================
Plug 'DustVoice/templator_vim'
" ====================================

" ====================================
" Colorscheme ========================
" ====================================
Plug 'DustVoice/snow'
" ====================================

" ====================================
" UNUSED =============================
" ====================================
" Unused alternative indent guides plugin (marks line with bg)
" Plug 'nathanaelkane/vim-indent-guides'

" Unused latex plugins
" Plug 'LaTeX-Box-Team/LaTeX-Box'
" Plug 'xuhdev/vim-latex-live-preview'

" Unused colorschemes
" Plug 'haishanh/night-owl.vim'
" Plug 'BrainDeath0/Hypsteria'
" Plug 'sts10/vim-pink-moon'
" Plug 'edouardp/myob-colorscheme'
" Plug 'kaicataldo/material.vim'
" Plug 'phanviet/vim-monokai-pro'
" Plug 'aradunovic/perun.vim'
" Plug 'jacoborus/tender.vim'
" Plug 'mkarmona/materialbox'
" Plug 'ajmwagar/vim-deus'
" Plug 'rhysd/vim-color-spring-night'
" Plug 'nightsense/carbonized'
" Plug 'nightsense/forgotten'
" Plug 'nightsense/seagrey'
" Plug 'nightsense/vrunchbang'
" Plug 'mhartington/oceanic-next'
" Plug 'rakr/vim-two-firewatch'
" Plug 'zeis/vim-kolor'
" Plug 'sjl/badwolf'
" Plug 'tomasr/molokai'
" Plug 'fmoralesc/molokayo'
" Plug 'junegunn/seoul256.vim'
" Plug 'w0ng/vim-hybrid'
" Plug 'goatslacker/mango.vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'morhetz/gruvbox'
" Plug 'ayu-theme/ayu-vim'
" Plug 'jnurmine/Zenburn'
" Plug 'nanotech/jellybeans.vim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'lifepillar/vim-solarized8'
" Plug 'NLKNguyen/papercolor-theme'
" ====================================

call plug#end()

" ====================================
" Indentguides config ================
" ====================================
let g:indentguides_spacechar = '•'
let g:indentguides_tabchar = '|'
let g:indentguides_firstlevel = 1

" Default indentguides characters
" let g:indentguides_spacechar = '┆'
" let g:indentguides_tabchar = '|'
" ====================================

" ====================================
" When to use 'normal' tabs ==========
" ====================================
autocmd FileType make setlocal noexpandtab
autocmd FileType Makefile setlocal noexpandtab
autocmd FileType .html setlocal noexpandtab
autocmd FileType .css setlocal noexpandtab
autocmd FileType .php setlocal noexpandtab
" ====================================

" ====================================
" indent_guides config ===============
" ====================================
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
" ====================================

" ====================================
" Colorscheme ========================
" ====================================
colorscheme snow
" ====================================

" ====================================
" Function to delete a 'stuck' =======
" swap file for the current buffer ===
" ====================================
" autocmd SwapExists * let v:swapchoice="o"
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
" ====================================

if g:use_comfortable_motion==1
    let g:comfortable_motion_no_default_key_mappings = 1
    let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
    nnoremap <silent> <C-e> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 1)<CR>
    nnoremap <silent> <C-y> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -1)<CR>
    nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
    nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
endif

"set scrolloff=2

function! FullScreenToggle()
    if g:GuiWindowFullScreen==1
        call GuiWindowFullScreen(0)
    else
        call GuiWindowFullScreen(1)
    endif
endfunction

function! MaximizedToggle()
    if g:GuiWindowMaximized==1
        call GuiWindowMaximized(0)
    else
        call GuiWindowMaximized(1)
    endif
endfunction

nnoremap <silent> <F11> :call MaximizedToggle()<CR>
nnoremap <silent> <S-F11> :call FullScreenToggle()<CR>
nnoremap <silent> <F12> <C-w>=


let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"let g:LatexBox_latexmk_async=1

"let g:LatexBox_latexmk_options="-synctex=1 -shell-escape"

"let g:LatexBox_quickfix=2

"let g:LatexBox_viewer="SumatraPDF -reuse-instance"

let g:polyglot_disabled = ['latex']

let g:vimtex_compiler_latexmk = {
            \ 'backend' : 'nvim',
            \ 'background' : 1,
            \ 'build_dir' : '',
            \ 'callback' : 1,
            \ 'continuous' : 0,
            \ 'executable' : 'latexmk',
            \ 'options' : [
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \   '-shell-escape',
            \ ],
            \}

"augroup vimtex_config
"au!
"au User VimtexEventQuit call vimtex#compiler#clean(0)
"augroup END
let g:vimtex_quickfix_mode = 1
let g:vimtex_quickfix_open_on_warning = 0
if g:platform ==? "windows" || g:platform ==? "windows_portable"
    let g:vimtex_view_enabled = 1
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
    let g:vimtex_view_general_options_latexmk = '-reuse-instance'
elseif g:platform ==? "termux"
    let g:vimtex_view_enabled = 1
    let g:vimtex_view_general_viewer = 'termux-open'
else
    let g:vimtex_view_enabled = 0
    let g:vimtex_view_general_viewer = ''
endif

if g:use_pandoc_markdown
    let g:pandoc#syntax#conceal#use = 0
    let g:pandoc#formatting#mode="sa"
    let g:pandoc#formatting#smart_autoformat_on_cursormoved=1
endif

if g:use_javacomplete==1
    autocmd FileType java setlocal omnifunc=javacomplete#Complete
endif
if g:use_deoplete==1
    let g:deoplete#enable_at_startup = 1
endif

if g:use_python == 1
    let g:table_mode_corner_corner='+'
    let g:table_mode_header_fillchar='='
endif

if g:use_airline==1
    " air-line

    let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
        if g:use_font==0
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

    "" unicode symbols
    "let g:airline_left_sep = '»'
    "let g:airline_left_sep = '▶'
    "let g:airline_right_sep = '«'
    "let g:airline_right_sep = '◀'
    "let g:airline_symbols.linenr = '␊'
    "let g:airline_symbols.linenr = '␤'
    "let g:airline_symbols.linenr = '¶'
    "let g:airline_symbols.branch = '⎇'
    "let g:airline_symbols.paste = 'ρ'
    "let g:airline_symbols.paste = 'Þ'
    "let g:airline_symbols.paste = '∥'
    "let g:airline_symbols.whitespace = 'Ξ'
    "" airline symbols
    "let g:airline_left_sep = ''
    "let g:airline_left_alt_sep = ''
    "let g:airline_right_sep = ''
    "let g:airline_right_alt_sep = ''
    "let g:airline_symbols.branch = ''
    "let g:airline_symbols.readonly = ''
    "let g:airline_symbols.linenr = ''

    "let g:airline_theme = "badwolf"
    let g:airline_theme = "deus"
endif

if g:use_sound==1
    call orchestra#prelude()

    call orchestra#set_tune('bubbletrouble')
endif

let g:livedown_autorun = 0

let g:livedown_open = 1

let g:livedown_port = 1337

let g:livedown_browser = "firefox -P livedown"

let g:confirm_new_file = 1

let g:wiki_history = {}

"nmap <S-Enter> Ox<BS><Esc>
"nmap <CR> ox<BS><Esc>
"inoremap <Esc> <Esc>`^

map <leader>n :NERDTreeToggle<CR>

"nmap <Tab> >>
"nmap <Shift+Tab> <<

"vmap <Tab> >>
"vmap <Shift+Tab> <<

" nnoremap o o
" nnoremap O O

nnoremap Q <nop>

nmap <leader>m :LivedownToggle<CR>

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

"nmap <leader>pm :execute "! pandoc " . @% . " --from=markdown -o " . expand('%:r') . ".pdf"<CR>
"nmap <leader>pM :execute "! pandoc --katex --highlight-style=zenburn -t html5 --css=file:///D:/Pandoc/katex_style.css " . @% . " -o " . expand('%:r') . ".pdf"<CR>
"nmap <leader>ph :execute "! pandoc " . @% . " -s --katex --css=file:///D:/Pandoc/katex_style.css -o " . expand('%:r') . ".html"<CR>
"nmap <leader>pl :execute "! pandoc " . @% . " -s -o " . expand('%:r') . ".pdf"<CR>
au BufNewFile,BufRead,BufEnter   *.wiki    setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.md      setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.txt     setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   README    setlocal spell    spelllang=en_us

nmap <leader>pm :call ConvertPandoc("md-to-pdf")<CR><CR>
nmap <leader>pM :call ConvertPandoc("md-html-to-pdf")<CR><CR>
nmap <leader>ph :call ConvertPandoc("md-to-html")<CR><CR>
nmap <leader>pl :call ConvertPandocPdfLatex()<CR><CR>
nmap <leader>pd :call ConvertPandocPdfLatexDebug()<CR>
nmap <leader>pp :AsyncStop<CR>:call OpenPdf()<CR>
nmap <leader>po :AsyncStop<CR>:AsyncRun<Space>sumatrapdf<Space>


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

function! NewLatexTemplate()
    let filename = input('Please specify the filename: ')
    if filename!=""
        let command = "Templator " . expand('%:p:h') . "/latex " . filename
        echom command
        execute(command)
    endif
endfunction

nnoremap <leader>ln :call NewLatexTemplate()<CR>
nnoremap <leader>pn :call NewLatexTemplate()<CR>

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

function! TermuxOpenFile()
    execute("!termux-open " . expand('%'))
endfunction

let g:web_browser = "firefox"
let g:pdf_viewer = "sumatrapdf"
let g:ebook_viewer = "ebook-viewer"

if g:platform ==? "termux"
    let g:web_browser = "termux-open"
    let g:pdf_viewer = "termux-open"
    let g:ebook_viewer = "termux-open"
endif

function! OpenHTML()
    execute("!" . web_browser . " ". expand('%:r') . ".html")
endfunction

function! OpenPdf()
    execute("!" . pdf_viewer . " " . expand('%:r') . ".pdf")
endfunction

function! OpenEpub()
    execute("!" . ebook_viewer . " " . expand('%:r') . ".epub")
endfunction

nmap <leader>oo :call TermuxOpenFile()<CR><CR>
nmap <leader>oh :call OpenHTML()<CR><CR>
nmap <leader>op :call OpenPdf()<CR><CR>
nmap <leader>oe :call OpenEpub()<CR><CR>

nmap <leader>ant i[.lightbox, cols="^2,^2", {LIGHTBOX}]<CR>\|===<CR>\|===<CR><ESC>kk
nmap <leader>ani aimage:./images/picture.jpg[picture, {POPUP}]<ESC>

function! ConvertMarkdownToAsciidoc()
    execute ("%s/\\!\\[\\(.\\{-}\\)\\](\\(.\\{-}\\))/image:\\2[\\1]/gc")
    execute ("%s/\\[\\(.\\{-}\\)\\](\\(.\\{-}\\))/link:\\2[\\1]/gc")
    execute("%s/\\#/=/gc")
    execute("%s/image:\\(.\\{-}\\) ".\\{-}"\\[/image:\\1[/gc")
endfunction


" vimwiki stuff "
" Run multiple wikis "

let g:vimwiki_list = [
            \{'path': "D:/Projects/BrainWiki",
            \ 'syntax': 'markdown', 'ext': '.wiki'}
            \]

"au BufRead,BufNewFile *.wiki set filetype=vimwiki
"function! ToggleCalendar()
"execute ":Calendar"
"if exists("g:calendar_open")
"if g:calendar_open == 1
"execute "q"
"unlet g:calendar_open
"else
"g:calendar_open = 1
"end
"else
"let g:calendar_open = 1
"end
"endfunction
":autocmd FileType vimwiki map c :call ToggleCalendar()

function! GetSelection() range
    echo a:firstline
    echo a:lastline
    let selectedText = getline(a:firstline,a:lastline)
    echo selectedText
    call FilterSelection(join(selectedText))
endfunction

function! FilterSelection(text)
    if a:text =~ ">>>"
        call FileHandler(a:text)
    else
        let text_no_spaces = substitute(a:text, "[ \n]", "", "g")
        call FileHandler(text_no_spaces)
    endif
endfunction

function! BuffersList()
    let all = range(0, bufnr('$'))
    let res = []
    for b in all
        if bufexists(b)
            call add(res, bufname(b))
        endif
    endfor
    return res
endfunction

function! IsInBuffersList(text)
    for b in BuffersList()
        if b =~ a:text
            return 1
        endif
    endfor
    return 0
endfunction

function! FileHandler(text)
    if a:text =~ "(" && a:text =~ ")"
        let filename = matchstr(a:text, '(.\{-})')
        let substituted = matchstr(filename, '[^\(].*[^\)]')
        if substituted =~ ":" || substituted =~ "*" || substituted =~ "?" || substituted =~ "\"" || substituted =~ "<" || substituted =~ ">" || substituted =~ "|"
            echoerr "Your filename contains invalid characters!"
        else
            try
                let confirmed = 1
                let buffer_exists = 0
                if IsInBuffersList(substituted) == 1
                    let buffer_exists = 1
                endif
                if empty(glob(substituted)) && buffer_exists == 0
                    echom "File does not exist"
                    let g:confirm_new_file = 1
                else
                    let g:confirm_new_file = 0
                endif

                echom g:confirm_new_file

                if g:confirm_new_file == 1
                    let val = input('Do you want to create a new file "'. substituted . '" [y]es/[N]o? ')
                    if val !~? '^y'
                        let confirmed = 0
                    else
                        let confirmed = 1
                    endif
                endif

                echom "File exists or is open"
                if confirmed == 1
                    let g:wiki_history[substituted] = expand('%:p')
                    execute('e %:h/' . substituted)
                else
                    echom "You aborted the file creation! please also remove the link from the document!"
                endif
            catch /./
                echoerr 'An error occured during file creation: ' . v:exception
            endtry
        endif
    else
        if a:text =$ "\\$"
            let substituted = substitute(a:text, ".*\\$", "", "g")
            echom substituted
            "let substituted = matchstr(substituted, '[^>>>].*')
            let text_no_spaces = substitute(substituted, "[\n]", "", "g")
            let text_no_spaces = substitute(text_no_spaces, "[ ]", "_", "g")
            if text_no_spaces !~ ".md"
                let text_no_spaces .= ".md"
            endif
            if text_no_spaces =~ ":" || substituted =~ "*" || substituted =~ "?" || substituted =~ "\"" || substituted =~ "<" || substituted =~ ">" || substituted =~ "|"
                echoerr "Your filename contains invalid characters!"
            else
                "call setline(".", "[" . substituted . "](" . substituted . ")")
                "execute("normal! ddO[" . substituted . "](" . text_no_spaces . ")")
                execute("normal! 0f$c$[" . substituted . "](" . text_no_spaces . ")")
                "call FileHandler("(" . text_no_spaces . ")")
            endif
        endif
    endif
endfunction

function! GetLine()
    let currentLine = getline(".")
    call FilterSelection(currentLine)
endfunction

function! GoBackNew()
    echom expand('%:t')
    if has_key(g:wiki_history, expand('%:t'))
        let parent = remove(g:wiki_history, expand('%:t'))
        echom parent
        execute("e " . parent)
    else
        echom "Nothing to go back to!"
    endif
endfunction

function! GoBack()
    execute('e#')
endfunction

command! -range GetSelectionInRange <line1>,<line2>call GetSelection()

nmap <leader><Enter> :silent :call GetLine()<CR>
vmap <leader><Enter> :GetSelectionInRange<CR>

map <leader><BS> :silent :call GoBackNew()<CR>

function! StartHttp()
    if g:http_server != ''
        echom "A server seems to be running already with process id " . g:http_server
        echom "Stopping it first"
        call jobstop(g:http_server)
        echom "Http server with process id " . g:http_server . " stopped"
        let g:http_server=''
    endif
    execute("lcd %:p:h")
    let g:http_server = jobstart("python -m http.server 1224")
    echom "Http server started in directory of the current file with process id " . g:http_server
endfunction

function! StopHttp()
    if g:http_server == ''
        echoerr "There seems to be no server running"
    else
        call jobstop(g:http_server)
        echom "Http server with process id " . g:http_server . " stopped"
        let g:http_server=''
    endif
endfunction

function! ToggleHttp()
    if g:http_server == ''
        execute("lcd %:p:h")
        let g:http_server = jobstart("python -m http.server 1224")
        echom "Http server started in directory of the current file with process id " . g:http_server
    else
        call jobstop(g:http_server)
        echom "Http server with process id " . g:http_server . " stopped"
        let g:http_server=''
    endif
endfunction

command! StartHttp call StartHttp()
command! StopHttp call StopHttp()
command! ToggleHttp call ToggleHttp()

map <leader>s :ToggleHttp<CR>

function! CodeBlock()
    let val = input('Choose your coding language - leave blank for no syntax-highlighting: ')
    execute("normal! S```" . val . "<ESC>o```<ESC>Ox<BS>")
endfunction

function! MakeTable()
    let count = input('How many columns would you like to have? ')
    if count == ""
        return
    endif
    let col_nr = str2nr(count)
    let col_headers = []
    while col_nr > 0
        let val = input('Enter the column heading: ')
        while len(val) < 3
            let val .= " "
        endwhile
        call add(col_headers, val)
        let col_nr -= 1
    endwhile
    let headings = "| "
    let divider = "| "
    let i = 0
    for heading in col_headers
        let headings .= col_headers[i] . " | "
        let j = 0
        let div_tmp = ""
        while j < len(col_headers[i])
            let div_tmp .= "-"
            let j += 1
        endwhile
        let div_tmp .= " | "
        let divider .= div_tmp
        let i += 1
    endfor
    execute("normal! S" . headings)
    execute("normal! o" . divider)
endfunction

inoremap <F9> <ESC>:silent :call CodeBlock()<CR>
nmap <F9> :silent :call CodeBlock()<CR>

" inoremap <F10> <ESC>:silent :call MakeTable()<CR>
" nmap <F10> :silent :call MakeTable()<CR>
inoremap <F10> <ESC>:TableModeToggle<CR>
nmap <F10> <ESC>:TableModeToggle<CR>

function! Heading()
    execute("normal! O[<i class=\"fas fa-backward\" title=\"<--\"></i> Back to the landing page](index.md)")
    execute("normal! o# BrainOdin")
    execute("normal! o")
    execute("normal! j")
endfunction

"inoremap <leader><F11> <ESC>:silent :call Heading()<CR>
nmap <leader><F11> :silent :call Heading()<CR>
map <F4> :set relativenumber!<CR>
nmap <C-7> <leader>c<space>
vmap <C-7> <leader>c<space>

set number
set relativenumber

autocmd BufWinEnter,BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufWinLeave,BufLeave,FocusLost,InsertEnter  * set norelativenumber

"hi LineNr guifg=#B0BEC5
"hi CursorLineNr guifg=#64FFDA

set ignorecase
set smartcase
set backspace=indent,eol,start
set confirm

function! WriteFolds()
    let filename=expand('%:r') . ".fold"
    execute("mkview! " . filename)
endfunction

function! SaveFolds()
    let filename=expand('%:r') . ".fold"
    if filereadable(filename)
        execute("mkview! " . filename)
    endif
endfunction

function! ReadFolds()
    let filename=expand('%:r') . ".fold"
    if filereadable(filename)
        execute("source " . filename)
    endif
endfunction

let g:vimtex_fold_enabled=1
"
"
" ====================================
" General maps                ========
" (at the bottom to overwrite ========
" everything)                 ========
" ====================================
command! W write

set incsearch

set clipboard=unnamedplus

nnoremap <silent> <leader>cd :lcd %:p:h<CR>

tnoremap <Esc> <C-\><C-n>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>+ <C-W>+
nnoremap <leader>- <C-W>-
nnoremap <leader>< <C-W><
nnoremap <leader>> <C-W>>
nnoremap <leader>_ <C-W>_
nnoremap <leader><BAR> <C-W><BAR>
nnoremap <leader>= <C-W>=
nnoremap <leader>T <C-W>T

nnoremap <leader>e :e<Space>
nnoremap <leader>t :tabe<Space>

set splitbelow
set splitright

nmap gB :buffers<CR>
nmap gb :buffer<Space>

nnoremap § `

filetype plugin on
syntax on


nmap <leader>h :noh<CR>

nmap <leader>. :bnext<CR>
nmap <leader>, :bprev<CR>

inoremap <F3>p unique_ptr<><ESC>i
nnoremap <F3>p iunique_ptr<><ESC>i

inoremap <F3>m make_unique<><ESC>i
noremap <F3>m imake_unique<><ESC>i
" ====================================


" ====================================
" Important that this  ===============
" is the last command! ===============
" ====================================
set background=dark
" ====================================


" ====================================
" Deactivated shit ===================
" ====================================
"if g:manual_fold_autoload==1
"set foldmethod=manual
"autocmd BufWinLeave,WinLeave,BufWritePost * call SaveFolds()
"autocmd BufWinEnter * call ReadFolds()
"autocmd InsertLeave,WinEnter * setlocal foldmethod=manual
"autocmd InsertEnter,WinLeave * setlocal foldmethod=manual
"else
"set foldmethod=indent
"set foldlevel=1
""set foldclose=all
"endif

" nmap <leader>fw :call WriteFolds()<CR>
" nmap <leader>fl :source expand('%:r') . ".fold"<CR>

