vim.api.nvim_create_autocmd('BufWritePost', {
    group = vim.api.nvim_create_augroup('packer_user_config', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile',
})

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

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

    if vim.g.use_gas == true then
        use 'Shirk/vim-gas'
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
            'neovim/nvim-lspconfig',
            {
                'williamboman/mason.nvim',
                after = 'nvim-lspconfig',
                config = function()
                    require("mason").setup()
                end
            },
            {
                'williamboman/mason-lspconfig.nvim',
                requires = 'simrat39/rust-tools.nvim',
                after = {
                    'mason.nvim',
                    'nvim-cmp',
                },
                config = function()
                    require("mason-lspconfig").setup {
                        ensure_installed = {
                            "sumneko_lua",
                            "rust_analyzer"
                        }
                    }

                    local opts = { noremap = true, silent = true }

                    -- Use an on_attach function to only map the following keys
                    -- after the language server attaches to the current buffer
                    -- on_attach := function(client, bufnr)
                    local on_attach = function(_, bufnr)
                        -- Enable completion triggered by <c-x><c-o>
                        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                        -- Mappings.
                        -- See `:help vim.lsp.*` for documentation on any of the below functions
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
                    end

                    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

                    require("mason-lspconfig").setup_handlers {
                        function (server_name)
                            require("lspconfig")[server_name].setup {
                                on_attach = on_attach,
                                capabilities = capabilities
                            }
                        end,

                        ["sumneko_lua"] = function()
                            require("lspconfig").sumneko_lua.setup {
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
                        end,

                        ["rust_analyzer"] = function ()
                            require("rust-tools").setup {}
                        end,
                    }
                end
            },
        }

        use {
                'hrsh7th/nvim-cmp',
                requires = {
                    'hrsh7th/cmp-nvim-lsp',
                    'hrsh7th/cmp-buffer',
                    'hrsh7th/cmp-path',
                    'hrsh7th/cmp-cmdline',
                    { 'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim' },
                    { 'saadparwaiz1/cmp_luasnip', requires = 'L3MON4D3/LuaSnip' },
                    { 'mtoohey31/cmp-fish', ft = 'fish' },
                    {
                        'saecki/crates.nvim',
                        event = { "BufRead Cargo.toml" },
                        requires = { { 'nvim-lua/plenary.nvim' } },
                        config = function()
                            require('crates').setup()
                        end,
                    },
                    --'dmitmel/cmp-cmdline-history',
                    'kdheepak/cmp-latex-symbols',
                    'hrsh7th/cmp-nvim-lsp-signature-help',
                },
                config = function()
                    local cmp = require("cmp")

                    cmp.setup {
                        snippet = {
                            expand = function(args)
                                require('luasnip').lsp_expand(args.body)
                            end,
                        },

                        window = {
                            completion = cmp.config.window.bordered(),
                            documentation = cmp.config.window.bordered(),
                        },

                        mapping = cmp.mapping.preset.insert({
                            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                            ['<C-f>'] = cmp.mapping.scroll_docs(4),
                            ['<C-Space>'] = cmp.mapping.complete(),
                            ['<C-e>'] = cmp.mapping.abort(),
                            ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                        }),

                        sources = cmp.config.sources({
                            { name = 'nvim_lsp' },
                            { name = 'luasnip' },
                            { name = 'nvim_lsp_signature_help' },
                            { name = 'latex_symbols' },
                        }, {
                            { name = 'buffer', keyword_length = 3 },
                        })
                    }

                    -- Set configuration for specific filetype.
                    cmp.setup.filetype('gitcommit', {
                        sources = cmp.config.sources({
                            { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
                        }, {
                            { name = 'buffer', keyword_length = 3 },
                        })
                    })

                    cmp.setup.filetype('fish', {
                        sources = cmp.config.sources({
                            { name = 'fish' }, -- You can specify the `cmp_git` source if you were installed it.
                        })
                    })

                    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
                    cmp.setup.cmdline('/', {
                        mapping = cmp.mapping.preset.cmdline(),
                        sources = {
                            { name = 'buffer', keyword_length = 3 }
                        }
                    })

                    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
                    cmp.setup.cmdline(':', {
                        mapping = cmp.mapping.preset.cmdline(),
                        sources = cmp.config.sources({
                            { name = 'path', keyword_length = 3 }
                        }, {
                            { name = 'cmdline', keyword_length = 3 }
                        })
                    })

                    -- for _, cmd_type in ipairs({':', '/', '?', '@'}) do
                    --     cmp.setup.cmdline(cmd_type, {
                    --         sources = {
                    --             { name = 'cmdline_history', keyword_length = 3 },
                    --         },
                    --     })
                    -- end

                    vim.api.nvim_create_autocmd("BufRead", {
                        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
                        pattern = "Cargo.toml",
                        callback = function()
                            cmp.setup.buffer({ sources = { { name = "crates" } } })
                        end,
                    })
                end,
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
        use {
            'rust-lang/rust.vim',
        }
    end
    -- ===

    -- ===
    -- Fish
    -- ===
    if vim.g.use_fish == true then
        use 'nickeb96/fish.vim'
    end

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
    use {
        "themercorp/themer.lua",
        opt = false,
        config = function()
            require("themer").setup({
                colorscheme = "dracula",
                styles = {
                    ["function"] = { style = 'italic' },
                    functionbuiltin = { style = 'italic' },
                    variable = { style = 'italic' },
                    variableBuiltIn = { style = 'italic' },
                    parameter  = { style = 'italic' },
                },
            })
        end
    }

    if vim.g.use_alt_colorschemes == true then
        --use {'dracula/vim', as = 'dracula.vim'}
        --use {'Mofiqul/dracula.nvim', as = 'dracula.nvim'}
        use {'catppuccin/nvim', as = 'catppuccin.nvim'}

        use 'ajmwagar/vim-deus'
        use 'chriskempson/base16-vim'
    end
    -- ===

    -- ===
    -- Auto :PackerSync
    -- ===
    -- if packer_bootstrap then
    --     require('packer').sync()
    -- end
    -- ===
end)
