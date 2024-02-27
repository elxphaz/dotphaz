local wezterm = require 'wezterm'

local config = {}

config.color_scheme = 'Adventure'
config.font = wezterm.font 'Cascadia Code'
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.font_size = 14.0

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
