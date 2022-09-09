HOME = os.getenv("HOME")

vim.opt.compatible = false

if string.match(vim.opt.shell["_value"], 'fish$') then
    if vim.fn.executable('zsh') then
        vim.opt.shell = "zsh"
        vim.g.replacement_shell = "zsh"
    elseif vim.fn.executable('bash') then
        vim.opt.shell = "bash"
        vim.g.replacement_shell = "bash"
    else
        vim.opt.shell = "sh"
        vim.g.replacement_shell = "sh"
    end
end

-- ===
-- Platform specific settings. Configure your platform in init.lua, in the platform dir.
-- ===
if vim.g.platform == "linux" then
    -- vim.cmd('autocmd VimLeave * set guicursor=a:ver35-blinkon0')
    -- vim.opt.guicursor = ""
    local supported_terminals = {"alacritty", "st-256color", "xterm-256color", "screen", "screen-256color"}

    local function is_supported(tbl, str)
        for _, element in ipairs(tbl) do
            if (element == str) then
                return true
            end
        end
        return false
    end

    if is_supported(supported_terminals, os.getenv("TERM")) and vim.fn['has']("termguicolors") == 1 then
        vim.opt.termguicolors = true
    else
        vim.opt.termguicolors = false

        vim.api.nvim_create_autocmd('ColorScheme', {
            pattern = 'themer_dracula',
            command = 'hi Visual cterm=reverse',
        })
    end
elseif vim.g.platform == "xterm" then
    vim.opt.termguicolors = false
    vim.opt.guicursor = ""
    vim.opt.t_Co = ""
    vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = 'themer_dracula',
        command = 'hi Visual cterm=reverse',
    })
else
    vim.opt.termguicolors = true
end

vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
-- ===

-- ===
-- Deacivate termguicolors on entering the terminal to display the colors correctly
-- ===
vim.api.nvim_create_autocmd('TermEnter', {
    pattern = '*',
    callback = function()
        vim.opt.termguicolors = false
    end,
})
vim.api.nvim_create_autocmd('TermLeave', {
    pattern = '*',
    callback = function()
        vim.opt.termguicolors = true

        if vim.g.replacement_shell ~= nil and vim.fn.executable(vim.g.replacement_shell) then
            vim.opt.shell = vim.g.replacement_shell
        end
    end,
})
-- ===

-- ===
-- Choose the mapleaders, in my case the spacebar.
-- ===
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- ===

-- ===
-- Enable mouse support
-- ===
vim.opt.mouse = "a"
-- ===

-- ===
-- Set basic options
-- ===
vim.cmd([[
    filetype plugin on
    syntax enable
]])

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:4"
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.confirm = true
vim.opt.diffopt = { "filler", "vertical" }
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = { trail = "·", tab = "•\\", extends = "⟩", precedes = "⟨" }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 1
vim.opt.shiftwidth = 4
vim.opt.shortmess = "a"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = true
-- ===

-- ===
-- Set config variables, in order to change options by only modifying these variable values. then
-- Sometimes this can also change the plugins used/needed.
-- ===
local config = {
    http_server = "",

    jobs = {},

    manual_fold_autoload = true,

    tex_indent_items = false,
    tex_items = "",

    use_airline = false,
    use_alt_colorschemes = true,
    use_arm_syntax = true,
    use_asciidoctor = true,
    use_asm_indent = true,
    use_async = true,
    use_autocomplete = 0,
    use_bufkill = true,
    use_buftabline = false,
    use_clang_format = false,
    use_coc = false,
    use_comfortable_motion = false,
    use_cpp = true,
    use_fish = true,
    use_font = false,
    use_fswitch = true,
    use_fugitive = true,
    use_gas = true,
    use_indentguides = false,
    use_javacomplete = false,
    use_latexmk = false,
    use_lualine = true,
    use_lsp = true,
    use_livedown = false,
    use_nerdcommenter = true,
    use_nerdtree = true,
    use_pandoc = false,
    use_polyglot = false,
    use_python = true,
    use_rust = true,
    use_sound = false,
    use_sxhkd = true,
    use_tabline = true,
    use_templator = false,
    use_utf8 = true,
    use_vimtex = true,
    ycm_clang = "",
    ycm_confirm_extra_conf = false,
    ycm_filetype_whitelist = { cpp = 1 },
    ycm_java = ""
}

for key, value in pairs(config) do
    if vim.g[key] == nil then
        vim.g[key] = value
    end
end
-- ===

-- ===
-- Now these settings get applied.
-- ===
if vim.g.use_utf8 == true then
    vim.opt.encoding = "utf-8"
end

if vim.g.use_autocomplete == 3 then
    vim.g.ycm_clang = " --clang-completer" -- or "--clangd-completer" or ""
    vim.g.ycm_java = " --java-completer" -- or ""
end

if vim.g.use_font == true then
    vim.opt.showbreak = "↳"
end
-- ===

-- ===
-- arm-assembly
-- ===
-- vim.cmd([[
--     function! SetupArm()
--         execute('set filetype=arm')
--     endfunction
-- 
--     au BufNewFile,BufRead *.s,*.S call SetupArm() " arm = armv6/7
-- ]])
--
-- Use
-- @ vim:ft=armv5 at top/bottom of assembly file instead
-- ===
-- GNU assembly, use
-- /* vim: ft=gas :
-- */
--
-- at end of file
-- ===

-- ===
-- When to use 'normal' tabs
-- ===
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'make', 'Makefile' },
    callback = function()
        vim.opt_local.expandtab = false
    end,
})
-- ===

-- ===
-- Don't schow relative numbers in insert mode, but show them in normal mode
-- ===
vim.api.nvim_create_autocmd({'BufWinEnter', 'BufEnter', 'FocusGained', 'InsertLeave' }, {
    pattern = '*',
    callback = function()
        vim.opt.relativenumber = true
    end,
})
vim.api.nvim_create_autocmd({'BufWinLeave', 'BufLeave', 'FocusLost', 'InsertEnter' }, {
    pattern = '*',
    callback = function()
        vim.opt.relativenumber = false
    end,
})
-- ===

-- vim.cmd("hi LineNr guifg=#B0BEC5")
-- vim.cmd("hi CursorLineNr guifg=#64FFDA")
