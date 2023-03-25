local tree = require("nvim-tree")

tree.setup({
    view = {
        relativenumber = true,
        width = 50,
        float = {
            enable = true,
        }
    },
    filters = {
        dotfiles = false,
    },
    git = {
        ignore = false,
        show_on_open_dirs = false,
    }
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", { silent = true })
