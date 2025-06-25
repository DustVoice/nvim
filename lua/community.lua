-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  { "AstroNvim/astrocommunity" },

  -- Colorschemes
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- Code Runners
  { import = "astrocommunity.code-runner.conjure" },

  -- Completion
  { import = "astrocommunity.completion.avante-nvim" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- Diagnostics
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- Editing Support
  { import = "astrocommunity.editing-support.conform-nvim" },
  -- { import = "astrocommunity.editing-support.multiple-cursors-nvim" },
  { import = "astrocommunity.editing-support.nvim-parinfer" },
  { import = "astrocommunity.editing-support.undotree" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },

  -- Git
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },

  -- Note Taking
  -- { import = "astrocommunity.note-taking.neorg" },

  -- Language Packs
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.chezmoi" },
  { import = "astrocommunity.pack.clojure" },
  -- { import = "astrocommunity.pack.cs" },
  -- { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.elixir-phoenix" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.gleam" },
  -- { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.haskell" },
  -- { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.jj" },
  { import = "astrocommunity.pack.julia" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.mdx" },
  -- { import = "astrocommunity.pack.ocaml" },
  -- { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.zig" },

  -- Register
  { import = "astrocommunity.register.nvim-neoclip-lua" },

  -- Utility
  -- { import = "astrocommunity.utility.noice-nvim" },

  -- import/override with your plugins folder
}
