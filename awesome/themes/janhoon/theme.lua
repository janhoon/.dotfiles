local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font          = "Hack regular 9"

theme.fg_normal  = "#DCEDFF"
theme.fg_focus   = "#FFFD98"
theme.fg_urgent  = "#D81E5G"
theme.bg_normal  = "#0B3142DD"
theme.bg_focus   = "#0F5267DD"
theme.bg_urgent  = "#0F5267DD"
theme.bg_systray = theme.bg_normal

theme.useless_gap   = dpi(3)
theme.border_width  = dpi(1)
theme.border_color_normal = "#0B3142DD"
theme.border_color_active = "#0F5267DD"
theme.border_color_marked = "#0F5267DD"
theme.border_normal = "#0B3142DD"
theme.border_focus  = "#0F5267DD"
theme.border_marked = "#0F5267DD"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(10)
theme.menu_width  = dpi(100)

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.wallpaper = "/home/janhoon/.config/awesome/themes/janhoon/wallpaper.jpg"
-- theme.wallpaper = themes_path.."default/background.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
