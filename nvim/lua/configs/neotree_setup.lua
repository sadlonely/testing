-- import neotree plugin safely
local neotree_status, neotree = pcall(require, "neo-tree")

if not neotree_status then
    return
end

-- setup neotree
neotree.setup({
    close_if_last_window = true, -- close NeoTree when it's the last window
    enable_diagnostics = false, -- disable diagnostic messages
    source_selector = {
        winbar = true, -- use the winbar source selector
        content_layout = "center", -- center the source selector content
        sources = {
            { source = "filesystem", display_name = "" .. " File" },
            { source = "buffers", display_name = "" .. " Bufs" },
            { source = "git_status", display_name = "" .. " Git" },
        },
        --     tab_labels = {
        --         filesystem = "" .. " File", -- label for the file system source
        --         buffers = "" .. " Bufs", -- label for the buffers source
        --         git_status = "" .. " Git", -- label for the Git source
        --         diagnostics = "裂" .. " Diagnostic", -- label for the diagnostics source
        --     },
    },
    default_component_configs = {
        indent = { padding = 0 }, -- don't add extra padding to the indent component
        icon = {
            folder_closed = "", -- icon for closed folders
            folder_open = "", -- icon for open folders
            folder_empty = "", -- icon for empty folders
            default = "", -- default icon
        },
        git_status = {
            symbols = {
                added = "", -- symbol for added files
                deleted = "", -- symbol for deleted files
                modified = "", -- symbol for modified files
                renamed = "➜", -- symbol for renamed files
                untracked = "★", -- symbol for untracked files
                ignored = "◌", -- symbol for ignored files
                unstaged = "✗", -- symbol for unstaged files
                staged = "✓", -- symbol for staged files
                conflict = "", -- symbol for files in conflict
            },
        },
    },
    window = {
        width = 30, -- set the width of the NeoTree window
    },
    filesystem = {
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
        },
        hijack_netrw_behavior = "open_current", -- open the current file in the current window
        use_libuv_file_watcher = true, -- use libuv for file watching
        window = {}, -- use default window settings
        filtered_items = { hide_dotfiles = false },
    },
    event_handlers = {
        {
            event = "neo_tree_buffer_enter",
            handler = function(_)
                vim.opt_local.signcolumn = "auto" -- set the signcolumn to auto for the current buffer
            end,
        },
    },
})
