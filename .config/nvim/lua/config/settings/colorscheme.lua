-- Challenger deep theme
-- ---------------------

-- local colorscheme = "challenger_deep"
-- vim.g.challenger_deep_termcolors = 1
-- vim.g.challenger_deep_termcolors = 16


-- Rose Pine theme
-- ---------------

require("rose-pine").setup({
    dark_variant = "moon",
})
local colorscheme = "rose-pine"


-- Github theme
-- ------------

-- require("github-theme").setup({
-- 	theme_style = "light",
-- 	function_style = "italic",
-- })
-- local colorscheme = "github-light"


-- Catppuccin theme
-- ----------------

-- require("catppuccin").setup({
--     flavour = "macchiato", -- latte, frappe, macchiato, mocha
--     background = { -- :h background
--         light = "latte",
--         dark = "macchiato",
--     },
--     transparent_background = true,
-- })
-- local colorscheme = "catppuccin"


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
