-- import telescope plugin safely
local telescope_status, telescope = pcall(require, "telescope")

if not telescope_status then
    return
end

-- import telescope actions safely
local actions_status, actions = pcall(require, "telescope.actions")

if not actions_status then
    return
end

-- configure Telescope
telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = "❯ ",
        path_display = { "truncate" },
        shorten_path = true,
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = { prompt_position = "top", preview_width = 0.55 },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
                ["q"] = actions.close,
            },
        },
    },
})

-- load extensions
telescope.load_extension("fzf")
