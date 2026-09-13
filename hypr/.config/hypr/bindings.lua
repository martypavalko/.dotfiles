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

-- SUPER + J was previously: Toggle window split
hl.unbind("SUPER + J")
-- SUPER + K was previously: Keybindings
hl.unbind("SUPER + K")
-- SUPER + L was previously: Toggle workspace layout
hl.unbind("SUPER + L")

-- Vim-style window focus: SUPER + H/J/K/L replaces the arrow keys.
hl.unbind("SUPER + LEFT")
hl.unbind("SUPER + RIGHT")
hl.unbind("SUPER + UP")
hl.unbind("SUPER + DOWN")

o.bind("SUPER + H", "Focus on left window", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + L", "Focus on right window", hl.dsp.focus({ direction = "r" }))
o.bind("SUPER + K", "Focus on above window", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + J", "Focus on below window", hl.dsp.focus({ direction = "d" }))

-- Vim-style window swap: SUPER SHIFT + H/J/K/L replaces the arrow keys.
hl.unbind("SUPER + SHIFT + LEFT")
hl.unbind("SUPER + SHIFT + RIGHT")
hl.unbind("SUPER + SHIFT + UP")
hl.unbind("SUPER + SHIFT + DOWN")

o.bind("SUPER + SHIFT + H", "Move window to the left`", hl.dsp.window.move({ direction = "l" }))
o.bind("SUPER + SHIFT + L", "Move window to the right", hl.dsp.window.move({ direction = "r" }))
o.bind("SUPER + SHIFT + K", "Move window up", hl.dsp.window.move({ direction = "u" }))
o.bind("SUPER + SHIFT + J", "Move window down", hl.dsp.window.move({ direction = "d" }))

-- Vim-style window swap: SUPER ALT + H/J/K/L replaces the arrow keys.
hl.unbind("SUPER + ALT + K")

o.bind("SUPER + ALT + H", "Swap window to the left`", hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + ALT + L", "Swap window to the right", hl.dsp.window.swap({ direction = "r" }))
o.bind("SUPER + ALT + K", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + ALT + J", "Swap window down", hl.dsp.window.swap({ direction = "d" }))

hl.unbind("SUPER + SLASH")
hl.unbind("SUPER + ALT + SLASH")

o.bind("SUPER + SLASH", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")

hl.unbind("CTRL + ALT + TAB")

o.bind("CTRL + ALT + TAB", "Toggle workspace layout", hl.dsp.workspace.move({ monitor = "+1" }))
