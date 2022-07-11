local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = "[Lsp]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
                spell = "[Spell]",
                dictionary = "[Dictionary]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        { name = "spell" },
        { name = "nvim_lsp_signature_help" },
        {
            name = "dictionary",
            keyword_length = 5,
        },
        {
            name = "buffer",
            keyword_length = 3,
            get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end,
        },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
    -- Border
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

require("cmp_dictionary").setup({
    dic = {
        ["*"] = {
            "/usr/share/dict/words",
            "~/dict/cs/words",
        },
        spelllang = {
            en = "/usr/share/dict/words",
            cs = "~/dict/cs/words",
        },
    },
    -- The following are default values.
    exact = 2,
    first_case_insensitive = false,
    document = false,
    document_command = "wn %s -over",
    async = false,
    capacity = 5,
    debug = false,
})