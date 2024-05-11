local wezterm = require('wezterm')

local config = wezterm.config_builder()

-- window
config.color_scheme = 'Tokyo Night (Gogh)'
config.text_background_opacity = 0.9
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '2',
  bottom = '2',
}

-- font
config.font = wezterm.font_with_fallback {
  'CodeNewRoman Nerd Font',
  'JetBrains Mono',
  'Noto Color Emoji',
  { family = 'Symbols Nerd Font Mono', scale = 0.75 }
}
config.line_height = 1.1
config.use_cap_height_to_scale_fallback_fonts = true

if wezterm.target_triple == 'aarch64-apple-darwin' then
  config.window_background_opacity = 0.9

  -- font
  config.font_size = 14.8
end

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  -- font
  config.font_size = 11

  -- WSL
  config.wsl_domains = {
    {
      name = 'WSL:Debian',
      distribution = 'Debian',
    }
  }

  config.default_domain = 'WSL:Debian'
end

return config
