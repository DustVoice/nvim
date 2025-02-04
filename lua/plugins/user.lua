-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  { "abhishekmukherg/xonsh-vim" },
  {
    "rafikdraoui/jj-diffconflicts",
    cmd = { "JJDiffConflicts" },
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "██████  ██   ██ ███████ ████████ ██████   ██████",
        "██   ██ ██   ██ ██         ██    ██   ██ ██    ██",
        "██   ██ ██   ██ ███████    ██    ██████  ██    ██",
        "██   ██ ██   ██      ██    ██    ██   ██ ██    ██",
        "██████   █████  ███████    ██    ██   ██  ██████",
        " ",
        "        ███    ██ ██    ██ ██ ███    ███",
        "        ████   ██ ██    ██ ██ ████  ████",
        "        ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "        ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "        ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },
  {
    "AstroNvim/astrocore",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      filetypes = {
        extension = {
          bb = "clojure",
          clj_kondo = "clojure",
        },
      },
    },
  },
  { "max397574/better-escape.nvim", enabled = false },
}
