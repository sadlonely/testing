-- import notify plugin safely
local notify_status, notify = pcall(require, "notify")

if not notify_status then
    return
end

notify.setup({ stages = "fade" })
vim.notify = notify
