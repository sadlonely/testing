-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")

if not cmp_status then
    return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")

if not luasnip_status then
    return
end

-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")

if not lspkind_status then
    return
end

local border_opts = {
    border = "single",
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
}

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered({ border_opts }),
        documentation = cmp.config.window.bordered({ border_opts }),
    },

    completion = {
        completeopt = "menu,menuone,noselect",
        keyword_length = 2,
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
    },
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
})
-- Configure command-line completion
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
        { name = "path" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
        { name = "path" },
        { name = "cmdline" },
    },
})
