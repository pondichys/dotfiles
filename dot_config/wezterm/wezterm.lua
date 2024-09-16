-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration
local config = {}

-- Use the config_builder (newer version of Wezterm)
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you apply your config choices
-- Disable annoying beep sound
config.audible_bell = 'Disabled'

-- Set the color scheme
-- config.color_scheme = 'Catppuccin Macchiato'
config.color_scheme = 'Nord (Gogh)'

-- Use fish shell by default
config.default_prog = { '/usr/bin/fish' }

-- Set the font to Hack Nerd Font
-- This font must be available on the system!
config.font = wezterm.font 'Hack Nerd Font'

-- Hide tab bar if only one tab is active
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
-- Set background opacity
config.window_background_opacity = 0.9

-- Hide all window decorations except resize
-- config.window_decorations = "RESIZE"

-- Finally return the configuration to Wezterm
return config
