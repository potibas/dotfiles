local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

-- Appearance
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("IosevkaTerm Nerd Font Mono")
config.font_size = 20.0
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.initial_cols = 120
config.initial_rows = 30

-- Behaviour
config.native_macos_fullscreen_mode = true
config.window_close_confirmation = "NeverPrompt"

-- Key Bindings
config.keys = {

	-- Cmd+Ctrl+f toggles full screen like a good MacOS citizen
	{ key = "f", mods = "CMD|CTRL", action = act.ToggleFullScreen },
}

config.mouse_bindings = {

	-- shift+click opens hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "SHIFT",
		action = act.OpenLinkAtMouseCursor,
	},
}

return config
