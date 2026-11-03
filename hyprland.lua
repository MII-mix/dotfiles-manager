local config_dir = (os.getenv("HOME") or "") .. "/.config/hypr"
package.path = table.concat({
    config_dir .. "/?.lua",
    config_dir .. "/?/init.lua",
    package.path,
}, ";")

-- Clear cached modules so they re-execute on reload (ensures binds/rules re-register)
for _, mod in ipairs({"monitors", "inputs", "keybind", "windowrules", "animations", "themes.theme"}) do
    package.loaded[mod] = nil
end

require("monitors")
require("startup")
require("inputs")
require("keybind")
require("windowrules")
require("animations")
require("themes.theme")

hl.config({
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        anr_missed_pings = 5,
        allow_session_lock_restore = true,
    },
    xwayland = {
        force_zero_scaling = true,
    },
    general = {
        snap = {
            enabled = true,
        },
    },
})

-- For Noctalia Color templates
require("noctalia").apply_theme()

-- --- Fastfetch & Krabby Background Widget Setup (DISABLED) ---

-- hl.window_rule({
--     name = "widget-properties",
--     match = { class = "widget-term" },
--     float = true,
--     size = "560 300",
--     move = "15 15",
--     pin = true,
--     no_focus = true,
--     border_size = 0,
-- })

-- hl.on("hyprland.start", function ()
--     hl.exec_cmd("~/.config/hypr/scripts/start-widget.sh")
-- end)
