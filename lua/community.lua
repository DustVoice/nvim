-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  { "AstroNvim/astrocommunity" },
  { import = "astrocommunity.pack.lua" },

  { import = "astrocommunity.colorscheme.catppuccin" },

  -- { import = "astrocommunity.editing-support.multiple-cursors-nvim" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },

  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },

  -- { import = "astrocommunity.note-taking.neorg" },

  { import = "astrocommunity.pack.clojure" },
  -- { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.dart" },
  -- { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.haskell" },
  { import = "astrocommunity.pack.julia" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typst" },

  -- { import = "astrocommunity.utility.noice-nvim" },

  -- import/override with your plugins folder
}
