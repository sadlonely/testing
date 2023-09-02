-- import everforest plugin safely
local everforest_status = pcall(require, "everforest")

if not everforest_status then
    return
else
    vim.cmd([[colorscheme everforest]])
end
