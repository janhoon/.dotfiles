vim.keymap.set("n", "<leader>S", function() return require("spectre").open() end, {})

vim.keymap.set("n", "<leader>sw", function() return require("spectre").open({select_word=true}) end, {})
vim.keymap.set("v", "<leader>s", function() return require("spectre").open({select_word=true}) end, {})
