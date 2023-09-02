-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")

if not lspconfig_status then
    return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not cmp_nvim_lsp_status then
    return
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

local servers = {
    "pyright",
    "lua_ls",
    "bashls",
    "dockerls",
    "terraformls",
    "ansiblels",
}

local server_settings = {
    ["lua_ls"] = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
}

for _, server in pairs(servers) do
    lspconfig[server].setup({
        capabilities = capabilities,
        settings = server_settings[server],
    })
end
