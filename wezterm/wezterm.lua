-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local action = wezterm.action

config.front_end = "WebGpu"

config.color_scheme = "Gruvbox dark, medium (base16)"
config.font_size = 13
config.audible_bell = "Disabled"
config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 1,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 200,
}
config.colors = {
	visual_bell = "#200000",
}
config.adjust_window_size_when_changing_font_size = false
config.native_macos_fullscreen_mode = true
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- config.window_frame = {
-- 	border_left_width = "2px",
-- 	border_right_width = "2px",
-- 	border_bottom_height = "2px",
-- 	border_top_height = "2px",
-- 	border_left_color = "#333",
-- 	border_right_color = "#333",
-- 	border_bottom_color = "#333",
-- 	border_top_color = "#333",
-- }

-- config.window_padding = {
-- 	left = "9px",
-- 	right = "9px",
-- 	top = "3px",
-- 	bottom = "3px",
-- }

config.keys = {
	{ mods = "CMD", key = "Enter", action = action.ToggleFullScreen },
	{ mods = "CMD", key = "[", action = action.ActivatePaneDirection("Prev") },
	{ mods = "CMD", key = "]", action = action.ActivatePaneDirection("Next") },
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
}

if wezterm.target_triple ~= "x86_64-pc-windows-msvc" then
	table.insert(config.keys, { mods = "CMD", key = "m", action = action.SplitVertical })
	table.insert(config.keys, { mods = "CMD", key = "l", action = action.SplitHorizontal })
else
end

-- and finally, return the configuration to wezterm
return config
