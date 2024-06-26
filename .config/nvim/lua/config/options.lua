-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 4 spaces for a tab
vim.opt.softtabstop = 4 -- On insert use 4 spaces for tab
vim.opt.numberwidth = 4 -- set the width of the line numbers
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.number = false -- together with relativenumber set to true, it is aligned to the right, which is nicer
vim.opt.winblend = 20 -- global transparency for floating windows
vim.opt.conceallevel = 2 -- level of text hiding
vim.opt.scrolloff = 16 -- minimum number of screen lines to keep above and below the cursor

-- vim.opt.backupdir = vim.fn.stdpath("data") .. "/backup" -- where to store backup files
-- vim.opt.directory = vim.fn.stdpath("data") .. "/swap" -- where to store swap files
-- vim.opt.undodir = vim.fn.stdpath("data") .. "/undo" -- where to store undo files

LazyVim.terminal.setup("/bin/zsh")
