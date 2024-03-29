return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  opts = {
    formatters_by_ft = {
      css = { "prettierd" },
      html = { "prettierd" },
      javascript = { "prettierd" },
      json = { "prettierd" },
      json5 = { "prettierd" },
      lua = { "stylua" },
      php = { "pint" },
      blade = { "blade-formatter" },
      vue = { "prettierd" },
      typescript = { "prettierd" },
      yaml = { "prettierd" },
    },
  },
}
