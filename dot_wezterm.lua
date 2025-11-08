-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end
-- Set CTRL+G as the leader key (mod equivalent)
config.leader = {
  key = "g",
  mods = "CTRL",
  timeout_milliseconds = 1000,
}
enable_kitty_graphics = true

-- This is where you actually apply your config choices

-- Window:
config.color_scheme = "Dracula"
config.tab_bar_at_bottom = true
config.window_background_opacity = 0.875
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

-- Font:
config.font = wezterm.font("PlemolJP Console NF")
config.font_size = 14
config.use_ime = true

-- KeyMap
config.keys = {
  {
    key = "LeftArrow",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Left"),
  },
  {
    key = "RightArrow",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Right"),
  },
  {
    key = "UpArrow",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Up"),
  },
  {
    key = "DownArrow",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Down"),
  },
  {
    key = "%",
    mods = "LEADER",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = '"',
    mods = "LEADER",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
}



-- and finally, return the configuration to wezterm
return config
