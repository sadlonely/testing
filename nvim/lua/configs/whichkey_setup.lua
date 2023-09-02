-- Safely import which-key plugin
local whichkey_status, whichkey = pcall(require, "which-key")

if not whichkey_status then
    return
end

-- Setup which-key
whichkey.setup({
    plugins = {
        marks = false,
        registers = false,
        spelling = {
            enabled = true,
            suggestions = 20,
        },
    },
    icons = {
        breadcrumb = "󰄾",
        separator = "",
        group = "",
    },
    window = {
        border = "single",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
    triggers = "auto",
    triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
    },
})
local mappings = {
    ["<leader>"] = {
        f = { name = "  Finder" },
        d = { name = "  Diagnostic" },
        g = { name = " 󰊢 Git" },
        s = { name = " 󰨑 Split" },
        l = { name = "  LSP" },
        c = { name = "  ColorScheme" },
    },
}

-- Set the mappings
whichkey.register(mappings)
