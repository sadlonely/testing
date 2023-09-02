-- set up options
local set = vim.opt

-- set leader key
vim.g.mapleader = " "

-- encoding
set.encoding = "UTF-8"

-- show line numbers
set.number = true
set.relativenumber = true

-- enable mouse
set.mouse = "a"

-- automatically reload files when changed outside Vim
set.autoread = true

-- show special characters
set.list = true
set.listchars:append("eol:↴")

-- show sign column
set.signcolumn = "yes"

-- show window bar with file name and modified status
set.winbar = "%f %m"

-- use terminal colors
set.termguicolors = true

-- highlight cursor line
set.cursorline = true

-- disable line wrapping
set.wrap = false

-- search settings
set.ignorecase = true -- ignore case when searching
set.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- use system clipboard as default register
set.clipboard:append("unnamedplus")

-- completion options
set.completeopt = { "menu", "menuone", "noselect" }

-- split windows
set.splitright = true -- split vertical window to the right
set.splitbelow = true -- split horizontal window to the bottom

-- tabs and indentation
set.tabstop = 2 -- use 2 spaces for tabs
set.shiftwidth = 2 -- use 2 spaces for indent width
set.expandtab = true -- expand tab to spaces
set.autoindent = true -- copy indent from current line when starting new one
