local wezterm = require('wezterm')

local config = wezterm.config_builder()

-- window
config.color_scheme = 'Tokyo Night (Gogh)'
config.text_background_opacity = 0.9
config.window_background_opacity = 0.9
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '2',
  bottom = '2',
}

-- font
config.font = wezterm.font('CodeNewRoman Nerd Font')
config.font_size = 14.8
config.line_height = 1.1
config.use_cap_height_to_scale_fallback_fonts = true

return config
