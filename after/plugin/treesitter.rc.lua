local status, treesitter_config = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter_config.setup {
	highlight = {
		enable = true,
		disable = {}
	},
	indent = {
		enable = false,
		disable = {}
	},
  autotag = {
    enable = true,
  },
	ensure_installed = {
		"tsx",
		"toml",
		"fish",
		"json",
		"yaml",
		"html",
		"scss",
	}
}
