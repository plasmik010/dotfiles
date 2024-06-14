--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "16px Terminus"
--theme.font = "16px LiberMono"
theme.fg   = "#eee"
theme.bg   = "#444"

-- Genaral colours
theme.success_fg = "#0f0"
theme.loaded_fg  = "#33AADD"
theme.error_fg = "#FFF"
theme.error_bg = "#F00"

-- Warning colours
theme.warning_fg = "#F00"
theme.warning_bg = "#FFF"

-- Notification colours
theme.notif_fg = "#444"
theme.notif_bg = "#FFF"

-- Menu colours
theme.menu_fg                   = "#111"
theme.menu_bg                   = "#fff"
theme.menu_selected_fg          = "#111"
theme.menu_selected_bg          = "#FF0"
theme.menu_title_bg             = "#fff"
theme.menu_primary_title_fg     = "#f00"
theme.menu_secondary_title_fg   = "#666"

theme.menu_disabled_fg = "#999"
theme.menu_disabled_bg = theme.menu_bg
theme.menu_enabled_fg = theme.menu_fg
theme.menu_enabled_bg = theme.menu_bg
theme.menu_active_fg = "#060"
theme.menu_active_bg = theme.menu_bg

-- Proxy manager
theme.proxy_active_menu_fg      = '#333'
theme.proxy_active_menu_bg      = '#FFF'
theme.proxy_inactive_menu_fg    = '#888'
theme.proxy_inactive_menu_bg    = '#FFF'

-- Statusbar specific
theme.sbar_fg         = "#ccc"
theme.sbar_bg         = "#161616"

-- Downloadbar specific
theme.dbar_fg         = "#ccc"
theme.dbar_bg         = "#111"
theme.dbar_error_fg   = "#F00"

-- Input bar specific
theme.ibar_fg           = "#ccc"
theme.ibar_bg           = "#111"

-- Tab label
theme.tab_fg            = "#767676"
theme.tab_bg            = "#161616"
theme.tab_hover_bg      = "#202647"
theme.tab_ntheme        = "#ddd"
theme.selected_fg       = "#DDD3CB"
theme.selected_bg       = "#2D3822"
theme.selected_ntheme   = "#ddd"
theme.loading_fg        = "#33AADD"
theme.loading_bg        = "#111"

theme.selected_private_tab_bg = "#3d295b"
theme.private_tab_bg    = "#22254a"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#0F0"
theme.notrust_fg        = "#F00"

-- General colour pairings
theme.ok = { fg = "#aca", bg = "#161616" }
theme.warn = { fg = "#F00", bg = "#FFF" }
theme.error = { fg = "#FFF", bg = "#F00" }

return theme

-- vim: et:sw=4:ts=8:sts=4:tw=80
