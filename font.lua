local wezterm = require('wezterm')

local module = {}

function module.apply_to_config(config)
  config.font_size = 14.0
  config.use_cap_height_to_scale_fallback_fonts = true
end

return module
