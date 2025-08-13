return {
	"windwp/nvim-ts-autotag",
	lazy = false,
	opts = {
		opts = {
			-- Defaults
			enable_close = true, -- Auto close tags
			enable_rename = true, -- Auto rename pairs of tags
			--It is not a default
			enable_close_on_slash = true, -- Auto close on trailing </
		},
	},
}
