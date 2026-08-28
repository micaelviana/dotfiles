return {
	"MunsMan/kitty-navigator.nvim",
	build = {
		"cp navigate_kitty.py ~/.config/kitty",
		"cp pass_keys.py ~/.config/kitty",
	},
	opts = {
		keybindings = {
			left = "<A-h>",
			down = "<A-j>",
			up = "<A-k>",
			right = "<A-l>",
		},
	},
}
