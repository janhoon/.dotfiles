require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key"
			}
		},
        file_ignore_patterns = {
           "node_modules",
           ".git/*"
       },
	},
	pickers = {
	},
	extensions = {
	}
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function () return builtin.find_files({hidden = true}) end, {})
vim.keymap.set('n', '<leader>fj', function () return builtin.live_grep({hidden = true}) end, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fgb', builtin.git_branches, {})
