local neotest = require('neotest')
local adapter_vim_test = require("neotest-vim-test")
local adapter_vitest = require("neotest-vitest")

neotest.setup({
    adapters = {
        adapter_vitest,
        adapter_vim_test({ignore_filetypes = {"markdown", "lua"}})
    },
})

