return {
	{
		"folke/sidekick.nvim",
		opts = {
			nes = {
				enabled = false,
			},
			cli = {
				watch = true, -- notify Neovim of file changes done by AI CLI tools
				---@class sidekick.win.Opts
				win = {
					---@param terminal sidekick.cli.Terminal
					config = function(terminal)
						local layouts = { claude = "right", codex = "left" }
						local layout = layouts[terminal.tool.name]
						if layout then
							terminal.opts.layout = layout
							terminal.opts.split.width = 0.5
						end
					end,
					split = {
						width = 0.5, -- 0.x values mean percentages of the screen width
					},
					keys = {
						prompt = false,
					},
				},
				prompts = {
					ask = "ask me using AskUserQuestion tool",
					plan = "Create a task plan based on the following requirements. For abstract requirements, use the AskUserQuestion tool to ask the user questions and clarify them. Remember to use the create-persistence-plan skill to generate the plan file from the created plan.\n# What we want to do",
					fix = "You're export engineer, Fix {this} quickly",
					review = "You're export engineer, Review {this} quickly",
					-- default settings for prompts
					-- temperature = 0.7,
				},
			},
		},
		keys = {
			{
				"<tab>",
				function()
					-- if there is a next edit, jump to it, otherwise apply it if any
					if not require("sidekick").nes_jump_or_apply() then
						return "<Tab>" -- fallback to normal tab
					end
				end,
				expr = true,
				desc = "Goto/Apply Next Edit Suggestion",
			},
			{
				"<c-.>",
				function()
					require("sidekick.cli").toggle({ name = "claude", focus = true })
				end,
				desc = "Sidekick Toggle Claude",
				mode = { "n", "t", "i", "x" },
			},
			{
				"<c-,>",
				function()
					require("sidekick.cli").toggle({ name = "codex", focus = true })
				end,
				desc = "Sidekick Toggle Codex",
				mode = { "n", "t", "i", "x" },
			},
			{
				"<leader>as",
				function()
					require("sidekick.cli").select()
				end,
				desc = "Select CLI",
			},
			{
				"<leader>ad",
				function()
					require("sidekick.cli").close()
				end,
				desc = "Detach a CLI Session",
			},
			{
				"<leader>at",
				function()
					require("sidekick.cli").send({ msg = "{this}" })
				end,
				mode = { "x", "n" },
				desc = "Send This",
			},
			{
				"<leader>af",
				function()
					require("sidekick.cli").send({ msg = "{file}" })
				end,
				desc = "Send File",
			},
			{
				"<leader>av",
				function()
					require("sidekick.cli").send({ msg = "{selection}" })
				end,
				mode = { "x" },
				desc = "Send Visual Selection",
			},
			{
				"<leader>ap",
				function()
					require("sidekick.cli").prompt()
				end,
				mode = { "n", "x" },
				desc = "Sidekick Select Prompt",
			},
		},
	},
}
