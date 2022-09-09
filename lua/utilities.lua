-- ===
-- Function to delete a 'stuck'
-- swap file for the current buffer
-- ===
vim.cmd([[
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
            if !empty(glob(l:swap_file)) && l:swap_file != l:current_swap_file then
                call delete(l:swap_file)
                echo "swap file removed: ".l:swap_file
            end
        endfor
        " Reset swap file extension to `.swp`.
        set swf! | set swf!
        echo "Reset swap file extension for file: ".expand('%')
    endfunction
    command! DeleteFileSwaps :call DeleteFileSwaps()
]])
-- ===

-- ===
-- Setup F11/S-F11 for fullscreen/maximize toggle
-- ===
vim.cmd([[
    function! FullScreenToggle()
        if exists('g:neovide') then
            let g:neovide_fullscreen = !g:neovide_fullscreen
        else
            if g:GuiWindowFullScreen==1 then
                call GuiWindowFullScreen(0)
            else
                call GuiWindowFullScreen(1)
            end
        end
    endfunction

    function! MaximizedToggle()
        if g:GuiWindowMaximized==1 then
            call GuiWindowMaximized(0)
        else
            call GuiWindowMaximized(1)
        end
    endfunction
]])

if vim.g.neovide then
    vim.keymap.set('n', '<F11>', ':call FullScreenToggle()<CR>', { noremap = true, silent = true })
else
    vim.keymap.set('n', '<F11>', ':call MaximizedToggle()<CR>', { noremap = true, silent = true })
    vim.keymap.set('n', '<S-F11>', ':call FullScreenToggle()<CR>', { noremap = true, silent = true })
end
-- ===

-- ===
-- Setup C++ specific stuff then
-- ===
if vim.g.use_cpp == true then
    vim.cmd([[
        function! CPP_Include_Guard()
            let guard_name = input("Please input the guard name:\n")
            if guard_name != "" then
                execute("normal! mZ")
                execute("normal! gg")
                if getline(".") =~ "\." then
                    execute("normal! O")
                end
                execute("normal! O#ifndef " . guard_name) then
                execute("normal! o#define " . guard_name)
                execute("normal! G")
                if getline(".") =~ "\." then
                    execute("normal! o")
                end
                execute("normal! o#end // " . guard_name)
                execute("normal! `Z")
            end
        endfunction

        function! CPP_Comment_File()
            let file_desc = input("Please input a short file description:\n")
            if file_desc != "" then
                let class_name = input("Please input a class name or leave empty:\n")
                execute("normal! mZ")
                execute("normal! O/**")
                execute("normal! o")
                execute("normal! S	@file " . expand("%:t"))
                execute("normal! o@author DustVoice")
                execute("normal! o")
                if class_name != "" then
                    execute("normal! o@class " . class_name)
                    execute("normal! o")
                end
                execute("normal! o" . file_desc)
                execute("normal! o*/")
                execute("normal! <<")
                execute("normal! `Z")
            end
        endfunction

        function! CPP_Comment_Method()
            let func_desc = input("Please input a short function description:\n")
            if func_desc != "" then
                execute("normal! O/**")
                execute("normal! o")
                execute("normal! S	" . func_desc)
                execute("normal! o*/")
                execute("normal! <<")
                execute("normal! k$")
            end
        endfunction

        command! CppIncludeGuard :call CPP_Include_Guard()
        command! CppCommentFile :call CPP_Comment_File()
        command! CppCommentMethod :call CPP_Comment_Method()

        let b:current_syntax = "custom"

        syntax keyword cppCustomNamespace juce
        syntax keyword cppCustomNamespace PDFHummus

        hi def link cppCustomNamespace Constant
    ]])
end
-- ===

-- ===
-- Function to show current syntax highlight groups
-- ===
vim.cmd([[
    function! SynGroup()
        let l:s = synID(line('.'), col('.'), 1)

        echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    endfunction

    command! SynGroup :call SynGroup()

    function! SynStack()
        if !exists("*synstack")
            return
        endif

        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunction

    command! SynStack :call SynStack()
]])
-- ===

-- ===
-- Switch to fish shell in :term
-- ===
vim.cmd([[
    function! FishTerm()
        if exists("g:replacement_shell")
            let &shell = "fish"
            execute "term"
            let &shell = g:replacement_shell
        endif
    endfunction

    command! FishTerm :call FishTerm()
]])
