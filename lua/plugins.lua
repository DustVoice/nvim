-- vim.cmd([[
--     augroup packer_user_config
--         autocmd!
--         autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--     augroup end
-- ]])

return require('packer').startup(function(use)
    -- Packer can manage itself
    use {
        'wbthomason/packer.nvim',
        config = function()
            vim.keymap.set('n', '<leader>ps', ':PackerSync<cr>', { noremap = true })
        end
    }

    -- ===
    -- Core
    -- ===
    if vim.g.use_async == true then
        use 'skywind3000/asyncrun.vim'
    end

    if vim.g.use_sound == true then
        use {
            'timeyyy/orchestra.nvim.git',
            'timeyyy/bubbletrouble.symphony.git',
            'timeyyy/clackclack.symphony'
        }
    end

    if vim.g.use_airline == true then
        use {
            'vim-airline/vim-airline',
            'vim-airline/vim-airline-themes'
        }
    end

    if vim.g.use_lualine == true then
        use {
            'nvim-lualine/lualine.nvim',
            -- requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function()
                require('lualine').setup {
                    options = {
                        theme = 'dracula',
                        component_separators = { left = '', right = '' },
                        section_separators = { left = '', right = '' },
                        icons_enabled = true,
                        globalstatus = true
                    }
                }
            end
        }
    end

    if vim.g.use_tabline == true then
        use {
            'kdheepak/tabline.nvim',
            config = function()
                require('tabline').setup {
                    -- Defaults configuration options
                    enable = true,
                    options = {
                        -- If lualine is installed tabline will use separators configured in lualine by default.
                        -- These options can be used to override those settings.
                        --section_separators = {'', ''},
                        --component_separators = {'', ''},
                        --max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
                        show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
                        show_devicons = false, -- this shows devicons in buffer section
                        show_bufnr = false, -- this appends [bufnr] to buffer section,
                        show_filename_only = false, -- shows base filename only instead of relative path in filename
                        modified_icon = "+ ", -- change the default modified icon
                        modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
                        show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
                    }
                }

                vim.cmd([[
                set guioptions-=e " Use showtabline in gui vim
                set sessionoptions+=tabpages,globals " store tabpages and globals in session
                ]])
            end
            -- requires = { { 'nvim-lualine/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
        }
    end

    if vim.g.use_comfortable_motion == true then
        use 'yuttie/comfortable-motion.vim'
    end

    if vim.g.use_nerdcommenter == true then
        use 'scrooloose/nerdcommenter'
    end
    -- ===

    -- ===
    -- Visualizers
    -- ===
    if vim.g.use_buftabline == true then
        use 'ap/vim-buftabline'
    end
    if vim.g.use_nerdtree == true then
        use 'scrooloose/nerdtree'
    end
    if vim.g.use_bufkill == true then
        use 'qpkorr/vim-bufkill'
    end
    -- ===

    -- ===
    -- Syntax & Custom indents
    -- ===
    if vim.g.use_pandoc == true then
        use {
            'vim-pandoc/vim-pandoc',
            'vim-pandoc/vim-pandoc-syntax'
        }
    end

    if vim.g.use_indentguides == true then
        use 'thaerkh/vim-indentguides'
    end

    if vim.g.use_polyglot == true then
        use 'sheerun/vim-polyglot'
    end

    if vim.g.use_vimtex == true then
        use 'lervag/vimtex'
    end

    if vim.g.use_arm_syntax == true then
        use 'ARM9/arm-syntax-vim'
    end

    if vim.g.use_asm_indent == true then
        use 'philj56/vim-asm-indent'
    end

    if vim.g.use_sxhkd == true then
        use 'kovetskiy/sxhkd-vim'
    end

    if vim.g.use_clang_format == true then
        use 'rhysd/vim-clang-format'
    end

    if vim.g.use_fswitch == true then
        use 'derekwyatt/vim-fswitch'
    end
    -- ===

    -- ===
    -- Git
    -- ===
    if vim.g.use_fugitive == true then
        use 'tpope/vim-fugitive'
    end
    -- ===

    -- ===
    -- LSP
    -- ===
    if vim.g.use_lsp == true then
        use {
            'williamboman/nvim-lsp-installer',
            {
                'neovim/nvim-lspconfig',
                config = function()
                    require("nvim-lsp-installer").setup {}
                    local lspconfig = require("lspconfig")
                    lspconfig.sumneko_lua.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { 'vim' }
                                },
                                runtime = {
                                    version = "LuaJIT",
                                    path = vim.split(package.path, ";")
                                },
                                workspace = {
                                    library = {
                                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                                    }
                                }
                            }
                        }
                    }
                end
            },
        }
        use 'tami5/lspsaga.nvim'
    end
    -- ===

    -- ===
    -- Treesitter
    -- ===
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- ===
    -- Telescope
    -- ===
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require('telescope').setup()

            vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files theme=dropdown<cr>', { noremap = true })
            vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep theme=dropdown<cr>', { noremap = true })
            vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers theme=dropdown<cr>', { noremap = true })
            vim.keymap.set('n', '<leader>fd', '<cmd>Telescope builtin theme=dropdown<cr>', { noremap = true })
        end
    }
    -- ===

    -- ===
    -- Gitsigns
    -- ===
    use {
            'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup()
            end
            -- tag = 'release' -- To use the latest release
    }
    -- ===

    -- ===
    -- Autocompletion
    -- ===
    if vim.g.use_autocomplete == 1 then
        use 'DustVoice/VimCompletesMe'
    elseif vim.g.use_autocomplete == 2 then
        if vim.fn['has']('nvim') then
            use { 'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins' }
        else
            use {
                'Shougo/deoplete.nvim',
                'roxma/nvim-yarp',
                'roxma/vim-hug-neovim-rpc'
            }
        end
    elseif vim.g.use_autocomplete == 3 then
        use 'ycm-core/YouCompleteMe'
    end

    if vim.g.use_javacomplete == true then
        use 'artur-shaik/vim-javacomplete2'
    end
    -- ===

    -- ===
    -- CoC
    -- ===
    if vim.g.use_coc == true then
        use { 'neoclide/coc.nvim', branch = 'release'}
    end
    -- ===

    -- ===
    -- Rust
    -- ===
    if vim.g.use_rust == true then
        use 'rust-lang/rust.vim'
    end
    -- ===

    -- ===
    -- Special functionality
    -- ===
    if vim.g.use_python == true then
        use 'dhruvasagar/vim-table-mode'
    end

    if vim.g.use_livedown == true then
        use 'shime/vim-livedown'
    end
    -- ===

    -- ===
    -- Templating
    -- ===
    if vim.g.use_templator == true then
        use 'DustVoice/templator_vim'
    end
    -- ===

    -- ===
    -- Colorscheme
    -- ===
    use {'dracula/vim', as = 'dracula'}
    use {'catppuccin/nvim', as = 'catppuccin'}

    if vim.g.use_alt_colorschemes == true then
        use 'ajmwagar/vim-deus'
        use 'chriskempson/base16-vim'
    end
    -- ===
end)
