-- define the different signs to be used for diagnostics and DAP
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
    { name = "DapStopped", text = "", texthl = "DiagnosticWarn" },
    { name = "DapBreakpoint", text = "", texthl = "DiagnosticInfo" },
    { name = "DapBreakpointRejected", text = "", texthl = "DiagnosticError" },
    { name = "DapBreakpointCondition", text = "", texthl = "DiagnosticInfo" },
    { name = "DapLogPoint", text = ".>", texthl = "DiagnosticInfo" },
}

-- define the signs using the above settings
for _, sign in ipairs(signs) do
    if not sign.texthl then
        sign.texthl = sign.name
    end
    vim.fn.sign_define(sign.name, sign)
end

-- define a function to toggle diagnostics on and off
function toggle_diagnostics()
    local diagnostics_options = {
        on = {
            enabled = true, -- enable diagnostics
            virtual_text = true, -- show virtual text for diagnostics
            signs = { active = signs }, -- use the defined signs for active diagnostics
            update_in_insert = true, -- update diagnostics in insert mode
            underline = true, -- underline diagnostics
            severity_sort = true, -- sort diagnostics by severity
            float = {
                focused = false, -- do not focus diagnostics float
                style = "minimal", -- use a minimalistic style for diagnostics float
                border = "rounded", -- use rounded borders for diagnostics float
                source = "always", -- show diagnostics float always
                header = "", -- do not show header for diagnostics float
                prefix = "", -- do not add prefix for diagnostics float
            },
        },
        off = {
            enabled = false, -- disable diagnostics
            virtual_text = false, -- do not show virtual text for diagnostics
            signs = true, -- show signs for diagnostics
            update_in_insert = false, -- do not update diagnostics in insert mode
            underline = false, -- do not underline diagnostics
            severity_sort = false, -- do not sort diagnostics by severity
            float = false, -- do not show diagnostics float
        },
    }
    -- toggle diagnostics based on the global 'diagnostics_enabled' variable
    if vim.g.diagnostics_enabled then
        vim.g.diagnostics_enabled = false
        vim.notify("Diagnostics off", nil, {
            title = "Diagnostics Toggle",
        })
    else
        vim.g.diagnostics_enabled = true
        vim.notify("Diagnostics on", nil, {
            title = "Diagnostics Toggle",
        })
    end
    -- update the diagnostics configuration based on the toggle status
    vim.diagnostic.config(diagnostics_options[vim.g.diagnostics_enabled and "on" or "off"])
end
