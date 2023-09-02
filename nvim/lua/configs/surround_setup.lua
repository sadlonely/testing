-- import surround plugin safely
local surround_status, surround = pcall(require, "surround")

if not surround_status then
    return
end

-- configure surround.nvim
surround.setup({
    --- set the default mapping style for surround.nvim
    --- available options are 'sandwich', 'visual' and 'insert'
    mapping_style = "sandwich",
})
