-- import nvim-treesitter plugin safely
local treesitter_status, treesitter = pcall(require, "nvim-treesitter")

if not treesitter_status then
    return
end

treesitter.setup({
    -- enable syntax highlighting
    highlight = {
        enable = true,
    },
    -- enable indentation
    indent = { enable = true },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = { enable = true },
    -- ensure these language parsers are installed
    ensure_installed = {
        "json",
        "markdown",
        "bash",
        "lua",
        "hcl",
        "dockerfile",
        "gitignore",
        "python",
    },
    -- auto install above language parsers
    auto_install = true,
})
