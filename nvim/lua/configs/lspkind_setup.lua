-- import lspkind plugin safely
local lspkind_status, lspkind = pcall(require, "lspkind")

if not lspkind_status then
    return
end

lspkind.init({
    mode = "symbol",
    symbol_map = {
        NONE = "",
        Array = "",
        Boolean = "⊨",
        Class = "",
        Constructor = "",
        Key = "",
        Namespace = "",
        Null = "NULL",
        Number = "#",
        Object = "⦿",
        Package = "",
        Property = "",
        Reference = "",
        Snippet = "",
        String = "𝓐",
        TypeParameter = "",
        Unit = "",
    },
})
