-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

hl.unbind("SUPER + CTRL + P")
o.bind("SUPER + CTRL + P", "Capture Screenshot", "omarchy-capture-screenshot")

hl.bind(
  "SUPER + SHIFT + bracketright",
  hl.dsp.send_shortcut({ mods = "CTRL", key = "Tab" })
)

hl.bind(
  "SUPER + SHIFT + bracketleft",
  hl.dsp.send_shortcut({ mods = "SHIFT + CTRL", key = "Tab" })
)

-- Toggle keyboard layout with Super+[
o.bind(
  "SUPER + bracketleft",
  "Switch keyboard layout",
  "~/.local/bin/keyboard-layout-next"
)

-- Use Shift for moving to the scratchpad, like regular workspaces
hl.unbind("SUPER + ALT + S")
hl.unbind("SUPER + SHIFT + S")
hl.bind(
  "SUPER + SHIFT + S",
  hl.dsp.window.move({ workspace = "special:scratchpad" })
)

-- Show/hide the coding scratchpad
hl.bind(
  "SUPER + semicolon",
  hl.dsp.workspace.toggle_special("coding")
)

-- Move the focused window into it
hl.bind(
  "SUPER + SHIFT + semicolon",
  hl.dsp.window.move({ workspace = "special:coding" })
)

hl.config({
  binds = {
    pass_mouse_when_bound = false, -- consumes bound mouse events, so the application underneath shouldn’t scroll while you zoom.
    scroll_event_delay = 0,        -- removes the wheel-binding cooldown, making zoom respond to every wheel step
  },
})

local function screen_zoom(multiplier)
  local current = hl.get_config("cursor.zoom_factor") or 1
  hl.config({
    cursor = {
      zoom_factor = math.max(1, math.min(8, current * multiplier)),
      zoom_detached_camera = false,
    }
  })
end

-- ALT + mouse wheel scroll up = Zoom In
hl.bind("ALT + mouse_up", function()
  screen_zoom(1.2)
end)

-- ALT + mouse wheel scroll down = Zoom Out
hl.bind("ALT + mouse_down", function()
  screen_zoom(1 / 1.2)
end)

-- ALT + right click = reset zoom
hl.bind("ALT + mouse:273", function()
  hl.config({ cursor = { zoom_factor = 1 } })
end)
