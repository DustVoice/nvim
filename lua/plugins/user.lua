-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {
  { "julienvincent/hunk.nvim", cmd = { "DiffEditor" } },
  { "luizribeiro/vim-cooklang" },
  {
    "yetone/avante.nvim",
    opts = {
      provider = "copilot",
      vendors = {
        ollama = {
          __inherited_from = "openai",
          api_key_name = "OLLAMA_API_KEY",
          endpoint = "http://127.0.0.1:11434/v1",
          model = "MFDoom/deepseek-coder-v2-tool-calling",
        },
      },
    },
  },
  { "hylang/vim-hy" },
  { "abhishekmukherg/xonsh-vim" },
  {
    "rafikdraoui/jj-diffconflicts",
    cmd = { "JJDiffConflicts" },
  },
  { "max397574/better-escape.nvim", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            " █████  ███████ ████████ ██████   ██████ ",
            "██   ██ ██         ██    ██   ██ ██    ██",
            "███████ ███████    ██    ██████  ██    ██",
            "██   ██      ██    ██    ██   ██ ██    ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███    ██ ██    ██ ██ ███    ███",
            "████   ██ ██    ██ ██ ████  ████",
            "██ ██  ██ ██    ██ ██ ██ ████ ██",
            "██  ██ ██  ██  ██  ██ ██  ██  ██",
            "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
  },
}
