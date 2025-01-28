local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

config.keys = {
    -- paste from the clipboard
    {
        key = 'V',
        mods = 'CMD',
        action = act.PasteFrom 'Clipboard'
    },
    {
        key = 'V',
        mods = 'CMD',
        action = act.PasteFrom 'PrimarySelection'
    },
    {
        key = 'C',
        mods = 'CTRL',
        action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection'
    },
    {
        key="LeftArrow",
        mods="OPT",
        action=wezterm.action{SendString="\x1bb"}
    },
    {
        key="RightArrow",
        mods="OPT",
        action=wezterm.action{SendString="\x1bf"}
    },
}

config.enable_tab_bar = false
config.color_scheme = 'Catppuccin Mocha'
config.background = {
    {
        source = {
            File = '/Users/mpavalko/.dotfiles/wallpapers/a_narrow_street_with_shops_and_signs.png'
        },
        opacity = 1,
    },
    {
        source = {
            Color = "#11111b"
        },
        width = "100%",
        height = "100%",
        opacity = 0.90,
    },
}
config.font = wezterm.font('JetBrainsMono Nerd Font Mono')
config.font_size = 20
config.enable_wayland = false

return config
