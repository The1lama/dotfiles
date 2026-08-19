--------------- 
---- INPUT ----
--------------- 
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/

hl.config({
  input = {
      kb_layout  = "se",
      kb_variant = "",
      kb_model   = "",
      kb_options = "",
      kb_rules   = "",

      follow_mouse = 1,

      sensitivity = -0.7, -- -1.0 - 1.0, 0 means no modification.

      touchpad = {
          natural_scroll = false,
      },
  },
})

-- move between workspaces
hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

-- close window
hl.gesture({
  fingers = 3,
  direction = "down",
  mods = "ALT",
  action = "close"
})

-- fullscreen window
hl.gesture({
  fingers = 3,
  direction = "down",
  mods = "SUPER",
  scale = 1.5,
  action = "fullscreen"
})

-- zoom out to the cursor when pinching out on track pad
hl.gesture({
  fingers = 2, 
  direction = "pinchout",
  action = "cursorZoom",
  zoom_level = 1
})

-- zoom in to the cursor when pinch in on track pad
hl.gesture({
  fingers = 2, 
  direction = "pinchin",
  action = "cursorZoom",
  zoom_level = 1,
  mode = "live"
})
