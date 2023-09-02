-- import bufferline plugin safely
local bufferline_status, bufferline = pcall(require, "bufferline")

if not bufferline_status then
    return
end

-- set up bufferline with some options.
bufferline.setup({
    options = {
        -- set the format for buffer numbers to include a period.
        numbers = function(opts)
            return string.format("%s.", opts.ordinal)
        end,
        -- set the command to run when closing a buffer.
        close_command = 'lua require("lua_file").close_buffer(%d)',
        -- set the command to run when right-clicking a buffer.
        right_mouse_command = 'lua require("lua_file").close_buffer(%d)',
        -- set the command to run when left-clicking a buffer.
        left_mouse_command = "buffer %d",
        -- set the command to run when middle-clicking a buffer.
        middle_mouse_command = nil,
        -- define some custom buffer offsets for special filetypes.
        offsets = {
            {
                filetype = "neo-tree",
                text = "Explorer",
                highlight = "Directory",
                padding = 1,
            },
            {
                filetype = "Outline",
                text = "Outline",
                highlight = "Title",
                padding = 1,
            },
        },
        -- show buffer icons.
        show_buffer_icons = true,
        -- show close icons for buffers.
        show_buffer_close_icons = true,
        -- show the close icon.
        show_close_icon = true,
        -- show tab indicators.
        show_tab_indicators = true,
        -- persist the buffer sort order.
        persist_buffer_sort = true,
        -- set the maximum length for buffer names.
        max_name_length = 18,
        -- set the maximum length for buffer prefixes.
        max_prefix_length = 15,
        -- set the tab size.
        tab_size = 18,
        -- use LSP diagnostics.
        diagnostics = "nvim_lsp",
        -- set the format for diagnostic indicators.
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        -- set the separator style.
        separator_style = "thin",
        -- enforce regular tab widths.
        enforce_regular_tabs = true,
        -- always show the bufferline.
        always_show_bufferline = true,
    },
})
