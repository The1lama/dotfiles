---------------------
---- MY PROGRAMS ----
---------------------
local terminal    = "kitty"

-------------------
---- AUTOSTART ----
-------------------


hl.on("hyprland.start", function ()
  -- start polkit authentication agent
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  -- start keyring deamon
  hl.exec_cmd("/usr/bin/gnome-keyring-deamon --start --components=secrets")
  -- start notification deamo
  hl.exec_cmd("dunst")

  -- start waybar, wallpaper and lock the screen
  hl.exec_cmd("waybar")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("hyprlock")

  -- start macro/remapping program for capslock
  hl.exec_cmd("keyd")


  -- open applications
  hl.exec_cmd(terminal)
  hl.exec_cmd("discord")
  hl.exec_cmd("steam")

  -- run a git pull for obsidian notes from repo
  hl.exec_cmd("bash ~/Script/GitPullObsidian.sh")

end)









