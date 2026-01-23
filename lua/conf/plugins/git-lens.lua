return {
	{
		"APZelos/blamer.nvim",
		event = { "BufReadPost", "BufNewFile" },

		-- IMPORTANT: set globals in init (not config)
		init = function()
			vim.g.blamer_enabled = true -- default is 0/false :contentReference[oaicite:1]{index=1}
			vim.g.blamer_delay = 300 -- default 1000ms :contentReference[oaicite:2]{index=2}
			vim.g.blamer_show_in_insert_modes = 0 -- default 1 :contentReference[oaicite:3]{index=3}
			vim.g.blamer_show_in_visual_modes = 0 -- default 1 :contentReference[oaicite:4]{index=4}
			vim.g.blamer_relative_time = 1 -- default 0 :contentReference[oaicite:5]{index=5}
			vim.g.blamer_prefix = "  " -- default ' ' :contentReference[oaicite:6]{index=6}

			-- Optional formatting (see note below about Neovim nightly):
			-- vim.g.blamer_template = "<committer>, <committer-time> • <summary>" :contentReference[oaicite:7]{index=7}
			-- vim.g.blamer_date_format = "%Y-%m-%d %H:%M" :contentReference[oaicite:8]{index=8}
		end,

		config = function()
			-- Default is "link Blamer Comment" :contentReference[oaicite:9]{index=9}
			-- Keep this only if you want to force/link it explicitly:
			vim.cmd("highlight default link Blamer Comment")
		end,
	},
}
