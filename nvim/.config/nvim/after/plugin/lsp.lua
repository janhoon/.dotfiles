local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'rust_analyzer',
    'jsonls',
})


-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('jsonls', {
    filetypes = { 'json', 'jsonc', 'avsc' }
})

local java_bundles = {
    vim.fn.glob("$HOME/.config/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1),
}
vim.list_extend(java_bundles, vim.split(vim.fn.glob("$HOME/.config/nvim/vscode-java-test/server/*.jar", 1), "\n"))
lsp.configure('jdtls', {
    init_options = {
        bundles = java_bundles;
    },
    on_attach = function(client, bufnr)
        local jdtls = require("jdtls")
        jdtls.setup_dap({ hotcodereplace = 'auto' })
        jdtls.setup.add_commands()
    end
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
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
    local opts = { buffer = bufnr, remap = false }
    local neotest = require('neotest')

    vim.keymap.set("n", "<leader>tt", neotest.run.run, {noremap = true})
    vim.keymap.set("n", "<leader>tT", function () neotest.run.run(vim.fn.expand("%")) end, {noremap = true})
    vim.keymap.set("n", "<leader>td", function () neotest.run.run({strategy = "dap"}) end, {noremap = true})
    vim.keymap.set("n", "<leader>tD", function () neotest.run.run({vim.fn.expand("%"), strategy = "dap"}) end, {noremap = true})

    -- only map keys if the client is java
    if client.name == "jdtls" then
        local jdtls = require("jdtls")
        jdtls.setup_dap({ hotcodereplace = 'auto' })
        require("jdtls.dap").setup_dap_main_class_configs()
        vim.keymap.set('n', '<leader>tt', jdtls.test_nearest_method, opts)
        vim.keymap.set('n', '<leader>tT', jdtls.test_class, opts)
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
