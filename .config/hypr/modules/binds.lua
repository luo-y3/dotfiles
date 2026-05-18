---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "kitty"
local fileManager = "dolphin"
local menu = "bash ~/.config/rofi/launcher.sh"
local clipboard = "bash ~/.config/rofi/clipboard.sh"
local clipboard_c = "bash ~/.config/rofi/clipboard_clear.sh"
local waybar = "bash ~/.config/waybar/scripts/launch.sh"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local mainMod2 = "ALT"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod2 .. " + BACKSPACE", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
--
-- closeWindowBind:set_enabled(false)
hl.bind(
  mainMod .. " + M",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod2 .. " + R", hl.dsp.exec_cmd(waybar))
hl.bind(mainMod2 .. " + DELETE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Screenshot & Clipboard
hl.bind(
  mainMod2 .. " + SHIFT + S",
  hl.dsp.exec_cmd(
    [[sh -c 'FILE=~/Pictures/Screenshots/$(date +%y-%m-%d_%H-%M-%S).png && grim -g "$(slurp)" "$FILE" && wl-copy < "$FILE" && notify-send -i "$FILE" "Screenshot Saved" "$FILE"' ]]
  )
)
hl.bind(
  mainMod2 .. " + SHIFT + F12",
  hl.dsp.exec_cmd(
    [[sh -c 'FILE=~/Pictures/Screenshots/$(date +%y-%m-%d_%H-%M-%S).png && grim "$FILE" && wl-copy < "$FILE" && notify-send -i "$FILE" "Screenshot Saved" "Copied to clipboard"' ]]
  )
)
hl.bind(mainMod2 .. " + CTRL + V", hl.dsp.exec_cmd(clipboard))
hl.bind(mainMod2 .. " + CTRL + DELETE", hl.dsp.exec_cmd(clipboard_c))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + TAB", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.window.move({ workspace = "special:magic" }))
-- Cycle to the next available workspace
hl.bind(mainMod2 .. " + Tab", function()
  hl.dispatch(hl.dsp.focus({ workspace = "e+1" }))
end)

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
