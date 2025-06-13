return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
	opts = {
		-- add any opts here
		-- for example
		use_xml_format = false,
		cursor_applying_provider = "groq",
		provider = "claude",
		behavior = {
			enable_cursor_planning_mode = true,
		},
		providers = {
			groq = {
				__inherited_from = "openai",
				api_key_name = "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",
				endpoint = "https://api.groq.com/openai/v1/",
				model = "llama-3.3-70b-versatile",
				max_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
			},
			claude = {
				endpoint = "https://api.anthropic.com",
				model = "claude-sonnet-4-20250514",
				timeout = 30000, -- Timeout in milliseconds
				-- disable_tools = true, -- disable tools!
				extra_request_body = {
					temperature = 0,
					max_tokens = 4096,
				},
			},
		},
		behaviour = {
			enable_cursor_planning_mode = true,
			enable_claude_text_editor_tool_mode = true,
		},
		rag_service = {},
		-- provider = "openai",
		-- openai = {
		--   endpoint = "https://api.openai.com/v1",
		--   model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
		--   timeout = 30000, -- timeout in milliseconds
		--   temperature = 0, -- adjust if needed
		--   max_tokens = 4096,
		-- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
		-- },
		web_search_engine = {
			provider = "google",
		},
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"ibhagwan/fzf-lua", -- for file_selector provider fzf
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		-- "zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
