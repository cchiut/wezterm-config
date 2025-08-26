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

config.color_scheme = scheme_for_appearance(get_appearance())

-- font
config.use_cap_height_to_scale_fallback_fonts = true

if wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
  config.window_background_opacity = 0.9
  config.color_scheme = 'Catppuccin Mocha (Gogh)'
  config.enable_wayland = true

  config.window_padding = {
    left = '1cell',
    right = '1cell',
    top = '4px',
    bottom = '0',
  }
  -- font
  config.font = wezterm.font_with_fallback {
    'DejaVuSansM Nerd Font',
    'JetBrains Mono Nerd Font',
    'Noto Color Emoji',
    { family = 'Symbols Nerd Font Mono', scale = 0.75 }
  }
  config.font_size = 12

  -- tab
  config.hide_tab_bar_if_only_one_tab = true
end

if wezterm.target_triple == 'aarch64-apple-darwin' then
  config.window_background_opacity = 0.9
  config.macos_window_background_blur = 45

  config.window_padding = {
    left = '1cell',
    right = '0.5cell',
    top = '12px',
    bottom = '0',
  }

  -- font
  config.font = wezterm.font_with_fallback {
    'DejaVuSansM Nerd Font',
    'JetBrains Mono',
    'Noto Color Emoji',
    { family = 'Symbols Nerd Font Mono', scale = 0.75 }
  }
  config.font_size = 12.8
  
  -- tab
  config.hide_tab_bar_if_only_one_tab = true
end

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.window_background_opacity = 0
  config.win32_system_backdrop = 'Tabbed'

  config.window_padding = {
    left = '1cell',
    right = '1cell',
    top = '0',
    bottom = '0',
  }

  -- font
  config.font = wezterm.font_with_fallback {
    'Cascadia Code',	
    'JetBrains Mono',
    'Noto Color Emoji',
    { family = 'Symbols Nerd Font Mono', scale = 0.75 }
  }
  config.font_size = 12

  -- WSL
  config.wsl_domains = {
    {
      name = 'WSL:Debian',
      distribution = 'Debian',
    }
  }
  
  -- launch menu
  config.default_prog = { 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe', '-NoLogo' }
  
  config.launch_menu = {
    {
      label = 'Debian WSL',
      domain = { DomainName = 'WSL:Debian' },
    }
  }
  
end

return config
