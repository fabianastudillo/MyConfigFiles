-- Pull in the wezterm API
local wezterm = require('wezterm')

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config = {
    audible_bell = "Disabled",
    enable_tab_bar = true,  -- Ensure tabs are enabled
    hide_tab_bar_if_only_one_tab = true, -- Always show tab bar
    use_fancy_tab_bar = true, -- Enables a fancier tab bar
    tab_max_width = 25,  -- Adjusts tab width
    automatically_reload_config = true,
    default_prog = {"C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"},
    --font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true}),
    font = wezterm.font('Hack Nerd Font', { weight = 'Regular', italic = false}),
    font_size = 13.0,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    default_cursor_style = "BlinkingBar",
    color_scheme = "Nord (Gogh)",
    window_padding = {
        left = 3,
        right = 3,
        top = 0,
        bottom = 0,
      },
    background = {
        {
            source = {
                File = (os.getenv("USERPROFILE") or os.getenv("HOME")) .. "\\peakpx.jpg",
            },
            hsb = {
                hue = 1.0,
                saturation = 1.02,
                brightness = 0.25,
            },
            width = "100%",
            height = "100%",
            opacity = 0.55,
        },
        {
            source = {
                Color = "#282c35"
            },
            width = "100%",
            height = "100%",
            opacity = 0.55,
        }
    },
    keys = {
        -- Open a new tab with the same working directory
        {
          key = 't',
          mods = 'CTRL|SHIFT',
          action = wezterm.action.SpawnTab 'CurrentPaneDomain',
        },
        {
            key = 'y',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.SpawnTab 'CurrentPaneDomain',
            -- action = wezterm.action.SpawnCommandInNewTab {
            --  args = { 'wsl -d Ubuntu-24.04' },
            -- },
        },
        -- Split horizontally in the same domain
        {
            key = "|",
            mods = "CTRL|SHIFT",
            action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
        },
        -- Split vertically in the same domain
        {
            key = "-",
            mods = "CTRL|SHIFT",
            action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
        },
      },
}

-- and finally, return the configuration to wezterm
return config
