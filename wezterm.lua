local font = require('font')
local config = {}

font.apply_to_config(config)

config.color_scheme = 'Tokyo Night (Gogh)'
config.text_background_opacity = 0.9
config.window_background_opacity = 0.9
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '2',
  bottom = '2',
}

return config
