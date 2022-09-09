-- ===
-- clang-format
-- ===
if vim.g.use_clang_format == true then
    vim.g['clang_format#detect_style_file'] = 1
    vim.g['clang_format#enable_fallback_style'] = 1

    vim.g['clang_format#style'] = "Microsoft"
    vim.g['clang_format#style_options'] = {
        BasedOnStyle = "Microsoft",
        AccessModifierOffset = -4,
        AlignAfterOpenBracket = "Align",
        AlignConsecutiveAssignments = "false",
        AlignConsecutiveDeclarations = "false",
        AlignEscapedNewlinesLeft = "false",
        AlignOperands = "true",
        AlignTrailingComments = "false",
        AllowAllParametersOfDeclarationOnNextLine = "false",
        AllowShortBlocksOnASingleLine = "false",
        AllowShortCaseLabelsOnASingleLine = "false",
        AllowShortFunctionsOnASingleLine = "All",
        AllowShortifStatementsOnASingleLine = "false",
        AllowShortLoopsOnASingleLine = "false",
        AlwaysBreakAfterDefinitionReturnType = "None",
        AlwaysBreakAfterReturnType = "None",
        AlwaysBreakBeforeMultilineStrings = "false",
        AlwaysBreakTemplateDeclarations = "true",
        BinPackArguments = "false",
        BinPackParameters = "false",
        BreakAfterJavaFieldAnnotations = "false",
        BreakBeforeBinaryOperators = "NonAssignment",
        BreakBeforeBraces = "Allman",
        BreakBeforeTernaryOperators = "true",
        BreakConstructorInitializersBeforeComma = "false",
        BreakStringLiterals = "false",
        ColumnLimit = 0,
        ConstructorInitializerAllOnOneLineOrOnePerLine = "true",
        ConstructorInitializerIndentWidth = 4,
        ContinuationIndentWidth = 4,
        Cpp11BracedListStyle = "false",
        DerivePointerAlignment = "false",
        DisableFormat = "false",
        ExperimentalAutoDetectBinPacking = "false",
        IndentCaseLabels = "true",
        IndentWidth = 4,
        IndentWrappedFunctionNames = "true",
        KeepEmptyLinesAtTheStartOfBlocks = "false",
        Language = "Cpp",
        MaxEmptyLinesToKeep = 1,
        NamespaceIndentation = "Inner",
        PointerAlignment = "Left",
        ReflowComments = "false",
        SortIncludes = "true",
        SpaceAfterCStyleCast = "true",
        SpaceBeforeAssignmentOperators = "true",
        SpaceBeforeParens = "ControlStatements",
        SpaceInEmptyParentheses = "false",
        SpacesInAngles = "false",
        SpacesInCStyleCastParentheses = "false",
        SpacesInContainerLiterals = "true",
        SpacesInParentheses = "false",
        SpacesInSquareBrackets = "false",
        Standard = "Cpp11",
        TabWidth = 4,
        UseTab = "Never"
    }

    vim.g['clang_format#auto_format'] = 1
    vim.g['clang_format#auto_format_on_insert_leave'] = 0

    vim.cmd([[
        autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
        autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
    ]])

    vim.keymap.set('n', '<leader>ct', ':ClangFormatAutoToggle<cr>', { noremap = true })
end
-- ===

-- ===
-- Indentguides config
-- ===
if vim.g.use_indentguides then
    vim.g.indentguides_spacechar = '•'
    vim.g.indentguides_tabchar = '|'
    vim.g.indentguides_firstlevel = 1
end
-- ===

-- ===
-- Comfortable Motion setup
-- ===
if vim.g.use_comfortable_motion == true then
    vim.g.comfortable_motion_no_default_key_mappings = 1
    vim.g.comfortable_motion_impulse_multiplier = 1  -- Feel free to increase/decrease this value.
    vim.keymap.set('n', '<C-e>', ':call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 1)<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-y>', ':call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -1)<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-u>', ':call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<C-d>', ':call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>', { noremap = true, silent = true })
end
-- ===

-- ===
-- Disable polyglot for latex files
-- ===
if vim.g.use_polyglot == true then
    vim.g.vim_markdown_conceal = 0
end
-- ===

-- ===
-- Setup vimtex
-- ===
if vim.g.use_vimtex == true then
    vim.g.polyglot_disabled = { "latex", "tex" }

    vim.g.tex_flavor = "latex"
    --vim.g.vimtex_syntax_packages = { hyperref = { load = 2 }, listings = { load:2 }, luacode = { load = 2 }, minted = {load = 2}}
    vim.g.vimtex_format_enabled = 1
    vim.g.vimtex_indent_enabled = 1

    --let g:vimtex_indent_ignored_envs = ["document"]
    --let g:vimtex_syntax_minted = [{"lang":"text"}, {"lang":"console"}]

    vim.g.vimtex_compiler_enabled = 0
    --let g:vimtex_compiler_latexmk = {"backend":"nvim", "background":1, "build_dir":"", "callback":1, "continuous":1, "executable":"latexmk", "options":["-verbose", "-file-line-error", "-synctex=1", "-interaction=nonstopmode", "-lualatex", "-shell-escape"]}

    --let g:vimtex_quickfix_mode = 1
    --let g:vimtex_quickfix_open_on_warning = 0

    vim.g.vimtex_view_enabled = 0
    vim.g.vimtex_view_general_viewer = ""

    --[[
    if g:platform ==? "windows" || g:platform ==? "windows_portable" then
        "let g:vimtex_view_enabled = 1
        "let g:vimtex_view_general_viewer = 'SumatraPDF'
        "let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
        "let g:vimtex_view_general_options_latexmk = '-reuse-instance'
    "elseif g:platform ==? "termux" then
        "let g:vimtex_view_enabled = 1
        "let g:vimtex_view_general_viewer = 'termux-open'
    "else
        "let g:vimtex_view_enabled = 0
        "let g:vimtex_view_general_viewer = ''
    "end

    "let g:vimtex_fold_enabled=1
    --]]

    vim.cmd('au BufNewFile,BufRead *.cls call execute("set filetype=tex")')
end
-- ===

-- ===
-- Setup javacomplete
-- ===
if vim.g.use_javacomplete == true then
    vim.cmd('autocmd FileType java setlocal omnifunc=javacomplete#Complete')
end
-- ===

-- ===
-- Setup deoplete
-- ===
if vim.g.use_autocomplete == 2 then
    vim.g['deoplete#enable_at_startup'] = true
end
-- ===

-- ===
-- Setup YouCompleteMe
-- ===
if vim.g.use_autocomplete == 3 then
    vim.keymap.set('n', '<leader>ygg', ':YcmCompleter GoToImprecise<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>yg', ':YcmCompleter GoTo<CR>', { noremap = true })

    vim.keymap.set('n', '<leader>ytt', ':YcmCompleter GetTypeImprecise<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>yt', ':YcmCompleter GetType<CR>', { noremap = true })

    vim.keymap.set('n', '<leader>ydd', ':YcmCompleter GetDocImprecise<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>yd', ':YcmCompleter GetDoc<CR>', { noremap = true })

    vim.keymap.set('n', '<leader>yf', ':YcmCompleter FixIt<CR>', { noremap = true })

    vim.keymap.set('n', '<leader>yq', ':YcmDiags<CR>', { noremap = true })

    vim.keymap.set('n', '<leader>yy', ':YcmCompleter<Space>', { noremap = true })

    vim.keymap.set('n', '<leader>yr', ':YcmRestartServer<CR>', { noremap = true })
end
-- ===

-- ===
-- Setup CoC
-- ===
if vim.g.use_coc == true then
    vim.opt.updatetime = 300

    vim.opt.shortmess = vim.opt.shortmess + "c"

    vim.opt.signcolumn = "yes"

    vim.keymap.set('i', '<C-Space>', 'coc#refresh()', { noremap = true })

    vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
    vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })

    vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
    vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
    vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
    vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })

    vim.keymap.set('n', '<silent> K', ':call <SID>show_documentation()<CR>', { noremap = true })

    vim.cmd([[
        function! s:show_documentation()
            if (index(['vim','help'], &filetype) >= 0) then
                execute 'h '.expand('<cword>')
            elseif (coc#rpc#ready()) then
                call CocActionAsync('doHover')
            else
                execute '!' . &keywordprg . " " . expand('<cword>')
            end
        endfunction

        autocmd CursorHold * silent call CocActionAsync('highlight')
    ]])

    vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)')

    vim.keymap.set('x', '<leader>f ', '<Plug>(coc-format-selected)')
    vim.keymap.set('n', '<leader>f ', '<Plug>(coc-format-selected)')

    vim.keymap.set('n', '<leader>ac ', '<Plug>(coc-codeaction)')
    vim.keymap.set('n', '<leader>qf ', '<Plug>(coc-fix-current)')

    vim.cmd([[
        if has('nvim-0.4.0') || has('patch-8.2.0750') then
            nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
            nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
            inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
            inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
            vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
            vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
        end

        command! -nargs=0 Format :call CocAction('format')
        command! -nargs=? Fold :call CocAction('fold', <f-args>)
        command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
    ]])

    vim.keymap.set('n', '<leader>y', ':<C-u>CocList -A --normal yank<CR>', { noremap = true, silent = true })

    vim.g.coc_global_extensions = { "coc-clangd", "coc-cmake", "coc-html", "coc-html-css-support", "coc-java", "coc-json", "coc-lists", "coc-markdownlint", "coc-omnisharp", "coc-prettier", "coc-pyright", "coc-rust-analyzer", "coc-sh", "coc-snippets", "coc-xml", "coc-yank" }
end
-- ===

-- ===
-- Setup fswitch
-- ===
if vim.g.use_fswitch == true then
    vim.keymap.set('n', '<leader>s', ':FSHere<CR>', { noremap = true })
end
-- ===

-- ===
-- Setup python
-- ===
if vim.g.use_python == true then
    vim.g.table_mode_corner_corner = "+"
    vim.g.table_mode_header_fillchar = "="
end
-- ===

-- ===
-- Setup airline
-- ===
if vim.g.use_airline == true then
    vim.g.airline_powerline_fonts = true

    if not vim.g.airline_symbols then
        vim.g.airline_symbols = {}
        if vim.g.use_font == true then
            vim.g.airline_left_sep = ""
            vim.g.airline_right_sep = ""
            vim.g.airline_symbols.linenr = "␊"
            vim.g.airline_symbols.linenr = "␤"
            vim.g.airline_symbols.linenr = "¶"
            vim.g.airline_symbols.branch = "⎇"
            vim.g.airline_symbols.paste = "ρ"
            vim.g.airline_symbols.paste = "Þ"
            vim.g.airline_symbols.paste = "∥"
            vim.g.airline_symbols.whitespace = "Ξ"
        end
    end

    -- ===
    -- unicode symbols
    -- ===
    --[[
    vim.g.airline_left_sep = "»"
    vim.g.airline_left_sep = "▶"
    vim.g.airline_right_sep = "«"
    vim.g.airline_right_sep = "◀"
    vim.g.airline_symbols.linenr = "␊"
    vim.g.airline_symbols.linenr = "␤"
    vim.g.airline_symbols.linenr = "¶"
    vim.g.airline_symbols.branch = "⎇"
    vim.g.airline_symbols.paste = "ρ"
    vim.g.airline_symbols.paste = "Þ"
    vim.g.airline_symbols.paste = "∥"
    vim.g.airline_symbols.whitespace = "Ξ"
    --]]
    -- ===

    -- ===
    -- airline symbols
    -- ===
    --[[
    vim.g.airline_left_sep = ""
    vim.g.airline_left_alt_sep = ""
    vim.g.airline_right_sep = ""
    vim.g.airline_right_alt_sep = ""
    vim.g.airline_symbols.branch = ""
    vim.g.airline_symbols.readonly = ""
    vim.g.airline_symbols.linenr = ""
    --]]
    -- ===

    vim.g.airline_theme = "dracula"
end
-- ===

-- ===
-- Setup sound
-- ===
if vim.g.use_sound == true then
    vim.cmd([[
        call orchestra#prelude()

        call orchestra#set_tune('bubbletrouble')
    ]])
end
-- ===

-- ===
-- Setup livedown
-- ===
if vim.g.use_livedown == true then
    vim.g.livedown_autorun = 0
    vim.g.livedown_open = 1
    vim.g.livedown_port = 1337
    vim.g.livedown_browser = "firefox -P livedown"
    vim.g.confirm_new_file = 1
    vim.g.wiki_history = {}

    vim.keymap.set('n', '<leader>m', ':LivedownToggle<CR>')
end
-- ===

-- ===
-- Setup Nerdtree
-- ===
if vim.g.use_nerdtree == true then
    vim.keymap.set({ 'n', 'v', 'o' }, '<leader>n', ':NERDTreeToggle<CR>', { noremap = true })
end
-- ===

-- ===
-- Setup pandoc
-- ===
if vim.g.use_pandoc == true then
    vim.g['pandoc#syntax#conceal#use'] = 0
    vim.g['pandoc#formatting#mode'] = "sa"
    vim.g['pandoc#formatting#smart_autoformat_on_cursormoved'] = 1

    vim.g.data = {}
    vim.cmd([[
        function! g:JobHandler(job_id, data, event)
            if a:event == 'stdout' || a:event == 'stderr' then
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
    ]])

    vim.g.callbacks = {
        on_stdout = 'function("g:JobHandler")',
        on_stderr = 'function("g:JobHandler")',
        on_exit = 'function("g:JobHandler")'
    }

    vim.g.callbacks_no_out = {
        on_exit = 'function("g:JobHandler")'
    }

    -- function! Stdout(job_id, data, event)
    -- echom 'Job ' . a:job_id . ': >>' . join(a:data)
    -- " echom 'stdout: ' . a:data[0]
    -- endfunction

    --  function! Stderr(job_id, data, event)
    --  	echoerr 'Job ' . a:job_id . ': >>' . join(a:data)
    --  endfunction

    -- function! PrintFinished(job_id, data, event)
    -- echom 'Job ' . a:job_id . ' finished with exit code: ' . string(a:data)
    -- endfunction

    vim.cmd([[
        function! OpenPdf()
            if g:use_async==1 then
                let pdf_path = ""

                if g:latex_use_outdir==1 then
                    let pdf_path = expand('%:r') . "_" . g:latex_outdir . "/" . expand('%:t:r') . ".pdf"
                else
                    let pdf_path = expand('%:r') . ".pdf"
                end

                let pdf_job = jobstart(g:pdf_viewer . " " . pdf_path)
                echom "Started PDF-Viewer with job_id " . pdf_job
                "execute("AsyncRun " . g:pdf_viewer . " " . expand('%:r') . ".pdf")
                let g:open_pdf=0
            else
                execute("!" . g:pdf_viewer. " " . expand('%:r') . ".pdf")
            end
        endfunction

        function! ConvertPandoc(attr)
            let command = ""
            if a:attr == "md-to-pdf" then
                let command = "pandoc -s " . @% . " --from=markdown+escaped_line_breaks -o " . expand('%:r') . ".pdf"
            elseif a:attr == "md-html-to-pdf" then
                let command = "pandoc --katex --highlight-style=zenburn -t html5 --css=file:///D:/Pandoc/katex_style.css " . @% . " -o " . expand('%:r') . ".pdf"
            elseif a:attr == "md-to-html" then
                let command = "pandoc " . @% . " -s --katex --css=file:///D:/Pandoc/katex_style.css -o " . expand('%:r') . ".html"
            elseif a:attr == "latex-to-pdf" then
                let command = "pandoc " . @% . " -s -o " . expand('%:r') . ".pdf"
            end

            " if g:use_async==1 then
            " execute("AsyncRun " . command)
            " else
            "let g:pandoc#command#autoexec_command="call jobstart('pandoc -s " . @% . " --from=markdown -o " . expand('%:r') . ".pdf')"
            if g:use_async==1 then
                " let g:current_job = jobstart('pandoc -s ' . expand('%') . ' --from=markdown -o ' . expand('%:r') . '.pdf', {'out_io': 'buffer', 'out_name': g:pandoc_output})
                " let g:current_job = jobstart(command, {'out_io': 'buffer', 'out_name': g:pandoc_output})
                " let g:current_job = jobstart(command, {'on_stdout': function('Stdout'), 'on_stderr': function('Stdout'), 'on_exit': function('PrintFinished')})
                "
                if len(g:jobs) > 0 then
                    let index = 0
                    while index < len(g:jobs)
                        let item = g:jobs[index]
                        call jobstop(item)
                        let index = index + 1
                    endwhile
                end
                let current_job = jobstart(command, g:callbacks)
                call insert(g:jobs, current_job)
                echom 'Running ' . command . ' with Job-Nr. ' . current_job
            else
                execute("!" . command)
                echom "Compilation finished"
            end
            " end

            if g:open_pdf==1 then
                call OpenPdf() normal <CR>
            end
        endfunction

        function! g:ExitedWithCode(job_id, data, event)
            echom "Job " . a:job_id . " exited with code: " . string(a:data)
        endfunction

        function! ConvertPandocPdfLatexDebug()
            let command = "pandoc " . @% . " -s -o " . expand('%:r') . ".tex"

            let output = ""
            if g:latex_use_outdir==1 then
                let output = "-output-directory=" . expand('%:r') . "_" . g:latex_outdir
            else
                let output = ""
            end

            if g:latexmk_use==1 then
                let pdf_command = "latexmk -pdf -halt-on-error -shell-escape " . output . " " . expand('%:r') . ".tex"
            else
                let pdf_command = "pdflatex -shell-escape " . output . " " . expand('%:r') . ".tex"
            end

            execute("!" . command)
            execute("!" . pdf_command)
        endfunction

        function! ConvertPandocPdfLatex()
            let command = "pandoc " . @% . " -s -o " . expand('%:r') . ".tex"

            let output = ""
            if g:latex_use_outdir==1 then
                let output = "-output-directory=" . expand('%:r') . "_" . g:latex_outdir
            else
                let output = ""
            end

            if g:latexmk_use==1 then
                let pdf_command = "latexmk -pdf -halt-on-error -shell-escape " . output . " " . expand('%:r') . ".tex"
                let pdf_cleanup = "latexmk -c " . output . " " . expand('%:r') . ".tex"
            else
                let pdf_command = "pdflatex -shell-escape " . output . " " . expand('%:r') . ".tex"
            end

            if g:use_async==1 then
                if len(g:jobs) > 0 then
                    let index = 0
                    while index < len(g:jobs)
                        let item = g:jobs[index]
                        call jobstop(item)
                        let index = index + 1
                    endwhile
                end

                let current_job = jobstart(command, g:callbacks)
                call insert(g:jobs, current_job)
                echom 'Running ' . command . ' with Job-Nr. ' . current_job

                call jobwait([current_job], 30000)

                echom "Conversion from " . @% . " to " . expand('%:r') . ".tex finished"

                let current_job = jobstart(pdf_command, g:callbacks_no_out)
                call insert(g:jobs, current_job)
                echom 'Running ' . pdf_command . ' with Job-Nr. ' . current_job

                let result = jobwait([current_job], 120000)

                if result[0]==-1 then
                    echom "Generation of " . expand('%:r') . ".pdf timed out"
                elseif result[0]==-2 then
                    echom "Generation of " . expand('%:r') . ".pdf terminated"
                elseif result[0]==-3 then
                    echom "INVALID JOB-ID: Generation of " . expand('%:r') . ".pdf terminated"
                else
                    echom "Generation of " . expand('%:r') . ".pdf finished"

                    if g:latexmk_use==1 then
                        if g:latexmk_clean==1 then
                            let current_job = jobstart(pdf_cleanup, g:callbacks)
                            call insert(g:jobs, current_job)
                            echom 'Running' . pdf_cleanup . ' with Job-Nr. ' . current_job

                            call jobwait([current_job], 30000)

                            echom "Cleaned up for " . expand('%:r')
                        end
                    end
                end
            else
                execute("!" . command)
                echom "Conversion finished"
                execute("!" . pdf_command)
                echom "Compilation finished"

                if g:latexmk_use==1 then
                    execute("!" . pdf_cleanup)
                    echom "Cleanup finished"
                end
            end
        endfunction

        function! ToggleCompileOnSave()
            if g:compile_on_save == 1 then
                let g:compile_on_save=0
                echom "Compile on save is now turned OFF"
            else
                let g:compile_on_save=1
                echom "Compile on save is now turned ON"
            end
        endfunction

        function! ConvertPandocOnSave(args)
            if g:compile_on_save == 1 then
                call ConvertPandoc(a:args)
                execute "normal \<CR>"
            end
        endfunction
    ]])

    vim.keymap.set('n', '<leader>pm :call', 'ConvertPandoc("md-to-pdf")<CR><CR>', { noremap = true })
    vim.keymap.set('n', '<leader>pM :call', 'ConvertPandoc("md-html-to-pdf")<CR><CR>', { noremap = true })
    vim.keymap.set('n', '<leader>ph :call', 'ConvertPandoc("md-to-html")<CR><CR>', { noremap = true })
    vim.keymap.set('n', '<leader>pl :call', 'ConvertPandocPdfLatex()<CR><CR>', { noremap = true })
    vim.keymap.set('n', '<leader>pd :call', 'ConvertPandocPdfLatexDebug()<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>pp :AsyncStop<CR>:call', 'OpenPdf()<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>po', ':AsyncStop<CR>:AsyncRun<Space>sumatrapdf<Space>', { noremap = true })

    vim.keymap.set('n', '<leader>pc :call', 'ToggleCompileOnSave()<CR>', { noremap = true })

    --vim.cmd('autocmd FileType pandoc autocmd BufWritePost <buffer> call ConvertPandoc(g:pandoc_default) | execute("normal \<CR>")')
    vim.cmd('autocmd FileType pandoc silent autocmd BufWritePost <buffer> silent! call ConvertPandocOnSave(g:pandoc_default')
    --vim.cmd('autocmd FileType tex silent autocmd BufWritePost <buffer> silent! call ConvertPandoc("latex-to-pdf")')
end
-- ===


-- ===
-- Setup latexmk
-- ===
if vim.g.use_latexmk == true then
    vim.cmd([[
        function! ConvertPdfLatexDebug()
            if g:latexmk_use==1 then
                let pdf_command = "latexmk -pdf -halt-on-error -shell-escape " . output . " " . expand('%:r') . ".tex"
            else
                let pdf_command = "pdflatex -shell-escape " . output . " " . expand('%:r') . ".tex"
            end

            execute("!" . command)
            execute("!" . pdf_command)
        endfunction

        function! ConvertPdfLatex()
            let pdf_command = "latexmk -pdf -halt-on-error -shell-escape " . expand('%:r') . ".tex"
            let pdf_cleanup = "latexmk -c " . expand('%:r') . ".tex"

            if len(g:jobs) > 0 then
                let index = 0
                while index < len(g:jobs)
                    let item = g:jobs[index]
                    call jobstop(item)
                    let index = index + 1
                endwhile
            end

            let current_job = jobstart(pdf_command, g:callbacks_no_out)
            call insert(g:jobs, current_job)
            echom 'Running ' . pdf_command . ' with Job-Nr. ' . current_job

            let result = jobwait([current_job], 120000)

            if g:latexmk_clean==1 then
                let current_job = jobstart(pdf_cleanup, g:callbacks)
                call insert(g:jobs, current_job)
                echom 'Running' . pdf_cleanup . ' with Job-Nr. ' . current_job

                call jobwait([current_job], 30000)

                echom "Cleaned up for " . expand('%:r')
            end
        endfunction

        function! CleanLatexDir(full)
            if a:full==0 then
                let clean="c"
            else
                let clean="C"
            end

            let curr_dir = getcwd()
            execute("cd " . expand('%:p:h'))

            "let pdf_cleanup = "latexmk -" . clean . " " . expand('%:r') . ".tex"

            let pdf_cleanup = "latexmk -" . clean

            execute("!" . pdf_cleanup)
            execute("cd " . curr_dir)
        endfunction
    ]])

    --vim.keymap.set('n', '<leader>ll', ':call ConvertPdfLatex()<CR><CR>', { noremap = true })
    --vim.keymap.set('n', '<leader>lL', ':call ConvertPdfLatexDebug()<CR><CR>', { noremap = true })
    vim.keymap.set('n', '<leader>lc', ':call CleanLatexDir(0)<CR><CR>', { noremap = true })
    vim.keymap.set('n', '<leader>lC', ':call CleanLatexDir(1)<CR><CR>', { noremap = true })
    --vim.keymap.set('n', '<localleader>ll', ':call ConvertPdfLatex()<CR><CR>', { noremap = true })
    --vim.keymap.set('n', '<localleader>lL', ':call ConvertPdfLatexDebug()<CR><CR>', { noremap = true })
    --vim.keymap.set('n', '<localleader>lc', ':! latexmk -c<CR><CR>', { noremap = true })
    --vim.keymap.set('n', '<localleader>lC', ':! latexmk -C<CR><CR>', { noremap = true })
end
-- ===

-- ===
-- Setup Asciidoctor
-- ===
if vim.g.use_asciidoctor == true then
    vim.cmd([[
        function! AsciidoctorConvert()
            execute("!asciidoctor " . expand('%'))
        endfunction

        function! AsciidoctorPdfConvert()
            execute("!asciidoctor-pdf " . expand('%'))
        endfunction

        function! AsciidoctorEpubConvert()
            execute("!asciidoctor-epub3 " . expand('%'))
        endfunction
    ]])

    vim.keymap.set('n', '<leader>aa :call', 'AsciidoctorConvert()<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>ap :call', 'AsciidoctorPdfConvert()<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>ae :call', 'AsciidoctorEpubConvert()<CR>', { noremap = true })

    vim.keymap.set('n', '<leader>ant', 'i[.lightbox, cols="^2,^2", {LIGHTBOX}]<CR>\\|===<CR>\\|===<CR><ESC>kk', { noremap = true })
    vim.keymap.set('n', '<leader>ani', 'aimage:./images/picture.jpg[picture, {POPUP}]<ESC>', { noremap = true })
end
-- ===
