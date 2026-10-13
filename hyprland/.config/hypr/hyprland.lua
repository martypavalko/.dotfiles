------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DP-2",
    mode     = "2560x1440@144",
    position = "0x0",
    scale    = "1",
    vrr      = 2
})

hl.monitor({
    output   = "DP-3",
    mode     = "2560x1440@144",
    position = "0x-1440",
    scale    = "1",
    vrr      = 2
})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "foot"
local fileManager = "dolphin"
local menu = "wofi -S drun"
local browser = "librewolf"


-------------------
---- AUTOSTART ----
-------------------

require("autostart")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

require("looknfeel")

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + w", hl.dsp.window.close())
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + t", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + p", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + slash", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + h",  hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + k",    hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + j",  hl.dsp.window.swap({ direction = "down" }))

hl.bind("CTRL + ALT + TAB", hl.dsp.workspace.move({ monitor = "+1" }))

hl.bind(mainMod .. "+ f", hl.dsp.window.fullscreen())
hl.bind(mainMod .. "+ z", hl.dsp.window.fullscreen({ mode = "maximized" }))

-- hl.bind(mainMod .. "+ CTRL + l", hl.dsp.exec_cmd("hyprlock"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + ALT +" .. key,        hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- LMB
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
-- RMB
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize({ keep_aspect_ratio = true }), { mouse = true })
-- MMB
hl.bind(mainMod .. " + mouse:274", hl.dsp.window.resize(), { mouse = true })


-- Laptop multimedia keys for volume and LCD brightness
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
-- hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
-- hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

local ipc = "noctalia msg "

-- Noctalia

-- Core binds
hl.bind(mainMod .. "+Space", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(mainMod .. "+period", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"))
hl.bind(mainMod .. "+comma", hl.dsp.exec_cmd(ipc .. "settings-toggle"))
-- hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. "window-switcher hold"))
hl.bind(mainMod .. "+ CTRL + l", hl.dsp.exec_cmd(ipc .. "session lock"))

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))

-- Noctalia Settings
hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- ++++ TAGGING +++++
hl.window_rule({ match = { class = "foot" }, tag = "+term" })

hl.window_rule({ match = { class = "steam" }, tag = "+game_launcher" })

hl.window_rule({ match = { class = "librewolf" }, tag = "+browser" })
hl.window_rule({ match = { class = "brave-browser" }, tag = "+browser" })

hl.window_rule({ match = { class = "discord" }, tag = "+chat" })

hl.window_rule({ match = { class = ".*steam_app.*" }, tag = "+game" })

-- ++++ WORKSPACE RULES ++++
hl.window_rule({ match = { tag = "browser" }, workspace = 1 })
hl.window_rule({ match = { tag = "term" }, workspace = 2 })
hl.window_rule({ match = { tag = "chat" }, workspace = 3 })
hl.window_rule({ match = { tag = "game_launcher" }, workspace = 9 })
hl.window_rule({ match = { tag = "game" }, workspace = 10, no_initial_focus = true })

hl.window_rule({
    match = { title = "Picture-in-Picture" },
    float = true,
    pin = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- Rules for noctalia
hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})


-- For Noctalia Color templates
require("noctalia").apply_theme()
