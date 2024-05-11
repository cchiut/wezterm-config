local wezterm = require('wezterm')

local module = {}

function module.apply_to_config(config)
  config.font = wezterm.font('CodeNewRoman Nerd Font')
  config.font_size = 14.8
  config.line_height = 1.1
  config.use_cap_height_to_scale_fallback_fonts = true
end

return module
