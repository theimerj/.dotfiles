return {
  "zbirenbaum/copilot.lua",
  opts = {
    panel = {
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<D-CR>",
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 50,
      keymap = {
        accept = "<D-l>",
        accept_word = false,
        accept_line = false,
        prev = "<D-[>",
        next = "<D-]>",
        dismiss = "<C-]>",
      },
    },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
