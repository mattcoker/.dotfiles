return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
        {
          section = "terminal",
          cmd = "~/.config/nvim/scripts/pokemon-centered.sh; sleep .1",
          random = 10000,
          pane = 2,
          indent = 4,
          height = 32,
        },
      },
    },
  },
}
