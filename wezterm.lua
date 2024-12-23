local wezterm = require('wezterm')

local config = wezterm.config_builder()

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Catppuccin Mocha (Gogh)'
  else
    return 'Catppuccin Latte (Gogh)'
  end
end

-- window
config.color_scheme = scheme_for_appearance(get_appearance())
config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '4',
  bottom = '4',
}

-- tab
config.hide_tab_bar_if_only_one_tab = true

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
  -- font
  config.font_size = 16
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
