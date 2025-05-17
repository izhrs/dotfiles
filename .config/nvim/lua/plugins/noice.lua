return {
  "folke/noice.nvim",
  opts = {
    presets = {
      bottom_search = false,
      command_palette = {
        views = {
          cmdline_popup = {
            position = {
              row = "50%",
              col = "50%",
            },
            size = {
              min_width = 60,
              width = "auto",
              height = "auto",
            },
          },
          cmdline_popupmenu = {
            position = {
              row = "85%",
              col = "50%",
            },
          },
        },
      },
    },
  },
}
