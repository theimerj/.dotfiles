return {
  "rcarriga/nvim-notify",
  opts = {
    background_colour = "TelescopeNormal",
    fps = 60,
    stages = "fade",
    timeout = 3000,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
  },
}