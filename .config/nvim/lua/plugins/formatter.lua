return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            -- svelte = { "prettier" },
        },

        formatters = {
            prettier = {
                args = {
                    "--single-quote=false",
                    "--jsx-single-quote=false",
                    "--trailing-comma=all",
                    "--semi=true",
                    "--tab-width=4",
                    "--use-tabs=false",
                    "--print-width=100",
                    "$FILENAME",
                },
            },
        },
    },
}
