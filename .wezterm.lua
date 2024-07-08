-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Gruvbox Material (Gogh)"
-- config.font = wezterm.font("FiraCode Nerd Font")
config.font = wezterm.font({
	family = "CommitMono",
	harfbuzz_features = {
		"zero",
		"cv04",
		"cv02",
		"calt",
		"liga",
		"dlig",
		"ss01",
		"ss02",
		"ss03",
		"ss04",
		"ss05",
		"ss06",
		"ss07",
		"ss08",
	},
})

config.enable_tab_bar = false
config.window_decorations = "NONE"
config.enable_wayland = false
config.default_prog = { "zellij" }
config.window_close_confirmation = "NeverPrompt"
config.keys = {
	{
		key = "F11",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- and finally, return the configuration to wezterm
return config
