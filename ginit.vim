set nocompatible

if exists('g:neovide')
    if g:use_font==1
        set guifont=Hack:16
    else
        set guifont=Consolas:h14
    endif
else
    GuiTabline 0

    if g:use_font==1
        GuiFont! Hack:h12
        "set guifont=Hack:h16
    else
        GuiFont! Consolas:h14
        "set guifont=Consolas:h14
    endif
endif
