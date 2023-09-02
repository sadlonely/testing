-- import autopairs plugin safely
local autopairs_status, autopairs = pcall(require, "nvim-autopairs")

if not autopairs_status then
    return
end

autopairs.setup({ disable_filetype = { "TelescopePrompt" }, map_cr = true })
