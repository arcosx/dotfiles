local wezterm = require 'wezterm';

-- JetBrainsMono Nerd Font Mono 
-- https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/font-info.md

return {
    font = wezterm.font_with_fallback({"JetBrainsMono Nerd Font Mono", {
        family = "JetBrains Mono"
    }}),
    keys = {{
        key = "w",
        mods = "CTRL",
        action = wezterm.action {
            CloseCurrentPane = {
                confirm = true
            }
        }
    }, {
        key = "d",
        mods = "CTRL",
        action = wezterm.action {
            SplitHorizontal = {
                domain = "CurrentPaneDomain"
            }
        }
    }, {
        key = "d",
        mods = "CTRL|SHIFT",
        action = wezterm.action {
            SplitVertical = {
                domain = "CurrentPaneDomain"
            }
        }
    }},
    color_scheme = "AdventureTime"
}
