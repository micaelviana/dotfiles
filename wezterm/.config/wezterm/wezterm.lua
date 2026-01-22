-- Pull in the wezterm API

local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- For example, changing the color scheme:
--config.color_scheme = 'rose-pine-dawn'
config.color_scheme = "Everforest Dark Medium (Gogh)"

--config.font = wezterm.font('CodeNewRoman Nerd Font Mono')
config.font = wezterm.font_with_fallback({
	"Monaco",
	{ family = "Symbols Nerd Font Mono", scale = 0.75 },
})
config.font_size = 12.3
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } --disable ligatures

--experimental, didnt work on WSL
config.enable_kitty_graphics = true
config.enable_wayland = false

--enhance animations and speed
config.max_fps = 120
config.animation_fps = 10

config.default_cursor_style = "SteadyBar"
config.adjust_window_size_when_changing_font_size = false

config.window_close_confirmation = "NeverPrompt"

config.keys = {
	-- shif+return to enter new lines using Claude Code
	{ key = "Enter", mods = "SHIFT", action = wezterm.action({ SendString = "\x1b\r" }) },
	{
		key = "Enter", -- Replace with the key you want to disable (e.g., 'm')
		mods = "ALT", -- Replace with the modifier (e.g., 'CMD', 'CTRL|SHIFT')
		action = wezterm.action.DisableDefaultAssignment,
	},
	--popup to rename the current tab
	{
		key = "R",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new tab name",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{ key = "[", mods = "ALT", action = "ActivateCopyMode" },
	-- paste from the clipboard
	{ key = "p", mods = "ALT", action = act.PasteFrom("Clipboard") },
	-- paste from the primary selection
	{ key = "p", mods = "ALT", action = act.PasteFrom("PrimarySelection") },

	-- copy content
	{
		key = "y",
		mods = "ALT",
		action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	},

	-- split vertical
	{ key = "-", mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- split vertical
	{ key = "=", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	--navigation panes
	{
		key = "h",
		mods = "ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "t",
		mods = "ALT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},

	-- Toggles the zoom state of the current pane.
	-- A Zoomed pane takes up all available space in the tab, hiding all other panes while it is zoomed.
	-- Switching its zoom state off will restore the prior split arrangement.
	{
		key = "z",
		mods = "ALT",
		action = wezterm.action.TogglePaneZoomState,
	},

	{
		key = "o",
		mods = "CTRL|SHIFT",
		-- toggling opacity
		action = wezterm.action_callback(function(window, _)
			local overrides = window:get_config_overrides() or {}
			if overrides.window_background_opacity == 1.0 then
				overrides.window_background_opacity = 0.7
			else
				overrides.window_background_opacity = 1.0
			end
			window:set_config_overrides(overrides)
		end),
	},
}

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = act.PasteFrom("Clipboard"),
	},

	-- Scrolling up while holding CTRL increases the font size
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = "CTRL",
		action = act.IncreaseFontSize,
	},

	-- Scrolling down while holding CTRL decreases the font size
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = "CTRL",
		action = act.DecreaseFontSize,
	},
}

-- This is where you actually apply your config choice

-- and finally, return the configuration to wezterm
return config
