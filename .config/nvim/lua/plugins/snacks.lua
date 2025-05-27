return {
    "folke/snacks.nvim",
    opts = {
        notifier = { enabled = true },

        picker = {
            sources = {
                explorer = {
                    hidden = true,
                    -- show files ignored by git like node_modules
                    ignored = true,
                    exclude = { ".git" },
                },
            },
        },
    },
}
