local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_tab_bar = false
config.color_scheme = 'Catppuccin Mocha'
config.background = {
    {
        source = {
            File = '/home/marty/.dotfiles/wallpapers/a_narrow_street_with_shops_and_signs.png'
        },
        opacity = 1,
    },
    {
        source = {
            Color = "#11111b"
        },
        width = "100%",
        height = "100%",
        opacity = 0.95,
    },
}
config.font = wezterm.font('JetBrainsMono Nerd Font Mono')
config.font_size = 14
config.enable_wayland = false

return config
