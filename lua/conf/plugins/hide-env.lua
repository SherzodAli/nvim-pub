-- lua/plugins/streamer-mode.lua
return {
	"kolkhis/streamer-mode.nvim",

	lazy = false,

	cmd = {
		"StreamerMode",
		"StreamerModeOff",
		"StreamerModeSecure",
		"StreamerModeEdit",
		"StreamerModeSoft",
		"SM",
		"SMoff",
		"SMsecure",
		"SMedit",
		"SMsoft",
	},

	keys = {
		{ "<leader>sm", "<cmd>SM<CR>", desc = "Streamer Mode: toggle" },
		{ "<leader>sS", "<cmd>SMsecure<CR>", desc = "Streamer Mode: secure level" },
		{ "<leader>se", "<cmd>SMedit<CR>", desc = "Streamer Mode: edit level" },
		{ "<leader>ss", "<cmd>SMsoft<CR>", desc = "Streamer Mode: soft level" },
	},

	opts = function()
		-- wrap word into vim regex (key -> matches *key*)
		-- also supports comment (#) before it
		local function kw(s)
			local prefix = [[\%(\s*#\s*\)\?]]
			if s:match("^[%w_]+$") then
				-- plain token keyword, e.g. key / token / secret
				return prefix .. [[\k*]] .. s .. [[\k*]]
			end

			-- literal keyword with punctuation, e.g. "$env:" or "credential.helper"
			-- \V = very nomagic (treats the text literally), \m restores normal magic
			local lit = s:gsub([[\]], [[\\]])
			return prefix .. [[\V]] .. lit .. [[\m]]
		end

		local raw_keywords = {
			"key",
			"token",
			"secret",
			"pass",
			"cred",
			"db",
			"id",
			"port",
			"host",
			"email",
			"password",
			"name",
			"url",
			"jwt",

			"$env:",
			"export",
			"alias",
			"IdentityFile",
			"server",
			"credential.helper",
		}

		return {
			default_state = "off",
			level = "secure", -- | 'edit' | 'soft'
			conceal_char = "*", -- Default. This is what will be displayed instead of your secrets.

			-- Streamer Mode will apply to any path in here. Defaults to all paths.
			-- This means that Streamer Mode will hide any of the `keywords` below
			-- when inside any of these directories or filetypes.
			paths = {
				"*/*.yaml", -- Enables Streamer Mode for all YAML files.
				"*/.bash*", -- Enables Streamer Mode for all Bash configuration files.
				"*/.zsh*",
				"*/.*profile",
				"~/*", -- Enables Streamer Mode for all files in your home directory.
				"*/.env",
				"*/.env.*",
				"*/.envrc",
				"*/dotenv/*",
				"~/.ssh/*",
				"*/.gitconfig",
				"*/secrets/*",
				"*/secret/*",
			},
			-- Exclude all the default keywords and only use the ones you specify
			exclude_all_default_keywords = true,

			-- Only exclude the given keywords from the default values
			exclude_default_keywords = {},

			-- Exclude the default path (which is '*', all paths) and only use the ones you specify
			exclude_default_paths = true,

			-- Same as `exclude_default_paths`
			exclude_all_default_paths = true,

			-- Any text appearing after one of the keywords specified here will be concealed.
			-- They are case-insensitive.
			-- E.g., passing in 'API_KEY' will conceal both 'API_KEY' and 'api_key'.
			-- keywords = vim.tbl_map(kw, raw_keywords),
			keywords = vim.tbl_map(kw, raw_keywords),
		}
	end,

	config = function(_, opts)
		require("streamer-mode").setup(opts) -- :contentReference[oaicite:11]{index=11}
	end,
}
