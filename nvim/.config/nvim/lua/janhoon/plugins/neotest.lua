return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-neotest/neotest-plenary",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-python",
		{ "fredrikaverpil/neotest-golang", version = "*" },
	},
	config = function()
		vim.keymap.set("n", "<leader>tn", function()
			require("neotest").run.run()
		end, { desc = "[T]est [N]earest test" })
		vim.keymap.set("n", "<leader>tf", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end, { desc = "[T]est [F]ile" })
		vim.keymap.set("n", "<leader>to", function()
			require("neotest").output.open()
		end, { desc = "[T]est Toggle [O]utput" })
		vim.keymap.set("n", "<leader>ts", function()
			require("neotest").summary.toggle()
		end, { desc = "[T]est Toggle [S]ummary" })
		vim.keymap.set("n", "<leader>tp", function()
			require("neotest").output_panel.toggle()
		end, { desc = "[T]est Toggle Output [P]anel" })

		require("neotest").setup({
			adapters = {
				require("neotest-jest"),
				require("neotest-vitest"),
				require("neotest-python")({
					python = ".venv/bin/python",
				}),
				require("neotest-golang"),
			},
		})
	end,
}
