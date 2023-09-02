-- import gitsigns plugin safely
local gitsigns_status, gitsigns = pcall(require, "gitsigns")

if not gitsigns_status then
    return
end

gitsigns.setup({
    signs = {
        add = { text = "" },
        change = { text = "ﰣ" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "ﰣ" },
        untracked = { text = "▎" },
    },
})
