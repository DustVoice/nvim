-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
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
    },
  },
  { "max397574/better-escape.nvim", enabled = false },
}
