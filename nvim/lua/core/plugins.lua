-- set up lazy loading for plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- clone the latest stable release of lazy.nvim
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
-- add lazy loading path to runtimepath
vim.opt.rtp:prepend(lazypath)

-- configure lazy loaded plugins
require("lazy").setup({
    -- utility --

    { "nvim-lua/plenary.nvim", lazy = true }, -- a Lua library with a focus on high-level and useful.

    {
        "rcarriga/nvim-notify", -- a simple, lightweight notification library.
        config = function()
            require("configs.notify_setup")
        end,
        event = "BufEnter",
    },

    {
        "numToStr/Comment.nvim", -- a commenting plugin.
        config = function()
            require("configs.comment_setup")
        end,
        keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    },

    {
        "ur4ltz/surround.nvim", -- a plugin that provides mappings to easily surround text with parentheses, brackets, quotes, and more.
        config = function()
            require("configs.surround_setup")
        end,
    },

    {
        "windwp/nvim-autopairs", -- a lightweight autopair plugin.
        config = function()
            require("configs.autopairs_setup")
        end,
        event = "InsertEnter",
    },

    -- completion --

    {
        "hrsh7th/nvim-cmp", -- a completion plugin that supports various sources (buffer, path, tags, etc.).
        config = function()
            require("configs.cmp_setup")
        end,
        dependencies = {
            "cmp-buffer",
            "cmp-path",
            "cmp-cmdline",
            "cmp_luasnip",
            "cmp-nvim-lsp",
        },
    },

    { "hrsh7th/cmp-buffer", lazy = true }, -- a buffer source for nvim-cmp.

    { "hrsh7th/cmp-path", lazy = true }, -- a path source for nvim-cmp.

    { "hrsh7th/cmp-cmdline", lazy = true }, -- a cmdline source for nvim-cmp.

    { "saadparwaiz1/cmp_luasnip", lazy = true }, -- a LuaSnip source for nvim-cmp.

    { "hrsh7th/cmp-nvim-lsp", lazy = true }, -- a source for nvim-cmp that provides LSP completion suggestions.

    { "L3MON4D3/LuaSnip", dependencies = "friendly-snippets" }, -- a snippet plugin for Neovim written in Lua.

    { "rafamadriz/friendly-snippets", lazy = true }, -- a collection of friendly snippets for various programming languages.

    -- LSP (Language Server Protocol) --

    {
        "neovim/nvim-lspconfig", -- a collection of configurations for built-in LSP client in Neovim.
        config = function()
            require("configs.lsp.lsp_setup")
        end,
        lazy = true,
    },

    {
        "jose-elias-alvarez/null-ls.nvim", -- a plugin that allows you to use LSP diagnostics and code actions without a language server.
        config = function()
            require("configs.lsp.null-ls_setup")
        end,
        lazy = true,
    },

    { "jayp0521/mason-null-ls.nvim", lazy = true }, -- a null-ls integration for mason.nvim.

    {
        "williamboman/mason-lspconfig.nvim", -- a lspconfig integration for mason.nvim.
        lazy = true,
        event = "BufEnter",
        cmd = { "LspInstall", "LspUninstall" },
    },

    {
        "williamboman/mason.nvim", -- a plugin that manages multiple LSP servers within Neovim.
        config = function()
            require("configs.lsp.mason_setup")
        end,
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        build = function()
            pcall(function()
                require("mason-registry").refresh()
            end)
        end,
        event = "BufEnter",
        lazy = true,
    },

    {
        "nvim-treesitter/nvim-treesitter", -- a plugin that provides text analysis and parsing for many languages.
        config = function()
            require("configs.treesitter_setup")
        end,
        cmd = {
            "TSInstall",
            "TSUninstall",
            "TSUpdate",
            "TSUpdateSync",
            "TSInstallInfo",
            "TSInstallSync",
            "TSInstallFromGrammar",
        },
        event = "BufEnter",
    },

    -- file navigation --
    {
        "nvim-neo-tree/neo-tree.nvim", -- a file explorer tree plugin.
        dependencies = { "MunifTanjim/nui.nvim" },
        config = function()
            require("configs.neotree_setup")
        end,
    },
    {
        "akinsho/bufferline.nvim", -- a plugin that provides a buffer line.
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("configs.buffers_setup")
        end,
    },
    {
        "nvim-telescope/telescope.nvim", -- a plugin that provides fuzzy finding and a live grep search tool.
        config = function()
            require("configs.telescope_setup")
        end,
        dependencies = { "telescope-fzf-native.nvim" },
        lazy = true,
        cmd = "Telescope",
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim", -- a plugin that provides a FZF source for Telescope.
        lazy = true,
        build = "make",
    },
    -- git integration --

    {
        "lewis6991/gitsigns.nvim", -- a plugin that shows Git diff markers in the sign column.
        config = function()
            require("configs.gitsigns_setup")
        end,
        event = "BufEnter",
        cmd = "Gitsigns",
    },

    "kdheepak/lazygit.nvim", -- a plugin to use lazygit inside Neovim.

    -- ui --

    {
        "onsails/lspkind.nvim", -- a plugin that adds vscode-like pictograms to nvim-cmp's completion menu.
        config = function()
            require("configs.lspkind_setup")
        end,
    },

    {
        "nvim-lualine/lualine.nvim", -- a plugin that creates customizable statuslines and prompts in Neovim.
        config = function()
            require("configs.lualine_setup")
        end,
    },

    {
        "shaunsingh/nord.nvim", -- a comfortable dark color scheme.
        lazy = false,
        priority = 1000,
    },

    {
        "folke/tokyonight.nvim",
        opts = { "night" },
        lazy = false,
        priority = 1000,
    },

    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1100,
        config = function()
            require("core.themes")
        end,
    },

    {
        "folke/which-key.nvim",
        config = function()
            require("configs.whichkey_setup")
        end,
        cmd = "WhichKey",
        event = "VeryLazy",
    },
})
