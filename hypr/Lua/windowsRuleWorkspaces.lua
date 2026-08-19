--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

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

-- Workspaces
hl.workspace_rule({
	workspace = "1",
	monitor = "DP-1",
})

hl.workspace_rule({
	workspace = "2",
	monitor = "DP-2",
})

-- spawn discord on second workspace without focusing on it
hl.window_rule({
	enabled = true,
	name = "Open discord at second monitor",
	match = { class = "^discord$" },
	workspace = "2 silent",
})

-- spawn steam on second workspace without focusing on it
hl.window_rule({
	enabled = true,
	name = "Open steam at second monitor",
	match = { class = "^steam$" },
	workspace = "2 silent",
})

------------------------------
---- FLOATING SUB WINDOWS ----
------------------------------

hl.window_rule({
	enabled = true,
	name = "Open dolphin in floating windows",
	match = { class = "^org.kde.dolphin$" },
	float = true,
	size = "990 725",
	center = true,
})

hl.window_rule({
	enabled = true,
	name = "Open qview in floating windows",
	match = { class = "^com.interversehq.qView$" },
	float = true,
	size = "990 725",
	center = true,
})

--hl.window_rule({
--  enabled = true,
--  name    = "Open VLC in floating windows",
--  match   =  { class = "^vlc$" },
--  float   = true,
--  size = "990 725",
--  center = true,
--})

hl.window_rule({
	enabled = true,
	name = "Open steam sub windows in floating state",
	match = {
		class = "^(steam)$",
		title = "^(?!Steam).*$",
	},
	float = true,
	size = "990 725",
	center = true,
})

-- Media Defaults

hl.window_rule({
	match = {
		class = "^qView$",
	},

	opacity = "1 1",
	size = "1000 800",
	center = true,
	float = true,
	rounding = 0,
	border_size = 0,
})
