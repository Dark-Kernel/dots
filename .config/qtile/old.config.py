from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

border = dict(border_width=1)

mod = "mod4"
alt = "mod1"

keys = [
    Key([mod, "shift"], "q",
        lazy.shutdown()),
    Key([mod, "shift"],  "r",
        lazy.restart()),
    Key([mod], "c",
        lazy.window.kill()),
    Key([mod], "q",
        lazy.group.setlayout('max')),
    Key([mod], "s",
        lazy.group.setlayout('stack')),
    Key([mod], "n",
        lazy.group.setlayout('xmonad-tall')),
    Key([mod], "x",
        lazy.group.setlayout('xmonad-tall')),

    # Key([mod], "m",
    #     lazy.window.toggle_maximize()), 
    Key([mod], "Tab",
        lazy.group.next_window()), 
    Key([mod, "shift"], "Tab",
        lazy.group.prev_window(),
        lazy.window.disable_floating()),
    # Bindings to control the layouts
    # Key([mod], "h",
    #     lazy.group.prev_window()), 
    # Key([mod], "l",
    #     lazy.group.next_window()),
    # Key([mod], "f",
    #     lazy.window.toggle_floating()), 
    Key([mod], "f",
        lazy.window.toggle_fullscreen()),
    Key([mod, alt], "j",
        lazy.window.opacity(0.5)), 
    Key([mod, alt], "k",
        lazy.window.opacity(1.0)), 
    # Key([mod, alt], "k",
    #     lazy.window.up_opacity()), 
    Key([mod], "h",
        lazy.layout.previous(), # Stack
        lazy.layout.left()),    # xmonad-tall
    Key([mod], "l",
        lazy.layout.next(),     # Stack
        lazy.layout.right()),   # xmonad-tall
    Key([mod], "k",
        lazy.layout.up()),
    Key([mod], "j",
        lazy.layout.down()),

    # These are unique to stack layout
    Key([mod, "shift"], "l",
        lazy.layout.client_to_next(), # Stack
        lazy.layout.swap_right()),    # xmonad-tall
    Key([mod, "shift"], "h",
        lazy.layout.client_to_previous(), # Stack
        lazy.layout.swap_left()),    # xmonad-tall
    Key([mod, "shift"], "Return",
        lazy.layout.toggle_split()),

    # Multiple function keys
    Key([mod, "shift"], "space",
        lazy.layout.rotate(),
        lazy.layout.flip()),              # xmonad-tall
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up()),       # Stack, xmonad-tall
    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down()),         # Stack, xmonad-tall
    Key([mod], "m",
        lazy.layout.toggle_maximize()), # Stack
    Key([mod, "control"], "m",
        lazy.layout.maximize()),            # xmonad-tall
    Key([mod, "control"], "n",
        lazy.layout.normalize()),            # xmonad-tall
    Key([mod, "control"], "l",
        lazy.layout.delete(),                # Stack
        lazy.layout.increase_ratio(),     # Tile
        lazy.layout.grow()),            # xmonad-tall
    Key([mod, "control"], "h",
        lazy.layout.add(),             # Stack
        lazy.layout.decrease_ratio(),     # Tile
        lazy.layout.shrink()),         # xmonad-tall
    Key([mod, "control"], "k",
        lazy.layout.grow(),             # xmonad-tall
        lazy.layout.decrease_nmaster()),    # Tile
    Key([mod, "control"], "j",
        lazy.layout.shrink(),               # xmonad-tall
        lazy.layout.increase_nmaster()),   # Tile

    # Key([mod], "Tab",
    #     lazy.nextlayout()),

    # interact with prompts
    Key([mod], "r",              lazy.spawncmd()),
    Key([mod], "g",              lazy.switchgroup()),

    # start specific apps
    # Key([mod], "n",              lazy.spawn("firefox")),
    Key([mod], "Return",         lazy.spawn("alacritty")),

    # Change the volume if your keyboard has special volume keys.
    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn("amixer -c 0 -q set Master 2dB+")
    ),
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn("amixer -c 0 -q set Master 2dB-")
    ),
    Key(
        [], "XF86AudioMute",
        lazy.spawn("amixer -c 0 -q set Master toggle")
    ),

    # Also allow changing volume the old fashioned way.
    Key([mod], "equal", lazy.spawn("amixer -c 0 -q set Master 2dB+")),
    Key([mod], "minus", lazy.spawn("amixer -c 0 -q set Master 2dB-")),
]
