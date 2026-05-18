--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
  -- Ignore maximize requests from all apps. You'll probably like this.
  name = "suppress-maximize-events",
  match = { class = ".*" },

  suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },

  no_focus = true,
})

hl.window_rule({
  name = "rofi-floating-center",
  match = {
    class = "^rofi$",
  },

  float = true,
})

hl.window_rule({
  name = "calendar-popup",

  match = {
    class = "^kitty$",
    title = "^lvsk-calendar$",
  },

  float = true,
  center = true,

  size = "520 520",
})
