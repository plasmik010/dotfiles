
-- /usr/share/luakit/lib/binds.lua

local select = require "select"
select.label_maker = function ()
    local chars = charset("qwertyasdfghzxcvb")
    return trim(sort(reverse(chars)))
end

local settings = require "settings"
settings.window.home_page = "opennet.ru"

-- Add download support
local downloads = require "downloads"
downloads.default_dir = "/ln/dwn"
local taborder = require("taborder")

local engines = settings.window.search_engines
engines.aur    = "https://aur.archlinux.org/packages.php?O=0&K=%s&do_Search=Go"
engines.metal  = "https://www.metal-archives.com/search?searchString=%s&type=band_name"
engines.red    = "https://redacted.ch/torrents.php?searchstr=%s"
engines.ap     = "https://apollo.rip/torrents.php?searchstr=%s"
engines.ru     = "https://rutracker.org/forum/tracker.php?nm=%s"
engines.duck   = "https://duckduckgo.com/?q=%s"
engines.m      = "https://www.multitran.ru/c/m.exe?CL=1&s=%s"
engines.y      = "https://yandex.ru/search/?text=%s"
engines.you    = "https://www.youtube.com/results?search_query=%s"

local modes = require "modes"

-- modes.add_binds("ex-follow", {
--     { "y", [[Hint all links (as defined by the `follow.selectors.uri`
--         selector) and set the primary selection to the matched elements URI.]],
--         function (w)
--             w:set_mode("follow", {
--                 prompt = "yank", selector = "uri", evaluator = "uri",
--                 func = function (uri)
--                     assert(type(uri) == "string")
--                     uri = uri:gsub(" ", "%%20"):gsub("^mailto:", "")
--                     luakit.selection.clipboard = uri
--                     -- w:notify("Yanked uri: " .. uri, false)
--                     w:notify("Yanked uri (to clipboard): " .. uri)
--                 end
--             })
--         end },
--     })

modes.add_binds("insert", {
    { "<Alt-o", "Return to `normal` mode.", function (w) w:set_mode() end },
    { "<Control-o>", "Return to `normal` mode.", function (w) w:set_mode() end },
    { "<Alt-Return>", "Return to `normal` mode.", function (w) w:set_mode() end },
    { "<Control-m>", "Return to `normal` mode.", function (w) w:set_mode() end },
})

modes.add_binds("normal", {
    { "C", "Enter `command` mode.", function (w) w:set_mode("command") end, {} },
    { "<Scroll>", "Scroll current page", function (w, o)
        w:scroll{ yrel = settings.get_setting("window.scroll_step")*o.dy } end },
    { "^gl$", "Open the bookmarks manager in the current tab.",
        function(w) w:navigate("luakit://bookmarks/") end },
    { "gb", "prev tab", function (w) w:prev_tab() end },
    { ",", "prev tab", function (w) w:prev_tab() end },
    { ".", "next tab", function (w) w:next_tab() end },
    { "ab", "Go back", function(w,m) w:back() end },
    { "af", "Go forward", function(w,m) w:forward() end },
    { "d", "noth", function() end },
    { "x", "Close tab(s)", function(w,m) for _=1,m.count do w:close_tab() end end, {count=1} },
    { "^aq$", "Quit and don't save the session.", function (w) w:close_win() end },
    { "<space>", "Scroll golden down", function(w) w:scroll{ ypagerel =  0.78 } end },
    { "<BackSpace>", "Scroll golden up", function(w) w:scroll{ ypagerel =  -0.78 } end },
    { "d", "Scroll golden down", function(w) w:scroll{ ypagerel =  0.78 } end },
    { "e", "Scroll golden up", function(w) w:scroll{ ypagerel =  -0.78 } end },
    { "s", "Scroll", function(w,m) w:scroll{ yrel = settings.get_setting("window.scroll_step")*(m.count or 1) } end },
    { "w", "Scrollup", function(w,m) w:scroll{ yrel = -settings.get_setting("window.scroll_step")*(m.count or 1) } end },
    { "aw", "Open one or more URLs in a new window.", function (w) w:enter_cmd(":winopen ") end },
    { "<Control-j>", "Scroll down a bit", function (w) w:scroll{ yrel = 15 } end },
    { "<Control-k>", "Scroll up a bit", function (w) w:scroll{ yrel = -15 } end },
    { "ac", "Open in chrome", function(w) luakit.spawn(string.format("chromium %s", w.view.uri)) end },
    { "ad", "Downloads", function(w) w:run_cmd(":downloads") end },
    { "al", "Save file", function (w) w:run_cmd(":download") end },

    { "^at$", "New Tab", function(w) w:new_tab({uri = "luakit://newtab/"}, {order = taborder.after_current}) end },

    { "^ag$", "Open previous page in new tab.",
        function (w)
        local params = {
            { session_state = w.view.session_state },
            { private = w.view.private, order = taborder.after_current }
        }
        -- local view = w:new_tab({session_state = tab.session_state})
        if w.view.history.index > 1 then
            urli = w.view.history.items[w.view.history.index - 1].uri
            -- w:new_tab( { session_state = w.view.session_state , uri = w.view.history.items[w.view.history.index - 1].uri} )
            -- w:new_tab(unpack(params))
            local view = w:new_tab({session_state = w.view.session_state}, {order = taborder.after_current}, {uri = urli})
            -- w:notify(urli)
            -- w:new_tab({uri = urli})
            -- view.uri = urli
        end
    end },

    { "^ah$", "Duplicate current tab.",
        function (w)
            local params = {
                { session_state = w.view.session_state },
                { private = w.view.private, order = taborder.after_current }
            }
            urli = w.view.history.items[w.view.history.index - 1].uri
            -- w:navigate(urli)
            w:back(1)
            w:new_tab(unpack(params))
            -- w:notify(urli)
            end
        },

  { "^as$", "Enter `insert` mode.", function (w) w:set_mode("insert") end, {} },

-- { "^as$", "load session",
-- -- Restore last saved session
-- function (w)
-- local e = (not luakit.nounique) and (session and session.restore())
-- if e then
--     for i, uri in ipairs(uris) do
--         w:new_tab(uri, { switch = i == 1 })
--     end
-- else
--     -- Or open new window
--     -- window.new(uris)
-- end
-- end
-- },

  { "av", "Stop youtube playback",
        function(w)
            w.view:eval_js(
                "document.querySelector('video').pause()", {
                    no_return = true,
                    callback = function (_, err)
                        w:error(err)
                    end,
                }
            )
        end
    },
    { "v", "Stop youtube playback and open this page in mpv",
        function(w)
            w.view:eval_js(
                "document.querySelector('video').pause()", {
                    no_return = true,
                    callback = function (_, err)
                        w:error(err)
                    end,
                }
            )
            -- local uri = w.view.uri
            luakit.spawn(string.format("mpv %s --geometry=800x450-15-15 --title='${media-title}'",w.view.uri))
            -- luakit.spawn(string.format("mpv %s --fullscreen --geometry=800x450-15-15 --title='${media-title} .floatme'",w.view.uri))
        end
    },

})

