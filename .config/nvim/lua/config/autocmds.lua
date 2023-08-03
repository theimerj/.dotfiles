-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "NvimTree" },
  callback = function(args)
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        vim.api.nvim_buf_delete(args.buf, { force = true })
        return true
      end,
    })
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "NvimTree*",
  callback = function()
    local view = require("nvim-tree.view")
    local is_visible = view.is_visible()

    local api = require("nvim-tree.api")
    if not is_visible then
      api.tree.open()
    end
  end,
})
