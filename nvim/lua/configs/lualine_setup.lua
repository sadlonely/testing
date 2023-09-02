-- import lualine plugin safely
local lualine_status, lualine = pcall(require, "lualine")

if not lualine_status then
    do
        return
    end
end

-- define a custom component that shows the current git branch
local function current_git_branch()
    local branch = vim.fn["FugitiveHead"]()
    if branch and branch ~= "" then
        return branch
    else
        return ""
    end
end

-- define a custom component that shows the number of open buffers
local function buffer_count()
    local buf_count = vim.fn.bufnr("$")
    if buf_count == 1 then
        return "1 buffer"
    else
        return buf_count .. " buffers"
    end
end

-- set the configuration options for lualine
local config = {
    options = {
        theme = "everforest",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {},
        always_show = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { current_git_branch },
        lualine_c = { "filename", "file_size" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress", buffer_count },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    components = {
        file_size = {
            function()
                local file_size = vim.fn.getfsize(vim.fn.expand("%:p"))
                if file_size > 0 then
                    return vim.fn.byte2human(file_size)
                else
                    return ""
                end
            end,
            condition = function()
                return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
        },
        buffer_index = {
            function()
                local current_bufnr = vim.fn.bufnr()
                local total_bufnr = vim.fn.bufnr("$")
                return string.format("%d/%d", current_bufnr, total_bufnr)
            end,
        },
        lsp_error = {
            function()
                local count = vim.lsp.diagnostic.get_count(0, "Error")
                if count > 0 then
                    return "  " .. count
                else
                    return ""
                end
            end,
        },
        lsp_warning = {
            function()
                local count = vim.lsp.diagnostic.get_count(0, "Warning")
                if count > 0 then
                    return "  " .. count
                else
                    return ""
                end
            end,
        },
        lsp_info = {
            function()
                local count = vim.lsp.diagnostic.get_count(0, "Information")
                if count > 0 then
                    return "  " .. count
                else
                    return ""
                end
            end,
        },
    },
}

-- add the configuration
lualine.setup(config)
