-- define options to be used in all keymaps
local default_opts = {
    noremap = true,
    silent = true,
}

-- function to set keymap with description
local function map(mode, key, cmd, desc)
    local opts = vim.tbl_extend("force", default_opts, desc)
    vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

-- keymaps for disabling arrow keys
map("n", "<up>", "<nop>", { desc = "Disable <up> key" })
map("n", "<down>", "<nop>", { desc = "Disable <down> key" })
map("n", "<left>", "<nop>", { desc = "Disable <left> key" })
map("n", "<right>", "<nop>", { desc = "Disable <right> key" })

-- keymaps for saving and quitting
map("n", "<leader>w", ":w<CR>", { desc = " Save file" })
map("n", "<leader>q", ":confirm q<CR>", { desc = " Quit" })
map("n", "<C-q>", ":q!<CR>", { desc = " Quit without saving" })

-- keymaps for mooving through buffers
map("n", "<S-k>", "<C-w>k", { desc = "Focus upper buffer" })
map("n", "<S-j>", "<C-w>j", { desc = "Focus down buffer" })
map("n", "<S-h>", "<C-w>h", { desc = "Focus left buffer" })
map("n", "<S-l>", "<C-w>l", { desc = "Focus right buffer" })

-- keymaps for resizing
map("n", "<C-l>", ":vertical resize +2<CR>", { desc = " Augment the vertical size" })
map("n", "<C-h>", ":vertical resize -2<CR>", { desc = " Reduce the vertical size" })
map("n", "<C-j>", ":resize +2<CR>", { desc = " Augment the horizontal size" })
map("n", "<C-k>", ":resize -2<CR>", { desc = " Reduce the horizontal size" })

-- keymap for cutting text without yanking to register
map("n", "x", '"_x', { desc = "Cut text without yanking to register" })

-- keymaps for splitting windows
map("n", "<leader>sv", "<C-w>v", { desc = " Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = " Split window horizontally" })

-- keymaps for managing tabs
map("n", "<leader>a", ":enew<CR>", { desc = " Open new tab" })
map("n", "<leader>x", ":bdelete<CR>", { desc = " Close current tab" })
map("n", "<leader>n", ":BufferLineCycleNext<CR>", { desc = " Go to next tab" })
map("n", "<leader>p", ":BufferLineCyclePrev<CR>", { desc = " Go to previous tab" })

-- keymap for opening lazygit panel
map("n", "<leader>gg", ":LazyGit<CR>", { desc = " Open lazygit panel" })

-- keymaps for using Telescope plugin
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = " Open Telescope find files dialog" })
map("n", "<leader>fw", ":Telescope live_grep<CR>", { desc = " Open Telescope live grep search" })

-- keymaps for using Neotree plugin
map("n", "<leader>e", ":Neotree toggle<CR>", { desc = " Toggle Neotree" })
map("n", "<leader>o", ":Neotree focus<CR>", { desc = " Focus on Neotree" })

-- keymaps for LSP and diagnostics
map("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", { desc = " Open LSP diagnostic floating window" })
map("n", "<leader>dq", ":lua vim.diagnostic.setloclist()<CR>", { desc = " Set LSP diagnostic location list" })
map("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", { desc = " Show LSP code actions" })
map("n", "K", ":lua vim.lsp.buf.hover<CR>", { desc = " Show LSP hover information" })
map("n", "<leader>dt", ":lua toggle_diagnostics()<CR>", { desc = " Toggle diagnostics display" })

-- keymaps for colorscheme
map(
    "n",
    "<leader>cs",
    "<cmd>lua require('telescope.builtin').colorscheme()<cr>",
    { desc = "Change colorscheme for actual session" }
)

-- keympas for mooving text
map("v", "J", ":m '>+1<CR>gv=gv", { desc = " Descends from a line the line" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = " Mount a line the line" })
