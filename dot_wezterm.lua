-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end
enable_kitty_graphics = true

-- This is where you actually apply your config choices

-- Window:
config.color_scheme = "Dracula"
config.window_background_opacity = 0.9
config.use_fancy_tab_bar = false
wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

-- Font:
config.font = wezterm.font("PlemolJP Console NF")
config.font_size = 13
config.use_ime = true

-- KeyMap
config.keys = {
  {
    key = "LeftArrow",
    mods = "CTRL|SHIFT",
    action = act.ActivatePaneDirection("Left"),
  },
  {
    key = "RightArrow",
    mods = "CTRL|SHIFT",
    action = act.ActivatePaneDirection("Right"),
  },
  {
    key = "UpArrow",
    mods = "CTRL|SHIFT",
    action = act.ActivatePaneDirection("Up"),
  },
  {
    key = "DownArrow",
    mods = "CTRL|SHIFT",
    action = act.ActivatePaneDirection("Down"),
  },
}

-- and finally, return the configuration to wezterm
return config
