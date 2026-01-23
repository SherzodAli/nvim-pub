-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	},
	lazy = false,
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		filesystem = {
			hijack_netrw_behavior = "open_default", -- или "open_current"
			follow_current_file = {
				enabled = true, -- автоподсветка/переход к текущему файлу
				leave_dirs_open = false, -- по желанию: закрывать неактуальные директории
			},
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
}
