import os
import subprocess
from libqtile import bar, extension, hook, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
# Make sure 'qtile-extras' is installed or this config will not work.
#from qtile_extras import widget
#from qtile_extras.widget.decorations import BorderDecoration


mod = "mod4"              # Sets mod key to SUPER/WINDOWS
alt = "mod1"
myTerm = "alacritty"      # My terminal of choice
myBrowser = "firefox-bin"     # My browser of choice
myEditor = "nvim"



### Functions

# A function for hide/show all the windows in a group
@lazy.function
def minimize_all(qtile):
    for win in qtile.current_group.windows:
        if hasattr(win, "toggle_minimize"):
            win.toggle_minimize()

# A function for toggling between MAX and MONADTALL layouts
@lazy.function
def maximize_by_switching_layout(qtile):
    current_layout_name = qtile.current_group.layout.name
    if current_layout_name == 'monadtall':
        qtile.current_group.layout = 'max'
    elif current_layout_name == 'max':
        qtile.current_group.layout = 'monadtall'


keys = [
    # The essentials
    Key([mod], "Return", lazy.spawn(myTerm), desc="Terminal"),
    Key([mod], "Space", lazy.spawn("dmenu_run -b -fn 'JetBrains Mono Nerd Font:size=10.5'"), desc='Dmenu Launcher'),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod,alt], "q", lazy.spawn("dm-logout -r"), desc="Logout menu"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    
    # Switch between windows
    # Some layouts like 'monadtall' only need to use j/k to move
    # through the stack, but other layouts like 'columns' will
    # require all four directions h/j/k/l to move around.
    # Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    # Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    # Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    # Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "n", lazy.layout.next(), desc="Move window focus to other window"),

    # # Move windows between left/right columns or move up/down in current stack.
    # # Moving out of range in Columns layout will create new column.
    # Key([mod, "shift"], "h",
    #     lazy.layout.shuffle_left(),
    #     lazy.layout.move_left().when(layout=["treetab"]),
    #     desc="Move window to the left/move tab left in treetab"),

    # Key([mod, "shift"], "l",
    #     lazy.layout.shuffle_right(),
    #     lazy.layout.move_right().when(layout=["treetab"]),
    #     desc="Move window to the right/move tab right in treetab"),

    # Key([mod, "shift"], "j",
    #     lazy.layout.shuffle_down(),
    #     lazy.layout.section_down().when(layout=["treetab"]),
    #     desc="Move window down/move down a section in treetab"
    # ),
    # Key([mod, "shift"], "k",
    #     lazy.layout.shuffle_up(),
    #     lazy.layout.section_up().when(layout=["treetab"]),
    #     desc="Move window downup/move up a section in treetab"
    # ),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "space", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),


    # Grow/shrink windows left/right. 
    # This is mainly for the 'monadtall' and 'monadwide' layouts
    # although it does also work in the 'bsp' and 'columns' layouts.
    Key([mod], "equal",
        lazy.layout.grow_left().when(layout=["bsp", "columns"]),
        lazy.layout.grow().when(layout=["monadtall", "monadwide"]),
        desc="Grow window to the left"
    ),
    Key([mod], "minus",
        lazy.layout.grow_right().when(layout=["bsp", "columns"]),
        lazy.layout.shrink().when(layout=["monadtall", "monadwide"]),
        desc="Grow window to the left"
    ),

    # Grow windows up, down, left, right.  Only works in certain layouts.
    # Works in 'bsp' and 'columns' layout.
    Key([mod, alt], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, alt], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, alt], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, alt], "k", lazy.layout.grow_up(), desc="Grow window up"),
    # Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "m", lazy.layout.maximize(), desc='Toggle between min and max sizes'),
    Key([mod], "t", lazy.window.toggle_floating(), desc='toggle floating'),
    Key([mod], "f", maximize_by_switching_layout(), lazy.window.toggle_fullscreen(), desc='toggle fullscreen'),
    Key([mod, "shift"], "m", minimize_all(), desc="Toggle hide/show all windows on current group"),

]


