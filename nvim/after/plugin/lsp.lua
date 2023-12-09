local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
        'lua_ls',
        'jdtls',
        'clangd'
})


lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
                error = 'E',
                warn = 'W',
                hint = 'H',
                info = 'I'
        }
})

lsp.on_attach(function(client, bufnr)
        local opts = {buffer = bufnr, remap = false}

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.implementation() end, opts)
end)



lsp.setup()

require('lspconfig').clangd.setup({
        on_attach = require('lsp-format').on_attach
})

require('lspconfig').kotlin_language_server.setup{}

require('lspconfig').lua_ls.setup {
        settings = {
                Lua = {
                        diagnostics = {
                                globals = {
                                        'vim'
                                },
                        },
                },
        },
}

local cmp = require('cmp')


cmp.setup({
        preselect = 'item',
        completion = {
                completeopt = 'menu,menuone,noinsert',
        },
        mapping = {
                ['<CR>'] = cmp.mapping.confirm({select = true}),
        },
})


