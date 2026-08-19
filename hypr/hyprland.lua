
------------------------------
---- ENVIRONMET VARIABLES ----
------------------------------

-- See https://wiki.hypr.land/Configuring/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("STEAM_ENABLE_WAYLAND", "1")

-- start open with file in dolphin
hl.env("XDG_MENU_PREFIX", "arch-")

------------------
---- MONITORS ----
------------------
hl.monitor({
  output    = "DP-1",
  mode      = "1920x1080@144",
  position  = "0x0",
  scale     = "1",
})

hl.monitor({
  output    = "DP-2",
  mode      = "1920x1080@60",
  position  = "1920x0", 
  scale     = "1", 
})

--------------
---- MISC ----
--------------
hl.config({
  misc = {
    force_default_wallpaper = -1,   -- set 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo = false, -- disable random hyprland logo / anime girl background :(
  }
})



----------------------
---- SOURCE FILES ----
----------------------
require("Lua/windowsRuleWorkspaces")
require("Lua/input")
require("Lua/keybinds")
require("Lua/lookAndFeel")
require("Lua/autoStart")






